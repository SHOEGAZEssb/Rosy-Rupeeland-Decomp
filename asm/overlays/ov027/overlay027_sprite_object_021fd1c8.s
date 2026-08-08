.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_object.c. */
.extern data_ov027_021fee98
.extern func_02094bbc
.extern func_020955b0
.extern func_ov027_021fd180


    .global func_ov027_021fd1c8
func_ov027_021fd1c8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r5, r2
    mov r4, r3
    bl func_020955b0
    mov r0, #0x6
    ldr r1, L_021fd254
    mov r2, #0x0
    str r1, [r6, #0x0]
    mul r0, r4, r0
    str r5, [r6, #0xa0]
    str r0, [r6, #0xa4]
    str r2, [r6, #0xa8]
    str r2, [r6, #0xac]
    str r2, [sp, #0x0]
    mov r0, #0x14
    str r0, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r1, [r6, #0xa0]
    ldr r0, [r6, #0x9c]
    ldr r1, [r1, #0x0]
    mov r3, r2
    bl func_ov027_021fd180
    ldr r0, [r6, #0x9c]
    mov r1, #0x3
    strb r1, [r0, #0x59]
    mov r3, r4, lsl #0x1
    mov r0, r6
    ldmib r5, {r1, r2}
    bl func_02094bbc
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fd254: .word data_ov027_021fee98
.size func_ov027_021fd1c8, .-func_ov027_021fd1c8

