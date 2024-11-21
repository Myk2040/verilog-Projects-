module logical_op();
     
	 reg [2:0]b,h,k;
	 reg [2:0]d,f,l;
	 reg signed [2:0]a, e,i;
	 reg signed [2:0]c,g,j;
	
	
 
    
	initial begin
	
	 a= 3'b001;     b = 3'b110;
	 c= 3'b101;     d = 3'b001;
	 e= 3'b110;     f = 3'b110;
	 g= 3'b111;     h = 3'b1x0;
	 i= 3'b1x1;    j = 3'b1x1;
	 k= 3'b10z;    l = 3'b11z;
	 
	 
	     $display("eqvality = %b",a===b ); // sign unsign
		 $display("eqvality = %b",c===d ); //  sign unsign same number 
		 $display("eqvality = %b",e===f ); // sign unsign
		 $display("eqvality = %b",g===h ); //  sign unsign same number
		  $display("eqvality = %b",i===j ); // sign unsign
		 $display("eqvality = %b",k===l ); //  sign unsign same number 
		 
		 $display("eqvality = %b",a!==b ); // sign unsign
		 $display("eqvality = %b",c!==d ); //  sign unsign same number 
		 $display("eqvality = %b",e!==f ); // sign unsign
		 $display("eqvality = %b",g!==h ); //  sign unsign same number
		  $display("eqvality = %b",i!==j ); // sign unsign
		 $display("eqvality = %b",k!==l ); //  sign unsign same number 
		 
		 $display("eqvality = %b",a==b ); // sign unsign
		 $display("eqvality = %b",c==d ); //  sign unsign same number 
		 $display("eqvality = %b",e==f ); // sign unsign
		 $display("eqvality = %b",g==h ); //  sign unsign same number
		  $display("eqvality = %b",i==j ); // sign unsign
		 $display("eqvality = %b",k==l ); //  sign unsign same number 
		 
		 
		  $display("eqvality = %b",a!=b ); // sign unsign
		 $display("eqvality = %b",c!=d ); //  sign unsign same number 
		 $display("eqvality = %b",e!=f ); // sign unsign
		 $display("eqvality = %b",g!=h ); //  sign unsign same number
		  $display("eqvality = %b",i!=j ); // sign unsign
		 $display("eqvality = %b",k!=l ); //  sign unsign same number 
		 
		 
		 end
	
endmodule

/*
# Loading work.logical_op(fast)
# run -all
# eqvality = 0
# eqvality = 0
# eqvality = 1
# eqvality = 0
# eqvality = 1
# eqvality = 0
# eqvality = 1
# eqvality = 1
# eqvality = 0
# eqvality = 1
# eqvality = 0
# eqvality = 1
# eqvality = 0
# eqvality = 0
# eqvality = 1
# eqvality = 0
# eqvality = x
# eqvality = 0
# eqvality = 1
# eqvality = 1
# eqvality = 0
# eqvality = 1
# eqvality = x
# eqvality = 1   

*/


