.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_helpers.c. */



    .global func_ov027_021fe47c
func_ov027_021fe47c:
    mov r1, #0x1
    str r1, [r0, #0x160]
    ldr r1, [r0, #0x134]
    b L_021fe49c
L_021fe48c:
    ldrh r0, [r1, #0x98]
    orr r0, r0, #0x1
    strh r0, [r1, #0x98]
    ldr r1, [r1, #0x8]
L_021fe49c:
    cmp r1, #0x0
    bne L_021fe48c
    bx lr
.size func_ov027_021fe47c, .-func_ov027_021fe47c

