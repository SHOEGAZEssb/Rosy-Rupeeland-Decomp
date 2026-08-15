.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_object.c. */
.extern data_ov027_021fef08
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern func_020955b0
.extern func_ov027_021fd180


    .global func_ov027_021fd408
func_ov027_021fd408:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r5, r2
    mov r4, r3
    bl func_020955b0
    ldr r0, L_021fd4d8
    mov r3, #0x1000
    str r0, [r6, #0x0]
    str r5, [r6, #0xa0]
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    mov r0, #0x800
    rsblt r0, r0, #0x0
    str r0, [r6, #0xa8]
    ldr r1, [r5, #0x8]
    mov r0, r6
    str r1, [r6, #0xac]
    str r4, [r6, #0xa4]
    ldr r1, [r6, #0xa8]
    ldr r2, [r6, #0xac]
    bl Presentation_SetPosition
    add r0, r6, #0x2c
    mov r1, #0x2
    mov r2, #0x100
    bl PresentationScalar_TransitionTo
    mov r0, #0x78
    mov r1, #0x0
    str r0, [r6, #0x7c]
    str r1, [r6, #0x80]
    ldr r3, [r6, #0xa8]
    ldr r0, [r5, #0x4]
    mov r2, #0x14
    sub r0, r3, r0
    str r0, [r6, #0xb0]
    ldr r4, [r6, #0xac]
    ldr r3, [r5, #0x8]
    mov r0, #0x2
    sub r3, r4, r3
    str r3, [r6, #0xb4]
    str r1, [r6, #0xb8]
    stmia sp, {r1, r2}
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x9c]
    mov r2, r1
    mov r3, r1
    bl func_ov027_021fd180
    mov r1, #0x1
    mov r0, r6
    str r1, [r6, #0x88]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fd4d8: .word data_ov027_021fef08
.size func_ov027_021fd408, .-func_ov027_021fd408

