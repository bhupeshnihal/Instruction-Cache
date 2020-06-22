# Instruction-Cache

An instruction memory subsystem comprising of an instruction cache, a main memory and a cache controller has been implemented in Verilog HDL.

The cache is two-way set associative with four sets, with each block comprising of two words, the word size being 32 bits.

The main memory size has been considered as 128 bytes for simplicity, with byte-addressability.

All the processor-memory interactions are synchronized with respect to the positive edge of a clock signal and are controlled by the cache controller block.

Cache hit time has been taken as 1 clock cycle while the miss penalty (extra time incurred for accessing the main memory) has been taken as 10 clock cycles.

In case of a cache miss, one of the invalid entries is replaced and in case of all the entries being valid, true LRU (Least Recently Used) policy is followed to invalidate and replace the existing cache data.

The subsystem has been tested with sequential and random memory accesses and has been found to be working as expected.


All the modules, submodules, test fixture code and MEM files used for initializing the memory are in the folder 'Verilog Files'.

Simulation output waveforms are saved in the folder 'Waveforms'.

Software(s) Used: Xilinx ISE, ISim.

Language Used for hardware description: Verilog HDL.
