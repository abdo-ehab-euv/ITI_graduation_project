set_property PACKAGE_PIN Y9 [get_ports gclk_i]
set_property IOSTANDARD LVCMOS33 [get_ports gclk_i]
create_clock -period 10.000 -name board_clk_100 -waveform {0.000 5.000} [get_ports gclk_i]
set_input_jitter [get_clocks board_clk_100] 0.050

set_property PACKAGE_PIN P16 [get_ports reset_btn_i]
set_property IOSTANDARD LVCMOS18 [get_ports reset_btn_i]

set_property PACKAGE_PIN R18 [get_ports start_btn_i]
set_property IOSTANDARD LVCMOS18 [get_ports start_btn_i]

set_property PACKAGE_PIN F22 [get_ports rate_i]
set_property IOSTANDARD LVCMOS18 [get_ports rate_i]

set_property PACKAGE_PIN T22 [get_ports {led_o[0]}]
set_property PACKAGE_PIN T21 [get_ports {led_o[1]}]
set_property PACKAGE_PIN U22 [get_ports {led_o[2]}]
set_property PACKAGE_PIN U21 [get_ports {led_o[3]}]
set_property PACKAGE_PIN V22 [get_ports {led_o[4]}]
set_property PACKAGE_PIN W22 [get_ports {led_o[5]}]
set_property PACKAGE_PIN U19 [get_ports {led_o[6]}]
set_property PACKAGE_PIN U14 [get_ports {led_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]
set_property DRIVE 8 [get_ports {led_o[*]}]
set_property SLEW SLOW [get_ports {led_o[*]}]

set_property PACKAGE_PIN Y11 [get_ports {tx_real_o[0]}]
set_property PACKAGE_PIN AA11 [get_ports {tx_real_o[1]}]
set_property PACKAGE_PIN Y10 [get_ports {tx_real_o[2]}]
set_property PACKAGE_PIN AA9 [get_ports {tx_real_o[3]}]
set_property PACKAGE_PIN AB11 [get_ports {tx_real_o[4]}]
set_property PACKAGE_PIN AB10 [get_ports {tx_real_o[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_real_o[*]}]
set_property DRIVE 8 [get_ports {tx_real_o[*]}]
set_property SLEW SLOW [get_ports {tx_real_o[*]}]

set_property PACKAGE_PIN W12 [get_ports {tx_imag_o[0]}]
set_property PACKAGE_PIN W11 [get_ports {tx_imag_o[1]}]
set_property PACKAGE_PIN V10 [get_ports {tx_imag_o[2]}]
set_property PACKAGE_PIN W8 [get_ports {tx_imag_o[3]}]
set_property PACKAGE_PIN V12 [get_ports {tx_imag_o[4]}]
set_property PACKAGE_PIN W10 [get_ports {tx_imag_o[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_imag_o[*]}]
set_property DRIVE 8 [get_ports {tx_imag_o[*]}]
set_property SLEW SLOW [get_ports {tx_imag_o[*]}]

set_false_path -from [get_ports reset_btn_i]
set_false_path -from [get_ports start_btn_i]
set_false_path -from [get_ports rate_i]

set core_clk_obj [get_clocks -quiet -of_objects [get_pins -quiet u_core_clk_buf/O]]
if {[llength $core_clk_obj] > 0} {
    set_clock_uncertainty -setup 0.100 $core_clk_obj
    set_clock_uncertainty -hold 0.050 $core_clk_obj
}

set_units -capacitance pF
set pmod_output_load_pf 10.0
set_load $pmod_output_load_pf [get_ports {tx_real_o[*]}]
set_load $pmod_output_load_pf [get_ports {tx_imag_o[*]}]

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
