.PHONY:	all sim build clean
all:	build
sim:	build

#
#  Icarus Verilog settings
##
LIBDIR	:= ../lib/misc-verilog-cores

IVC	?= iverilog
OPT	:= -g2005-sv -D__icarus -Wall

LIB	:= $(wildcard $(LIBDIR)/arch/*.v $(LIBDIR)/fifo/*.v $(LIBDIR)/axis/*.v $(LIBDIR)/misc/*.v)
DEP	:= $(filter-out %_tb.v, $(LIB))
SRC	:= $(wildcard *.v)
RTL	:= $(filter-out %_tb.v, $(SRC)) $(DEP)
BENCH	:= $(filter %_tb.v, $(SRC))
OUT	:= $(BENCH:%.v=../../build/%.out)

build:	$(OUT)

../../build/%.out: %.v $(RTL)
	$(IVC) $(OPT) -o $@ -s $(*F) $^
