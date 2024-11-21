module logical_op();
     
	 reg [3:0]a;
	 reg [3:0]b;
	
 
    
	initial begin
	
	  a=4'b1100;
	  b=4'b1010;
	   
	   // and gets
	   
	    $display("logical_and = %b, %d",a&b, a&b ); 
		 
	   // nand gets
	   
	    $display("logical_nand = %b, %d",~(a&b),~(a&b)); 
	
		
		// or gets
	   
	    $display("logical_or = %b, %d",a|b ,a|b  ); 
		
		
		
			// nor gets
	   
	    $display("logical_nor = %b, %d",~(a|b) ,~(a|b)  ); 
		
		
		// xor gets
	   
	    $display("logical_xor = %b, %d",a^b  ,a^b ); 
		
		
		// xnor gets
	   
	    $display("logical_xnor = %b, %d",a~^b  ,a~^b ); 
		
		
		
		// negation gets
	   
	    $display("logical_or = %b, %d",~b,~b  ); 
		
		$display("logical_or  = %b, %d",~a , ~a  ); 
		
	

      
    end
	
endmodule

 /*run -all
# logical_and = 1000,  8
# logical_nand = 0111,  7
# logical_or = 1110, 14
# logical_nor = 0001,  1
# logical_xor = 0110,  6
# logical_xnor = 1001,  9
# logical_or = 0101,  5
# logical_or  = 0011,  3

 */