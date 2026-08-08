.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */
    .extern func_ov039_021fce40
    .extern __construct_array
    .extern genrand_int32
    .extern func_ov039_021fce5c
    .global func_ov039_02203ef0
func_ov039_02203ef0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    bl func_ov039_021fce40
    add r0, r4, #0x18
    bl func_ov039_021fce40
    ldr r2, L_02203f8c
    ldr r3, L_02203f90
    str r2, [sp, #0x0]
    add r0, r4, #0x88
    mov r1, #0x8
    mov r2, #0xc
    bl __construct_array
    ldr r1, L_02203f8c
    ldr r3, L_02203f90
    str r1, [sp, #0x0]
    add r0, r4, #0xe8
    mov r1, #0x8
    mov r2, #0xc
    bl __construct_array
    mov r0, #0x8
    sub r6, r0, #0x1
    mov r5, #0x0
L_02203f58:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x28]
    bl genrand_int32
    add r1, r4, r6, lsl #0x2
    str r0, [r1, #0x48]
    bl genrand_int32
    add r1, r4, r6, lsl #0x2
    str r0, [r1, #0x68]
    subs r6, r6, #0x1
    bpl L_02203f58
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_02203f8c: .word func_ov039_021fce5c
L_02203f90: .word func_ov039_021fce40
    .size func_ov039_02203ef0, .-func_ov039_02203ef0

