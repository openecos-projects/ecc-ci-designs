# ECC-generated SDC file

# ----------------------------------------------------------------------------
# 1. Design and flow context
# ----------------------------------------------------------------------------
set top "gcd"

# ----------------------------------------------------------------------------
# 2. Primary clock - user design input resolved by ECC
# ----------------------------------------------------------------------------
set clk_port_name "clk"
set clk_name "CLK_clk"
set clk_freq_mhz 100.0
set clk_period [expr {1000.0 / $clk_freq_mhz}]
set clk_ports [get_ports -quiet $clk_port_name]
if {[llength $clk_ports]} {
    create_clock -name $clk_name -period $clk_period $clk_ports
    create_clock -name "VCLK_clk" -period $clk_period
} else {
    create_clock -name $clk_name -period $clk_period [get_pins $clk_port_name]
}

# ----------------------------------------------------------------------------
# 3. Signoff scenario - selected by ECC
# ----------------------------------------------------------------------------
set corner "TYP"
set rc_para "TYPICAL"

# ----------------------------------------------------------------------------
# 3.1 User generated clocks
# ----------------------------------------------------------------------------
# create_generated_clock -name CLK_div2 -divide_by 2 \
#     -source [get_ports clk] [get_pins u_div/clk_reg/Q]


# ----------------------------------------------------------------------------
# 3.2 User clock groups
# ----------------------------------------------------------------------------
# set_clock_groups -asynchronous \
#     -group {CLK_clk VCLK_clk CLK_div2} -group {CLK_clk_aux VCLK_clk_aux}


# ----------------------------------------------------------------------------
# 4. IO interface constraints - golden branch selected from iDB
# ----------------------------------------------------------------------------
set clk_port_name "clk"
set clk_name "CLK_clk"
set clk_freq_mhz 100.0
set clk_period [expr {1000.0 / $clk_freq_mhz}]
set virtual_clk_name "VCLK_clk"
if {[llength [get_ports -quiet $clk_port_name]]} {

    # 4.2 IO delay budget
    set data_inputs [remove_from_collection [all_inputs] [get_ports -quiet [list "clk"]]]
    set data_outputs [all_outputs]

    if {[llength $data_inputs]} {
        set_input_delay [expr {$clk_period * 0.6}] -max \
            -clock $virtual_clk_name -add_delay $data_inputs
        set_input_delay [expr {$clk_period * 0.3}] -min \
            -clock $virtual_clk_name -add_delay $data_inputs
    }

    if {[llength $data_outputs]} {
        set_output_delay [expr {$clk_period * 0.6}] -max \
            -clock $virtual_clk_name -add_delay $data_outputs
        set_output_delay [expr {$clk_period * 0.3}] -min \
            -clock $virtual_clk_name -add_delay $data_outputs
    }

    # 4.3 Input-to-output multicycles
    set_multicycle_path 4 -setup -end \
        -from [all_inputs] -to [all_outputs]
    set_multicycle_path 3 -hold -end \
        -from [all_inputs] -to [all_outputs]
}

# 4.4 Core output load
set_load -max 0.2 [all_outputs]
set_load -min 0.1 [all_outputs]

# ----------------------------------------------------------------------------
# 4.5 User IO constraints
# ----------------------------------------------------------------------------
# set_input_delay   0.1    -max -clock CLK_clk [get_ports data_in*]
# set_input_delay  -0.1    -min -clock CLK_clk [get_ports data_in*]
# set_output_delay  0.0625 -max -clock CLK_clk [get_ports data_out*]
# set_output_delay -0.1    -min -clock CLK_clk [get_ports data_out*]


# ----------------------------------------------------------------------------
# 4.6 User timing exceptions
# ----------------------------------------------------------------------------
# set_false_path -from [get_ports reset_n]


# ----------------------------------------------------------------------------
# 5. OCV derate - first matching golden rule
# ----------------------------------------------------------------------------
set_timing_derate -late 1.0
set_timing_derate -early 0.95
set timing_clock_periods {}
lappend timing_clock_periods "CLK_clk" 10.0
if {[llength [get_ports -quiet "clk"]]} {
    lappend timing_clock_periods "VCLK_clk" 10.0
}

# ----------------------------------------------------------------------------
# 6. Clock uncertainty - setup and hold margins
# ----------------------------------------------------------------------------
foreach {timing_name timing_period} $timing_clock_periods {
    set timing_clock [get_clocks $timing_name]
    set timing_frequency [expr {1000.0 / $timing_period}]
    if {$timing_frequency > 0 && $timing_frequency <= 10000} {
        set_clock_uncertainty -setup 0.200 $timing_clock
        set_clock_uncertainty -hold 0.1 $timing_clock
    }
}

# ----------------------------------------------------------------------------
# 7. Maximum transition - scaled by each clock period
# ----------------------------------------------------------------------------
foreach {timing_name timing_period} $timing_clock_periods {
    set timing_clock [get_clocks $timing_name]
    set_max_transition [expr {$timing_period * 0.17}] -clock_path $timing_clock
    set_max_transition [expr {$timing_period * 0.34}] -data_path $timing_clock
}

# ----------------------------------------------------------------------------
# 8. Design-level electrical constraints
# ----------------------------------------------------------------------------
set_max_fanout 32 [current_design]
