#makefile

RTL = ../RTL/vending_machine.v
TB =  ../TB/tb.v
top = tb

lib :
		vlib work 
	
comp :
		vlog $(RTL) $(TB)

sim_gui :
		vsim -novopt $(top)

sim :
		vsim -novopt $(top) -c -do "run -all ; exit"
		
run_gui :
		lib  comp sim_gui
run :
		lib  comp sim
		
		

		

		
		