.PHONY: clean simulate flash

clean:
	rm -rf *.dir *.wdb *.log *.jou *.pb *.xpr *.hw *.cache *.bit *.ip_user_files .Xil clockInfo.txt

simulate:
	xvlog --sv --incr --relax ./projects/switch/top.v ./projects/switch/tb.sv
	xelab -debug all -top tb -snapshot snp
	xsim snp --tclbatch xsim_cfg.tcl
	xsim --gui snp.wdb

flash:
	vivado -mode batch -source build.tcl