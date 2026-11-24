# ECC timing input: five TOML strings containing SDC commands.
# Same clock and IO commands as constraints/gcd_icg.sdc, on the v2 port names
# (the mapped v2 netlist drops the trailing underscore from every data port).

primary_clocks = '''
create_clock -name clk -period 10 -waveform {0 5} [get_ports {clk}]
'''

generated_clocks = '''
'''

clock_groups = '''
'''

io_constraints = '''
set_input_delay  0 -clock clk [get_ports {req_msg_0 req_msg_1 req_msg_2 req_msg_3 req_msg_4 req_msg_5 req_msg_6 req_msg_7 req_msg_8 req_msg_9 req_msg_10 req_msg_11 req_msg_12 req_msg_13 req_msg_14 req_msg_15 req_msg_16 req_msg_17 req_msg_18 req_msg_19 req_msg_20 req_msg_21 req_msg_22 req_msg_23 req_msg_24 req_msg_25 req_msg_26 req_msg_27 req_msg_28 req_msg_29 req_msg_30 req_msg_31 req_val reset resp_rdy}]
set_output_delay 0 -clock clk [get_ports {req_rdy resp_msg_0 resp_msg_1 resp_msg_2 resp_msg_3 resp_msg_4 resp_msg_5 resp_msg_6 resp_msg_7 resp_msg_8 resp_msg_9 resp_msg_10 resp_msg_11 resp_msg_12 resp_msg_13 resp_msg_14 resp_msg_15 resp_val}]
'''

timing_exceptions = '''
'''
