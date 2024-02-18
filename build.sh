#!/bin/bash

set -eux

xvlog --sv --incr --relax ./projects/switch/top.v ./projects/switch/tb.sv
xelab -debug all -top tb -snapshot adder_tb_snapshot
xsim adder_tb_snapshot --tclbatch xsim_cfg.tcl
xsim --gui adder_tb_snapshot.wdb
