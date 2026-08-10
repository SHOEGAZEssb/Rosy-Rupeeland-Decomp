/*
 * Matching storage for the global brightness-pair destructor record and the
 * pair itself. The two interior screen labels are referenced independently by
 * retail code, so their exact adjacency is preserved here. Portable builds
 * use the aggregate declared in display_controller.c.
 */

    .bss
    .global gDisplayBrightnessStorage
gDisplayBrightnessStorage:
    .space 0xc

    .global gDisplayBrightnessPair
gDisplayBrightnessPair:
    .space 0x14

    .global gSubDisplayBrightness
gSubDisplayBrightness:
    /* The brightness state occupies 0x14 bytes; retail reserves 8 more. */
    .space 0x1c
