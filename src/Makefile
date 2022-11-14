ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif

all:
	$(VERILATOR) -cc -CFLAGS "-O3 -Wall" --exe --build -j decoder.v illegal_logic.v --top-module jar_illegal_logic main.cpp

test: all
	./obj_dir/Vjar_illegal_logic

.PHONY: clean distclean

clean:
	-rm -rf obj_dir

distclean: clean
