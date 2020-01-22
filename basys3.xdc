## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]



#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {forwardleft}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {forwardleft}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {forwardright}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {forwardright}]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {backwardleft}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {backwardleft}]
#Sch name = JC8	
set_property PACKAGE_PIN M19 [get_ports {backwardright}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {backwardright}]	
	
	
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {falling}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {falling}]


#ja34below
#Sch name = JB1
#set_property PACKAGE_PIN J2 [get_ports {echo1}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {echo1}]
##Sch name = JB2
#set_property PACKAGE_PIN G2 [get_ports {trigger1}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {trigger1}]

#ROTATİNGJA78
    #Sch name = JB3
set_property PACKAGE_PIN H2 [get_ports {echo}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {echo}]
    #Sch name = JB4
set_property PACKAGE_PIN G3 [get_ports {trigger}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {trigger}]

#JC34LEFT

#Sch name = JB7
set_property PACKAGE_PIN N17 [get_ports {echo2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {echo2}]
#Sch name = JB8
set_property PACKAGE_PIN P18 [get_ports {trigger2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {trigger2}]

#JC78RIGHT

#Sch name = JB9
set_property PACKAGE_PIN P17 [get_ports {echo3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {echo3}]
#Sch name = JB10 
set_property PACKAGE_PIN R18 [get_ports {trigger3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {trigger3}]


	
##7 segment display
#set_property PACKAGE_PIN W7 [get_ports {SEGMENTS[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[0]}]
#set_property PACKAGE_PIN W6 [get_ports {SEGMENTS[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[1]}]
#set_property PACKAGE_PIN U8 [get_ports {SEGMENTS[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[2]}]
#set_property PACKAGE_PIN V8 [get_ports {SEGMENTS[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[3]}]
#set_property PACKAGE_PIN U5 [get_ports {SEGMENTS[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[4]}]
#set_property PACKAGE_PIN V5 [get_ports {SEGMENTS[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[5]}]
#set_property PACKAGE_PIN U7 [get_ports {SEGMENTS[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENTS[6]}]


#set_property PACKAGE_PIN U2 [get_ports {SEG_SEC[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_SEC[0]}]
#set_property PACKAGE_PIN U4 [get_ports {SEG_SEC[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_SEC[1]}]
#set_property PACKAGE_PIN V4 [get_ports {SEG_SEC[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_SEC[2]}]
#set_property PACKAGE_PIN W4 [get_ports {SEG_SEC[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG_SEC[3]}]
	
#set_property PACKAGE_PIN U17 [get_ports speed_control_in[0]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports speed_control_in[0]] 
#set_property PACKAGE_PIN T18 [get_ports speed_control_in[1]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports speed_control_in[1]]
	
set_property PACKAGE_PIN K17 [get_ports motor_data_out]					
        set_property IOSTANDARD LVCMOS33 [get_ports motor_data_out]
        
## Switches
#set_property PACKAGE_PIN V17 [get_ports {switch1}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {switch1}]
#set_property PACKAGE_PIN V16 [get_ports {direction[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {direction[0]}]
#set_property PACKAGE_PIN W16 [get_ports {direction[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {direction[1]}]
	
