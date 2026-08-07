    .text
/* Exact fallback; see src/overlays/ov018/overlay018_geometry_helpers.c (hardware and copy helpers). */

.global func_ov018_021ff738
func_ov018_021ff738:
    ldr r1, L_021ff754
L_021ff73c:
    ldrh r0, [r1, #0x0]
    tst r0, #0x8000
    bne L_021ff73c
    ldr r0, L_021ff758
    ldr r0, [r0, #0x0]
    bx lr
L_021ff754: .word 0x40002b0
L_021ff758: .word 0x40002b4
    .size func_ov018_021ff738, . - func_ov018_021ff738

    .global func_ov018_021ff75c
func_ov018_021ff75c:
    ldrsh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    ldrsh r1, [r1, #0x2]
    strh r1, [r0, #0x2]
    bx lr
    .size func_ov018_021ff75c, . - func_ov018_021ff75c
