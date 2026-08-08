.text

/* Exact fallback; see src/overlays/ov026/overlay026_motion_objects.c. */
.extern data_ov026_022049d0
.extern func_020949ec


    .global func_ov026_021fe680
func_ov026_021fe680:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020949ec
    ldr r0, L_021fe6e4
    ldr r1, L_021fe6e8
    str r0, [r4, #0x0]
    mov r2, #0x0
    ldr r0, L_021fe6ec
    str r2, [r4, #0xc0]
    str r0, [r4, #0x9c]
    str r1, [r4, #0xa0]
    mov r0, #0x1000
    str r0, [r4, #0xa4]
    mov r0, r1, lsr #0x1
    str r0, [r4, #0xa8]
    str r2, [r4, #0xac]
    mov r0, #0x52
    str r0, [r4, #0xb0]
    str r2, [r4, #0xb4]
    mov r0, #0x10
    str r0, [r4, #0xb8]
    strh r2, [r4, #0xbc]
    mov r0, r4
    str r2, [r4, #0xc4]
    ldmia sp!, {r4, pc}
L_021fe6e4: .word data_ov026_022049d0
L_021fe6e8: .word 0x666
L_021fe6ec: .word 0x385
.size func_ov026_021fe680, .-func_ov026_021fe680

