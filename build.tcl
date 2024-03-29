foreach source_file [glob projects/$argv/*.v] {
  read_verilog -sv $source_file
}

read_xdc projects/$argv/basys3.xdc

synth_design -top top -part xc7a35tcpg236-1
opt_design
place_design
route_design

write_bitstream -force out.bit
open_hw_manager
connect_hw_server
open_hw_target
set_property PROGRAM.FILE out.bit [current_hw_device]
program_hw_device