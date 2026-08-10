.bss
.global gHeapAllocationSizeAccumulator
.global gHeapContext

/*
 * Matching storage for the portable heap state documented in
 * src/system/heap.c: one allocation-size accumulator followed by the
 * 12-byte root HeapContext exported to the rest of the game.
 */
gHeapAllocationSizeAccumulator:
    .space 0x4
gHeapContext:
    .space 0xc
