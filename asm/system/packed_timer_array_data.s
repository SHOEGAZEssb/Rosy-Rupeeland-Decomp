.bss
.global gPackedTimerArray
.global gPackedTimerArrayEntry207
.global gPackedTimerArrayEntry209

/*
 * Matching storage for the portable timer bank documented in
 * src/system/packed_timer_array.c. Interior labels at entries 207 and 209
 * must remain link-visible because unreconstructed callers address them.
 */
gPackedTimerArray:
    .space 0x9b4
gPackedTimerArrayEntry207:
    .space 0x18
gPackedTimerArrayEntry209:
    .space 0x234
