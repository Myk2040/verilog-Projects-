module event_schedular();
     
	 reg [8:0]a;
	 
	
 
    
	initial begin

$display("dl : a  = %d",a);
a = 5;

$display("d2: a  = %d",a);
a = 7;

a <= 8;

$strobe("s1 : a = %d",a);

#1;

$display("d3 : a = %d",a);

a = 18;

$display("d4 : a = %d",a);

a <= 32;
a <= 3;

$strobe("s2 : a = %d",a);
$monitor("mon : a = %d",a);

#10;

a = 12;

#10;

a <= 13;

a = 25;

#10;

$finish;
	

      
    end
	
endmodule

 