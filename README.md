# Getting set up

This project depends on Vivado. I run Vivado on my home debian server, and do most development via a VSCode SSH session from my macbook.
In my SSH config on the macbook, I have X11 forwarding set up so I can use the Vivado GUI for viewing simulation waveforms.

```
# Run simulation for a project
make simulate proj=switch

# Flashing a project onto the FPGA
make flash proj=switch
```


