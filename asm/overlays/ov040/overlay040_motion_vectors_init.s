    .text
/* Exact fallback; see overlay040_motion_vectors_init.c for portable C. */
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Destroy
    .extern VecFx32Object_Assign
    .extern func_020adc40
    .extern func_020adc90
    .extern func_ov040_02200378
    .extern func_ov040_022005f8
    .extern func_ov040_022009e8
    .global func_ov040_02200128
func_ov040_02200128:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x40
    mov r6, r0
    add r0, sp, #0x30
    mov r1, #0
    mov r2, #0x32000
    mov r3, #0xa000
    bl VecFx32Object_InitComponents
    add r1, sp, #0x30
    add r0, r6, #0x1a4
    bl VecFx32Object_Assign
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    mov r1, #0
    mov r2, #0x32000
    mov r3, #0xa000
    bl VecFx32Object_InitComponents
    add r0, r6, #0x1b4
    add r1, sp, #0x20
    bl VecFx32Object_Assign
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    mov r1, #0
    mov r2, #0x10000
    mov r3, #0xa000
    bl VecFx32Object_InitComponents
    add r0, r6, #0x204
    add r1, sp, #0x10
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r1, #0
    add r0, sp, #0
    sub r2, r1, #0x38000
    sub r3, r1, #0x5000
    bl VecFx32Object_InitComponents
    add r0, r6, #0x244
    add r1, sp, #0
    bl VecFx32Object_Assign
    add r0, sp, #0
    bl VecFx32Object_Destroy
    ldr r7, [r6, #0x11c]
    mvn r1, #0
    mov r0, r1, lsl #12
    umull lr, ip, r7, r0
    mla ip, r7, r1, ip
    mov r5, r7, asr #31
    adds r1, lr, #0x800
    mla ip, r5, r0, ip
    adc r0, ip, #0
    mov r1, r1, lsr #12
    orr r1, r1, r0, lsl #20
    str r1, [r6, #0x1d8]
    ldr r1, [r6, #0x118]
    mov r2, #0x800
    mov r0, r1, asr #31
    mov r0, r0, lsl #12
    orr r0, r0, r1, lsr #20
    adds r1, r2, r1, lsl #12
    adc r0, r0, #0
    mov r1, r1, lsr #12
    orr r1, r1, r0, lsl #20
    mov r4, #0x19000
    str r1, [r6, #0x1dc]
    str r4, [r6, #0x1e0]
    ldr r0, [r6, #0xf8]
    ldr r4, [r6, #0xfc]
    rsb r5, r0, #0
    mov r3, #0
    mov lr, r5, asr #31
    umull r1, r0, r5, r5
    mla r0, r5, lr, r0
    smull ip, r7, r4, r4
    adds ip, ip, r2
    adc r7, r7, r3
    adds r1, r1, r2
    mla r0, lr, r5, r0
    mov r2, ip, lsr #12
    adc r0, r0, r3
    mov r1, r1, lsr #12
    orr r2, r2, r7, lsl #20
    orr r1, r1, r0, lsl #20
    add r0, r2, r1
    bl func_020adc40
    mov r7, r0
    mov r0, r4
    mov r1, r7
    bl func_020adc90
    mov r4, r0
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r1, #0x32000
    umull r2, r5, r4, r1
    adds r2, r2, #0x800
    mov r7, r2, lsr #12
    mov r2, r4, asr #31
    mov r3, #0
    mla r5, r4, r3, r5
    mla r5, r2, r1, r5
    adc r2, r5, #0
    orr r7, r7, r2, lsl #20
    str r7, [r6, #0x1c8]
    mov ip, r0, asr #31
    mov r5, #0x19000
    ldr r2, .L_scale
    sub r4, r5, #0x1a000
    umull r7, lr, r0, r1
    adds r7, r7, #0x800
    mov r7, r7, lsr #12
    mla lr, r0, r3, lr
    mla lr, ip, r1, lr
    adc r0, lr, #0
    orr r7, r7, r0, lsl #20
    str r7, [r6, #0x1cc]
    str r5, [r6, #0x1d0]
    ldr r5, [r6, #0xb8]
    mov r0, r6
    mov r1, r5, asr #31
    umull lr, ip, r5, r2
    mla ip, r5, r3, ip
    mla ip, r1, r2, ip
    adds r5, lr, #0x800
    adc r1, ip, #0
    mov r5, r5, lsr #12
    orr r5, r5, r1, lsl #20
    str r5, [r6, #0x218]
    ldr r5, [r6, #0xbc]
    mov r1, r5, asr #31
    umull lr, ip, r5, r2
    mla ip, r5, r3, ip
    mla ip, r1, r2, ip
    adds r2, lr, #0x800
    adc r1, ip, #0
    mov r2, r2, lsr #12
    orr r2, r2, r1, lsl #20
    str r2, [r6, #0x21c]
    str r4, [r6, #0x220]
    bl func_ov040_02200378
    mov r0, r6
    bl func_ov040_022005f8
    mov r0, r6
    bl func_ov040_022009e8
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_scale: .word 0x385
    .size func_ov040_02200128, . - func_ov040_02200128
