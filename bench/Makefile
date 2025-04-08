.PHONY:	all build sim
all:	sim

#
#  Icarus Verilog settings
##
RTLDIR	:= ../rtl
LIBDIR	:= ../lib/misc-verilog-cores
MEMDIR	:= ../lib/axi-ddr3-lite

IVC	?= iverilog
OPT	:= -g2005-sv -D__icarus -Wall -I$(LIBDIR)/axis/ -I$(LIBDIR)/usb/ -I$(MEMDIR)/ -I$(MEMDIR)/sim/

USB_V	:= $(wildcard $(LIBDIR)/usb/*.v)
USB	:= $(filter-out %_tb.v, $(USB_V)) $(wildcard usb/*.v)

UART	:= $(wildcard $(LIBDIR)/uart/*.v)

DDR3_V	:= $(wildcard $(MEMDIR)/*.v $(MEMDIR)/extra/*.v)
DDR3	:= $(filter-out %_tb.v, $(DDR3_V))

MISC_V	:= $(wildcard $(LIBDIR)/misc/*.v $(LIBDIR)/axis/*.v)
MISC	:= $(filter-out %_tb.v, $(MISC_V))
FIFO	:= $(wildcard $(LIBDIR)/fifo/*.v)
ARCH	:= $(wildcard $(LIBDIR)/arch/*.v) arch/gw2a_prim_sim.v

SYNTH	:= ../synth/gowin-ddr3-test
EXTRA_V	:= $(wildcard $(SYNTH)/*.v)
EXTRA	:= $(filter-out %_tb.v, $(EXTRA_V))

SIMSRC	:= $(wildcard *.v $(MEMDIR)/sim/*.v)
SRC	:= $(filter-out %_tb.v, $(SIMSRC))

LIB	:= $(MISC) $(FIFO) $(ARCH) $(USB) $(DDR3) $(UART) $(EXTRA) $(SRC)
TOP	?= $(wildcard *_tb.v)
OUT	?= $(TOP:%.v=../build/%.out)

USB_T	:= $(wildcard *usb*_tb.v)
USB_O	?= $(USB_T:%.v=../build/%.out)

sim:	build

usbsim:	$(USB_O)

build:	$(OUT)

../build/%.out: %.v $(LIB)
	$(IVC) $(OPT) -L../vpi -mulpisim -o $@ -s $(*F) $^
