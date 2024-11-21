module APBs #(
 parameter wait_st = 0
)
(
    input CLK,Rst,PSELs,PENABLEs,PWRITEs,
    input [4:0] PADDRs,
    input [7:0] PWDATAs,
    output PREADYs,
    output reg PSLVerror,
    output reg [7:0] PRDATAs,
    output reg [1:0] P_stsSLV,N_stsSLV
);

reg [7:0] SLVmemory [31:0];//Slave memory write and read for master 

reg error, error_addr, error_read,error_write; //Various error 
reg v = 0;
integer i;
parameter [1:0] IDLE = 2'b00, //three states of APB slave and master
                SETUP = 2'b01,
                ACCESS = 2'b10;

reg [7:0] writetemp, readtemp;
reg [4:0] addrtemp;

//waited states
reg [7:0] wait_sts = wait_st;
reg [7:0] t_counter;

assign PREADYs = (Rst && N_stsSLV == ACCESS && t_counter==wait_sts)? 1'b1 : 1'b0;
always @(posedge CLK or posedge Rst ) begin //asynchornous reset 
   if(!Rst) begin //active low
        P_stsSLV <= IDLE;//initial state
      	PRDATAs <= 0; //read data
			//	PREADYs <= 0;
				PSLVerror <= 0;
	for(i=0; i < 32; i = i+1) begin
	SLVmemory[i] <= 0;
	end
    end
    else begin
        P_stsSLV <= N_stsSLV;
    end
end

always @(*) begin // PCLK change
   
    case(P_stsSLV) 
    IDLE:  begin
            //PREADYs = 0; 
            PRDATAs = 8'b0;
						PSLVerror = 0;
            if(PSELs && !PENABLEs)  N_stsSLV = SETUP;
            else begin
                N_stsSLV = IDLE;
            end
    end
    SETUP: begin
            // PREADY <= 0;
						//PREADYs = 0;
						PSLVerror = 0;
						PRDATAs = 0;
            if(PSELs && PENABLEs)  begin 
                N_stsSLV = ACCESS;
								//addrtemp = PADDRs;
							//	PREADYs = 1;
								writetemp = PWDATAs;
						end
            else begin
						    //PREADYs = 0;
                N_stsSLV = SETUP;
								//if these signals does not arrive on time
								//the this will creat the apb protocol violation
							//	$error("Valid Control signals not received!!!!");
            end
    end
    ACCESS:  begin: Access
            //PREADYs= 1;

            if(PENABLEs && PSELs && PWRITEs) begin: write
                //SLVmemory[addrtemp] = writetemp;

								//TODO:
								//ADD LOGIC FOR WAITED STATES TRANSFERS
                SLVmemory[PADDRs] = PWDATAs;
                $display("memory %0h",PWDATAs);
					 end: write
					 //else
					 if(PENABLEs && PSELs & !PWRITEs)begin: read				
               // PRDATAs = SLVmemory[addrtemp];					
								
                PRDATAs = SLVmemory[PADDRs];					
                $display("memory %0h",PADDRs); 
           end: read

            if(PREADYs && PSELs && !PENABLEs) begin
                N_stsSLV= SETUP;
            end
				    else if(!PREADYs && PSELs && PENABLEs) begin
						N_stsSLV = ACCESS;
						end
	   			  else if(!PSELs) begin
						N_stsSLV = IDLE;
						end
    end: Access 
    endcase
end
    
//will deal with error regrading unknow/undefined memory addresses for write and read transfers
always @(*) begin
     PSLVerror = error || error_addr || error_read || error_write;
    if(!Rst) begin
        error <= 0;
    end
    else begin
      if((PADDRs === 5'dx || PADDRs > 5'd28) && (PSELs) && (PENABLEs) && (PREADYs))
		  error_addr = 1;
	  else error_addr = 0;
          end
          
	  if(((PRDATAs === 8'dx) || PRDATAs > 8'd255 ) && (PSELs) && (PENABLEs) && (PREADYs))
		  error_read = 1;
	  else  error_read = 0;
          begin
          if((( PWDATAs === 8'dx) || PWDATAs > 8'd255) && (PSELs) && (PENABLEs) && (PREADYs))
		   error_write = 1;
          else error_write = 0;
          end   

    end

always @(posedge CLK) begin
		if(!Rst || N_stsSLV == IDLE || N_stsSLV == SETUP) begin
		 t_counter <= 0;//max 8 cycle wait
		end
		else begin
			if(t_counter == wait_sts) begin
			t_counter <= 0;
			end
			else begin
			t_counter <= t_counter + 1;
			end
		end
end



endmodule

 
