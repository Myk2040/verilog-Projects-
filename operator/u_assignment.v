module tb();
     
	 reg [7:0]a = 8'd12; 
	 reg [9:0]b = 9'o345;
	 reg [2:0]c = 3'b100;
initial 
    begin
	
	$display (" value a  = %0d" , a );
    $display (" value b  = %0o" , b );
    $display (" value c  = %0b" , c );	
	   
		 
	end
	
endmodule