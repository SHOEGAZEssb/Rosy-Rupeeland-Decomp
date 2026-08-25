    .text
    .extern data_ov005_021fc91c
    .extern gSystemState

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_scanline_scroll_update.c. */
    .global Overlay005_UpdateScanlineScroll
Overlay005_UpdateScanlineScroll: ; 0x021fc7d8
    sub sp, sp, #0x40
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fc844
    ldr r3, L_021fc850
    add r2, sp, #0x0
    mov r1, #0x20
L_021fc7f8:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fc7f8
    ldr r0, L_021fc854
    ldrh r3, [r0, #0x0]
    cmp r3, #0xc0
    bge L_021fc844
    ldr r0, L_021fc858
    add r1, sp, #0x0
    ldr r2, [r0, #0x64]
    ldr r0, L_021fc85c
    add r2, r3, r2, lsr #0x3
    mov r2, r2, lsl #0x1b
    mov r2, r2, lsr #0x1a
    ldrsh r2, [r1, r2]
    ldr r1, L_021fc860
    and r0, r2, r0
    str r0, [r1, #0x0]
L_021fc844:
    mov r0, #0x0
    add sp, sp, #0x40
    bx lr
L_021fc850: .word data_ov005_021fc91c
L_021fc854: .word 0x4000006
L_021fc858: .word gSystemState
L_021fc85c: .word 0x1ff
L_021fc860: .word 0x400101c

    .size Overlay005_UpdateScanlineScroll, .-Overlay005_UpdateScanlineScroll
