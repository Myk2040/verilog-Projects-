module reduction_op();
     
	 reg [3:0]a;
	 reg [3:0]b;
	
 
    
	initial begin
	
	  a=4'b1100;
	  b=4'b1010;
	   
	   // and gets
	   
	    $display("logical_and = %b",&b ); 
		 $display("logical_and = %b",&a); 
		 
	   // nand gets
	   
	    $display("logical_nand = %b",~&b);
        $display("logical_nand = %b",~&a); 		
	
		
		// or gets
	   
	    $display("logical_or = %b",|b ); 
		$display("logical_or = %b",|a  ); 
		
			// nor gets
	   
	    $display("logical_nor = %b",~|b   );
        $display("logical_nor = %b",~|a   ); 		
		
		
		// xor gets
	   
	    $display("logical_xor = %b",^b   ); 
			   
	    $display("logical_xor = %b",^a   ); 
		
		
		// xnor gets
	   
	    $display("logical_xnor = %b",~^b ); 
		$display("logical_xnor = %b",~^a ); 
		
		
		
		// negation gets
	   
	    $display("logical_or = %b",~b  ); 
		
		$display("logical_or  = %b",~a  ); 
		
		

      
    end
	
endmodule

    /*Loading work.reduction_op(fast)
# run -all
# logical_and = 0
# logical_and = 0
# logical_nand = 1
# logical_nand = 1
# logical_or = 1
# logical_or = 1
# logical_nor = 0
# logical_nor = 0
# logical_xor = 0
# logical_xor = 0
# logical_xnor = 1
# logical_xnor = 1
# logical_or = 0101
# logical_or  = 0011
                               */