ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif

all:
	$(VERILATOR) -cc -CFLAGS "-O3 -Wall" --exe --build -j decoder.v jar_pi.v --top-module jar_pi main.cpp

lint:
	$(VERILATOR) --lint-only -Wall decoder.v jar_pi.v

test: all
	./obj_dir/Vjar_pi

.PHONY: clean distclean

clean:
	-rm -rf obj_dir

distclean: clean
