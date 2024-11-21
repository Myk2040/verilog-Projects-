module tb();
    
	
	reg [7:0]a,b,c,d,e,f,g,h;
	
 initial 
    
	begin
	  a=8'd45;
	  b=8'd0;
	  c=8'dx;
	  d=8'b101z;
	  e= 9;
	  f= 4;
	  g= 3;
      h= 5;	  
	  
	  $display ("logical_and = %b",a&&e);
	  $display ("logical_and = %b",b&&f );
	  $display ("logical_and = %b",c&&g );
	  $display ("logical_and = %b",d&&h );
	  
	  $display ("logical_or = %b",a||e);
	  $display ("logical_or = %b",b||f );
	  $display ("logical_or = %b",c||g );
	  $display ("logical_or = %b",d||h );
	  
	  $display ("logical_negation = %b",!b);
	  $display ("logical_negation = %b",!f);
	  
	  
	  
	end
	
endmodule