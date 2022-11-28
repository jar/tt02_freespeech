#include <verilated.h>
#include <cstdint>
#include "Vjar_pi.h"

#define tick() do{io_in->clk=1;top->eval();}while(0)
#define tock() do{io_in->clk=0;top->eval();}while(0)
#define ticktock() do{tick();tock();}while(0)

typedef struct {
	union {
		uint8_t input;
		struct {
			uint8_t clk    : 1;
			uint8_t reset  : 1;
			uint8_t stream : 1;
			uint8_t index  : 5;
		};
	};
} input_t;
typedef struct {
	union {
		uint8_t output;
		struct {
			uint8_t a : 1;
			uint8_t b : 1;
			uint8_t c : 1;
			uint8_t d : 1;
			uint8_t e : 1;
			uint8_t f : 1;
			uint8_t g : 1;
			uint8_t h : 1;
		};
	};
} output_t;

void print_7segment(output_t v)
{
//  ---A---
// |       |
// F       B
// |       |
//  ---G---
// |       |
// E       C
// |       |  _
//  ---D---  |H|
#if 0
	v.a?puts("╔══════╗"):puts("        ");
	for(int i=0;i<3;i++)printf("%s      %s\n",v.f?"║":" ",v.b?"║":" ");
	v.g?puts("├══════┤"):puts("├      ┤");
	for(int i=0;i<3;i++)printf("%s      %s\n",v.e?"║":" ",v.c?"║":" ");
	v.d?printf("╚══════╝"):printf("        ");
	printf(" %s\n",v.h?"●":"◯");
#else
	static int c = 0;
	uint8_t x = *(uint8_t*)&v;
	switch(x) {
		case 0x3f: printf("0"); break;
		case 0x06: printf("1"); break;
		case 0x5b: printf("2"); break;
		case 0x4f: printf("3"); break;
		case 0x66: printf("4"); break;
		case 0x6d: printf("5"); break;
		case 0x7d: printf("6"); break;
		case 0x07: printf("7"); break;
		case 0x7f: printf("8"); break;
		case 0x67: printf("9"); break;
		case 0x80: printf("."); break;
		default: printf("?"); break;
	}
	c++;
#endif
}

int main(int argc, char* argv[])
{
	VerilatedContext* vcp = new VerilatedContext;
	vcp->commandArgs(argc, argv);
	Vjar_pi* top = new Vjar_pi{vcp};

	input_t* io_in = (input_t*)&(top->io_in);

	int err = 0;

	io_in->reset = 1;
	io_in->index = 0; // start index (low 5 bits)
	ticktock();
	io_in->index = 0; // start index (high 5 bits)
	ticktock();
	io_in->reset = 0;

	io_in->stream = 1;
	for (int i = 0; i < 512; i++) {
		ticktock();
		output_t val = *(output_t*)&(top->io_out);
		print_7segment(val);
	}
	printf("\n");

	top->final();
	delete top;

	if (err) puts("ERROR!");

	return err;
}
