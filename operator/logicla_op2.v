module logical_op2();

       reg [3:0] a, b;

      

initial
       begin

a = 5; b = 12; $display ("logical_and = %b",(a==5) && (b<7));

a = 5; b = 4;  $display ("logical_and = %b",(a==5) && (b<7));

a = 3; b = 4;  $display ("logical_and = %b",(a==5) && (b<7));

end

endmodule