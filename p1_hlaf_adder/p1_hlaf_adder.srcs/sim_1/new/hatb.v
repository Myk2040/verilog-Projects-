`timescale 1ns / 1ps

module hatb();


  reg [1:0]a;
  wire sum,carry;
  wire [1:0]exp_value;
 
  half_adder dut(a,sum,carry);
 
 initial
   begin
        a = 2'b00;
   #5  a = 2'b01;
   #5  a = 2'b10; 
   #5  a = 2'b11;
   #5  a = 2'b00;
   #5
   
   $finish;
    end
	

 assign exp_value = a[0] + a[1]; 

 
 always@(*)
   begin
     if (exp_value == {carry,sum})
	    $display (" pass , %b,%b",carry,sum);
	else  
	    $display (" fail , %b,%b",carry,sum);  
    end
 
	
	
	
	
	
	
endmodule