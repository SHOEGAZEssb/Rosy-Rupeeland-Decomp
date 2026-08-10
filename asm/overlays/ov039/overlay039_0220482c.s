.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern __construct_array
    .extern VecFx32Object_Init
    .extern genrand_int32
    .extern func_ov039_021fd06c
    .extern func_ov039_02204900
    .extern func_ov039_021fce5c
    .extern func_ov039_021fce40
    .global func_ov039_0220482c
func_ov039_0220482c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r4, L_022048f0
    ldr r3, L_022048f4
    add r0, r6, #0x4
    mov r1, #0x27
    mov r2, #0x8
    str r4, [sp, #0x0]
    bl __construct_array
    ldr r4, L_022048f8
    ldr r3, L_022048fc
    add r0, r6, #0x13c
    mov r1, #0x27
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    add r0, r6, #0x378
    bl VecFx32Object_Init
    add r0, r6, #0x388
    bl VecFx32Object_Init
    mov r0, #0xd
    sub r4, r0, #0x1
    mov r8, #0x0
    mov r7, #0x18
L_02204890:
    mul r5, r4, r7
    bl genrand_int32
    add r1, r6, r5
    strh r0, [r1, #0x10]
    bl genrand_int32
    add r1, r6, r5
    strh r0, [r1, #0x18]
    bl genrand_int32
    add r1, r6, r5
    strh r0, [r1, #0x12]
    bl genrand_int32
    add r2, r6, r5
    add r1, r6, r4, lsl #0x2
    strh r0, [r2, #0x1a]
    str r8, [r1, #0x310]
    str r8, [r1, #0x344]
    subs r4, r4, #0x1
    bpl L_02204890
    str r8, [r6, #0x398]
    str r8, [r6, #0x3a0]
    mov r0, r6
    str r8, [r6, #0x3a4]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_022048f0: .word func_ov039_021fd06c
L_022048f4: .word func_ov039_02204900
L_022048f8: .word func_ov039_021fce5c
L_022048fc: .word func_ov039_021fce40
    .size func_ov039_0220482c, .-func_ov039_0220482c

