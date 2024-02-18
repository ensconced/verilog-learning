.PHONY: clean simulate flash

clean:
	rm -rf *.dir *.wdb *.log *.jou *.pb *.xpr *.hw *.cache *.bit *.ip_user_files .Xil clockInfo.txt

simulate:
	@test -n "$(proj)" || (echo "ERROR: proj must be set" ; exit 1)
	xvlog --sv --incr --relax ./projects/$(proj)/top.v ./projects/$(proj)/tb.sv
	xelab -debug all -top tb -snapshot snp
	xsim snp --tclbatch xsim_cfg.tcl
	xsim --gui snp.wdb

flash:
	@test -n "$(proj)" || (echo "ERROR: proj must be set" ; exit 1)
	vivado -mode batch -source build.tcl -tclargs $(proj)