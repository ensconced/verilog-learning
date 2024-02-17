#!/bin/bash

set -eux

echo "### COMPILING SYSTEMVERILOG ###"
xvlog --sv --incr --relax ./src/adder.sv ./src/tb.sv

echo "### ELABORATING ###"
xelab -debug all -top tb -snapshot adder_tb_snapshot

echo "### RUNNING SIMULATION ###"
xsim adder_tb_snapshot --tclbatch xsim_cfg.tcl

echo "### OPENING WAVES ###"
xsim --gui adder_tb_snapshot.wdb
