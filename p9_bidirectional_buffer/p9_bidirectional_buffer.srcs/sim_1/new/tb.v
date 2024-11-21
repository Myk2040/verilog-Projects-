`timescale 1ns / 1ps


module tb();
    reg ctrl;
    wire a,b;
    reg tem_a,tem_b;
  
   top dut(a,b,ctrl);
   assign a = tem_a;
   assign b = tem_b;
    
   initial 
   
   
   
   
   
       begin
         ctrl =1'b1; tem_a =1'b0; tem_b =1'bz;
         #10
         tem_a =1'b1;
         #10
         ctrl =1'b0; tem_b =1'b1; tem_a =1'bz;
         #10
         tem_b =1'b0; 
         #10
         $finish; 
                 
       end
    
endmodule
