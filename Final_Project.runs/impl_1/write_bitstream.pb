
Q
Command: %s
53*	vivadotcl2 
write_bitstream -force top.bitZ4-113h px� 

@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2	
xc7a35tZ17-347h px� 
o
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2	
xc7a35tZ17-349h px� 
f
,Running DRC as a precondition to command %s
1349*	planAhead2
write_bitstreamZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
�Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2
 DRC|Pin Planning8ZCFGBVS-1h px� 
�
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC2'
 !DRC|DRC System|Rule limit reached8ZCHECK-3h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC22
 ".
uut/keycode_reg[5]_0uut/keycode_reg[5]_022
 ".
uut/is_cap_reg_i_2/Ouut/is_cap_reg_i_2/O2.
 "*
uut/is_cap_reg_i_2	uut/is_cap_reg_i_22+
 %DRC|Physical Configuration|Chip Level8ZPDRC-153h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[12]at/sel_0/ADDRARDADDR[12]2
 "

at/sel[11]
at/sel[11]26
 "2
vga/h_count_reg_reg[3]	vga/h_count_reg_reg[3]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[12]at/sel_0/ADDRARDADDR[12]2
 "

at/sel[11]
at/sel[11]26
 "2
vga/h_count_reg_reg[4]	vga/h_count_reg_reg[4]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[12]at/sel_0/ADDRARDADDR[12]2
 "

at/sel[11]
at/sel[11]26
 "2
vga/h_count_reg_reg[5]	vga/h_count_reg_reg[5]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[12]at/sel_0/ADDRARDADDR[12]2
 "

at/sel[11]
at/sel[11]26
 "2
vga/h_count_reg_reg[6]	vga/h_count_reg_reg[6]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[12]at/sel_0/ADDRARDADDR[12]2
 "

at/sel[11]
at/sel[11]26
 "2
vga/h_count_reg_reg[7]	vga/h_count_reg_reg[7]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[12]at/sel_0/ADDRARDADDR[12]2
 "

at/sel[11]
at/sel[11]26
 "2
vga/v_count_reg_reg[4]	vga/v_count_reg_reg[4]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/h_count_reg_reg[3]	vga/h_count_reg_reg[3]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/h_count_reg_reg[4]	vga/h_count_reg_reg[4]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/h_count_reg_reg[5]	vga/h_count_reg_reg[5]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/h_count_reg_reg[6]	vga/h_count_reg_reg[6]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/h_count_reg_reg[7]	vga/h_count_reg_reg[7]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/v_count_reg_reg[4]	vga/v_count_reg_reg[4]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[13]at/sel_0/ADDRARDADDR[13]2
 "

at/sel[12]
at/sel[12]26
 "2
vga/v_count_reg_reg[5]	vga/v_count_reg_reg[5]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]2D
 "@
vga/h_count_reg_reg[3]_rep__0	vga/h_count_reg_reg[3]_rep__020
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]2D
 "@
vga/h_count_reg_reg[4]_rep__1	vga/h_count_reg_reg[4]_rep__120
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]26
 "2
vga/h_count_reg_reg[5]	vga/h_count_reg_reg[5]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]26
 "2
vga/h_count_reg_reg[6]	vga/h_count_reg_reg[6]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]26
 "2
vga/h_count_reg_reg[7]	vga/h_count_reg_reg[7]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]26
 "2
vga/v_count_reg_reg[4]	vga/v_count_reg_reg[4]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2
 "
at/sel_0	at/sel_02:
 "6
at/sel_0/ADDRARDADDR[14]at/sel_0/ADDRARDADDR[14]2
 "

at/sel[13]
at/sel[13]26
 "2
vga/v_count_reg_reg[5]	vga/v_count_reg_reg[5]20
 *DRC|Netlist|Instance|Required Pin|RAMB36E18Z	REQP-1839h px� 
U
DRC finished with %s
1905*	planAhead2
0 Errors, 23 WarningsZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
W
)Running write_bitstream with %s threads.
1750*designutils2
2Z20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
H
Writing bitstream %s...
11*	bitstream2
	./top.bitZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1272
452
202
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
write_bitstreamZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_bitstream: 2

00:00:052

00:00:082

2657.7072	
440.824Z17-268h px� 


End Record