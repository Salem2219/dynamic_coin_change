force -freeze sim:/test/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/test/rst 1 0
force -freeze sim:/test/rst 0 100
force -freeze sim:/test/start 0 0
force -freeze sim:/test/A 1100 0
add wave -position end  sim:/test/u1/datapath/i
add wave -position end  sim:/test/u1/datapath/j
add wave -position 4  sim:/test/u1/control/current_state
add wave -position end  sim:/test/u1/datapath/temp
add wave -position end  sim:/test/u1/datapath/temp2
add wave -position end  sim:/test/C_matrix/program