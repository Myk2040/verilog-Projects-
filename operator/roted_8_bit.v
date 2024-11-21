module tb();
     
	 reg [7:0]b;
	 wire [7:0]a;
	 
	
	
 assign a = (b>>1)|(b<<7);
    
	initial begin
	
	  b=8'b11000011;
	 
	  
	 
	  
	  $display (" bit roted = %0b" , a ); 
	   
		 
		 
	end
	
endmodule