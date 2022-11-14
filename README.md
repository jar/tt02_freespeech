![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# Tiny Tapeout Illegal Logic

This circuit logic emits a sequences of 32 hexadecimal digits to the 7 segment
display which may be considered illegal in certain jurisdictions. The sequence
is considered to be an illegal number.


## How to use

First, raise the reset I/O (io\_in[1]) high.  Then Output Enable (io\_in[2])
high for 32 cycles. The 7 segment output display is used directly.

## What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper
than ever to get your digital designs manufactured on a real chip!

Go to https://tinytapeout.com for instructions!
