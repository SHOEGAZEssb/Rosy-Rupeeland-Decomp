.text

/* Exact fallback; see src/overlays/ov035/overlay035_primitive.c for documented portable C. */

    .extern func_020949ec
    .extern data_ov035_02203c94


    .global func_ov035_021fd2bc
func_ov035_021fd2bc: 
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_020949ec
    ldr r0, L_021fd308
    ldrh r1, [sp, #0x18]
    str r0, [r4, #0x0]
    str r7, [r4, #0x9c]
    ldrh r0, [sp, #0x1c]
    strh r1, [r4, #0xa0]
    mov r1, #0x1
    strh r0, [r4, #0xa2]
    strh r6, [r4, #0xa4]
    strh r5, [r4, #0xa6]
    mov r0, r4
    str r1, [r4, #0x88]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd308: .word data_ov035_02203c94
.size func_ov035_021fd2bc, .-func_ov035_021fd2bc

