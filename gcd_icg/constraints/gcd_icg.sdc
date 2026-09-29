create_clock -name clk -period 10 -waveform {0 5} [get_ports {clk}]

set_propagated_clock [get_clocks {clk}]

set_input_delay  0 -clock clk [get_ports {req_msg_0_ req_msg_1_ req_msg_2_ req_msg_3_ req_msg_4_ req_msg_5_ req_msg_6_ req_msg_7_ req_msg_8_ req_msg_9_ req_msg_10_ req_msg_11_ req_msg_12_ req_msg_13_ req_msg_14_ req_msg_15_ req_msg_16_ req_msg_17_ req_msg_18_ req_msg_19_ req_msg_20_ req_msg_21_ req_msg_22_ req_msg_23_ req_msg_24_ req_msg_25_ req_msg_26_ req_msg_27_ req_msg_28_ req_msg_29_ req_msg_30_ req_msg_31_ req_val reset resp_rdy}]
set_output_delay 0 -clock clk [get_ports {req_rdy resp_msg_0_ resp_msg_1_ resp_msg_2_ resp_msg_3_ resp_msg_4_ resp_msg_5_ resp_msg_6_ resp_msg_7_ resp_msg_8_ resp_msg_9_ resp_msg_10_ resp_msg_11_ resp_msg_12_ resp_msg_13_ resp_msg_14_ resp_msg_15_ resp_val}]
