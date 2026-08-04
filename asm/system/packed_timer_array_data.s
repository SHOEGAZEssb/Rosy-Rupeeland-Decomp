.bss
.global data_020f37ac
.global data_020f4160
.global data_020f4178

/*
 * Matching storage for the portable timer bank documented in
 * src/system/packed_timer_array.c. Interior labels at entries 207 and 209
 * must remain link-visible because unreconstructed callers address them.
 */
data_020f37ac:
    .space 0x9b4
data_020f4160:
    .space 0x18
data_020f4178:
    .space 0x234
