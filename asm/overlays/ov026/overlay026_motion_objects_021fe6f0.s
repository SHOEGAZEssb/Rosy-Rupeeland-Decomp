.text

/* Exact fallback; see src/overlays/ov026/overlay026_motion_objects.c. */



    .global func_ov026_021fe6f0
func_ov026_021fe6f0:
    ldr r1, [r0, #0xb4]
    subs r1, r1, #0x1
    str r1, [r0, #0xb4]
    ldrpl r2, [r0, #0xac]
    ldrpl r1, [r0, #0xb0]
    addpl r1, r2, r1
    bpl L_021fe720
    ldr r2, [r0, #0xc0]
    mov r1, #0x4
    str r2, [r0, #0xc4]
    str r1, [r0, #0xb4]
    mov r1, #0x0
L_021fe720:
    str r1, [r0, #0xac]
    mov r0, #0x0
    bx lr
.size func_ov026_021fe6f0, .-func_ov026_021fe6f0

