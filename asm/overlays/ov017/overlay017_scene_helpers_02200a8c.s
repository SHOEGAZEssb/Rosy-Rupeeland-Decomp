    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_helpers.c. */
.global Overlay017_WriteTexturePaletteBase
Overlay017_WriteTexturePaletteBase:
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_02200aac
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_02200aac: .word 0x40004c0
    .size Overlay017_WriteTexturePaletteBase, . - Overlay017_WriteTexturePaletteBase
