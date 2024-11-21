module logical_op();
     
	 reg [2:0]a;
	 reg b,c,d,e,f;
	
 
    
	initial begin
	
	   a=5;
	   b=3'b000;
	   c=3'b101; 
	   d=1'bx;
	   e=1'bz;
	   f=3'b111;
	   
	   
	   
	    $display("logical_and = %b",a&&b  ); //0
		$display("logical_and = %b",a&&c ); //1
		$display("logical_and = %b",a&&d ); //x
		$display("logical_and = %b",a&&e ); //x
		$display("logical_and = %b",(a<5)&&(f<5));  //0
		$display("logical_and = %b",(a>5)&&(f<5));  //1
        $display("logical_and = %b",(a>2)&&(f<5)); //0
		
		$display("logical_or   = %b",(a>2)||(f>6)  ); //1
		$display("logical_or   = %b",(a<2)||(f>6); //0
	    $display("logical_or   = %b",(a>2)||(f<6)  ); //1
		$display("logical_or   = %b",a||b  ); //1
		$display("logical_or   = %b",a||c  );//1
		$display("logical_or   = %b",a||d );//0
		$display("logical_or   = %b",a||e );//0
		$display("logical_or   = %b",a||f );//0
		
		
		
		$display("logical_not = %b",!a );  //1
		$display("logical_not = %b",!b );  //0
		$display("logical_not = %b",!c );  //1
		$display("logical_not = %b",!d );  //0
		$display("logical_not = %b",!e );  //1
		$display("logical_not = %b",!f );  //0

      
    end
	
endmodule