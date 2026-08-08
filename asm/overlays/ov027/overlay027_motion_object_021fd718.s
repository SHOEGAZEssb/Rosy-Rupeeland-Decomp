.text

/* Exact fallback; see src/overlays/ov027/overlay027_motion_object.c. */
.extern data_ov027_021feeec
.extern func_020948d4
.extern func_020949ec


    .global func_ov027_021fd718
func_ov027_021fd718:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020949ec
    ldr r0, L_021fd754
    mov r1, #0x0
    str r0, [r4, #0x0]
    ldr r2, L_021fd758
    str r1, [r4, #0xb0]
    add r0, r4, #0x6c
    strh r2, [r4, #0xb4]
    bl func_020948d4
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0x88]
    ldmia sp!, {r4, pc}
L_021fd754: .word data_ov027_021feeec
L_021fd758: .word 0x7fff
.size func_ov027_021fd718, .-func_ov027_021fd718

