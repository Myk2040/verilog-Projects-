// AMBA APB 3 Slave Implementation version2.

module APB_slave #(parameter DATA_WIDTH = 32, ADDR=5, DEPTH=32, WAIT_PR=0)  // parameterizing DATA_WIDTH ,DEPTH, ADDR & WAIT
                               (output reg pslverr,
                                output reg pready,
				output reg [(DATA_WIDTH-1):0] prdata,
				input psel,
				input penable,
				input pwrite,
				input presetn,
				input pclk,
				input [(ADDR-1):0] paddr,
				input [(DATA_WIDTH-1):0] pwdata);


// creating the parameter for the next_states
parameter IDLE =2'b00,SETUP=2'b01,ACCESS=2'b10;

// creating the memory
reg  [(DATA_WIDTH-1):0] mem [0:(DEPTH-1)];

// next_state for FSM
reg [1:0] next_state,state;
integer i;
// design working at the posedge of clk and reset is active low and synchronized
  always@(posedge pclk)
  begin
	      		//	$display($time,"Inside always blockte");
   //reset :(to bring design into known state) making prdata,pready,pslverr low and initializing memory
   if(!presetn) begin               
	 			prdata<=0;
	 			pready<=0;
				pslverr<=0;
				for(i=0;i<(DEPTH-11);i=i+1'b1) begin // memory initialization is not required as wdata can be 0 
					mem[i]<=0;end
        state<=IDLE; // when reset , state should be IDLE
	 	end
     
   else 
	 		state<=next_state;  
   end
		   
// Next state logic (Combinational)
  always@(*)
    begin
	 	case(state) 
    //idle state: pready, pslverr, prdata is low and if psel asserted  then SETUP phase
			IDLE: begin
	      			$display($time,"In IDLE state");
				pready=0;
				pslverr=0;
				prdata=0;
		    		if(psel && !penable)
					next_state=SETUP;
				else
					next_state=IDLE;
			end

    //setup state: pready,pslverr,prdata is low and if penable asserrted then ACCESS phase
			SETUP:	begin
	      			$display($time,"In SETUP state");
				pready=0;
				pslverr=0;
				prdata=0;
		     		if(psel && penable) begin
					next_state=ACCESS;
		     		end
	     			else
					//	next_state<=IDLE;
					$error; 
			       	end

   //access state: if pwrite=1 (write into slave memory ) if  pwrite=0 (master will read from slave)  if no further transfer from master then slave will go in ideal state , if further transfer slave will go into setup
			ACCESS:	begin
	      			$display($time,"In ACCESS state");
				pslverr=1'b0;
		   		// Write Operation        
				if(psel && penable && pwrite)begin

					$display($time,"write state");
		             // logic for wait next_state
 		      		   if(WAIT_PR>=0) begin
					   $display($time,"WITH WAIT state");
					   pready=1'b0; 
					   repeat(WAIT_PR)@(posedge pclk);
					   pready=1'b1;
		    			   if(paddr<(DEPTH-11)) begin // valid address 
						   mem[paddr]=pwdata;
					   end
		    			   else begin
						   pslverr=1'b1;
		   				   mem[paddr]=pwdata;
				       	   end
				   end // end of wait_pr
            
           // if wait next_state is not greater then zero
 			  else begin
				 $display($time,"write WITHOUT WAIT state");
			 	 pready=1'b1;
  				if(paddr<(DEPTH-11)) begin // valid address
					mem[paddr]=pwdata;
				end
				else begin
					pslverr=1'b1;
					mem[paddr]=pwdata;
				end
			end
	 	end// end of pwrite

                      
           // Read operation
            if(psel && penable && !pwrite) begin
			 $display($time,"read state");
           		if(WAIT_PR>0) begin
				$display($time,"write WITH WAIT state");
				pready=1'b0; 
				repeat(WAIT_PR)@(posedge pclk);
				pready=1'b1;
				pslverr=1'b0;
				if(paddr<(DEPTH-11)) begin // valid memory till 20
					prdata=mem[paddr];
				end
   		       //so if the address  would be invalid it will assert the pslverr and will check if the master wants to transfer again or want to disconnect
                       else begin
 				pslverr=1'b1;
				prdata=mem[paddr];
          			end
  	end // end of wait_pr
	// if wait next_state is not greater then zero
	else begin
		$display($time,"Read WITHOUT WAIT state");
		pready=1'b1;
		pslverr=1'b0;
		if(paddr<(DEPTH-11)) begin // valid memory till 20
			prdata=mem[paddr];
		end
	   	//so if the address  would be invalid it will assert the pslverr and will check if the master wants to transfer again or want to disconnect
		else begin
			pslverr=1'b1;
			prdata=mem[paddr];
		end
	 end
     end // end of read
      	// for further transfer
        		else if(psel && !penable && pready) begin
           		next_state=SETUP;
        		end
     		 // no futher tranfer
        		else if(!psel && !penable && pready) begin
       		 		next_state=IDLE;
        		end

        // when pready=0
          else begin
         		 next_state=ACCESS;
          end

  	 	 end // end of access
	  endcase

	end // end always

 /* assign prdata=(pready && next_state==ACCESS && !pwrite)? mem[paddr]:'b0;
  assign pslverr=(paddr<(DEPTH-11))?1'b0:1'b1;
  assign pready=(next_state==ACCESS)?((WAIT_PR>0)?(count==WAIT_PR?1'b1:1'b0):1'b1):'b0;*/

endmodule
