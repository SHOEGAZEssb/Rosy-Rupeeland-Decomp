.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_helpers.c. */



    .global func_ov027_021fe4a8
func_ov027_021fe4a8:
    ldr r1, [r0, #0x134]
    b L_021fe4c4
L_021fe4b0:
    ldrh r0, [r1, #0x98]
    tst r0, #0x2
    moveq r0, #0x0
    bxeq lr
    ldr r1, [r1, #0x8]
L_021fe4c4:
    cmp r1, #0x0
    bne L_021fe4b0
    mov r0, #0x1
    bx lr
.size func_ov027_021fe4a8, .-func_ov027_021fe4a8

