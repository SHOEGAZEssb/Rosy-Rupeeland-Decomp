.text
/* Exact fallback; see overlay039_opening_helpers.c for portable C. */
    .extern data_020f3058
    .extern VecFx32Object_Init
    .global func_ov039_021fce00
func_ov039_021fce00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021fce3c
    add r0, r4, #0x1c
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    add r0, r4, #0x2c
    bl VecFx32Object_Init
    mov r1, #0x0
    str r1, [r4, #0x4]
    str r1, [r4, #0x8]
    str r1, [r4, #0xc]
    mov r0, r4
    str r1, [r4, #0x44]
    ldmia sp!, {r4, pc}
L_021fce3c: .word data_020f3058
    .size func_ov039_021fce00, .-func_ov039_021fce00
