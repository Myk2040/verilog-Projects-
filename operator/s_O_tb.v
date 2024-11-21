module logical_op();
     
	 reg [7:0]b;
	 reg signed [7:0]a;
	  reg signed [7:0]c;
	
	
 
    
	initial begin
	
	  b=8'b11001010;
	  a=8'b11001010;
	  c=8'b01001010;
	 
	  
	   
	    $display("right shift = %b",b>>1 ); 
		$display("left shift = %b",b<<1 ); 
		$display("right shift = %b",b>>>1 ); 
		$display("left shift = %b",b<<<1 ); 
			$display("right shift = %b",a>>>1 ); 
		$display("left shift = %b",a<<<1 ); 
			$display("right shift = %b",c>>>1 ); 
		$display("left shift = %b",c<<<1 ); 
		 
		 
	  
		
		

      
    end
	
endmodule