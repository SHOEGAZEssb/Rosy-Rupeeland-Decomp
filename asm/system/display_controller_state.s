/*
 * Matching storage for the global brightness-pair destructor record and the
 * pair itself. The two interior screen labels are referenced independently by
 * retail code, so their exact adjacency is preserved here. Portable builds
 * use the aggregate declared in display_controller.c.
 */

    .bss
    .global data_020f4dbc
data_020f4dbc:
    .space 0xc

    .global data_020f4dc8
data_020f4dc8:
    .space 0x14

    .global data_020f4ddc
data_020f4ddc:
    /* The brightness state occupies 0x14 bytes; retail reserves 8 more. */
    .space 0x1c
