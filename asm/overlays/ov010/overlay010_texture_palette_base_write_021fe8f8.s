    .text
/* Exact fallback; see src/overlays/ov010/overlay010_texture_palette_base_write.c. */
    .global Overlay010_WriteTexturePaletteBase
Overlay010_WriteTexturePaletteBase: ; 0x021fe8f8
    cmp r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    rsb r1, r1, #0x4
    mov r1, r0, lsr r1
    ldr r0, L_021fe918
    str r1, [r0, #0x0]
    bx lr
L_021fe918: .word 0x40004ac

    .size Overlay010_WriteTexturePaletteBase, . - Overlay010_WriteTexturePaletteBase
