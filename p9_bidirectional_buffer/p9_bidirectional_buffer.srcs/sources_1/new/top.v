`timescale 1ns / 1ps


module top(
             inout a,b,
             input ctrl
                      );
/*                      
  bufif1  g1(b,a, ctrl);
 // bufif0  g2(a,b, ctrl);
  bufif1  g3(a,b, (!ctrl));
    */
    
    assign b = (ctrl) ? a: 1'bz; 
    assign a = (!ctrl) ? b: 1'bz; 
                 
                      
    
    
endmodule
