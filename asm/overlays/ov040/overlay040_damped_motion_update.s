    .text
/* Exact fallback; see overlay040_motion_vectors_init.c for portable C. */
    .extern __register_global_object
    .extern data_ov040_02207dc0
    .extern data_ov040_02207de0
    .extern data_ov040_02207e04
    .extern func_020adc40
    .extern func_020adc90
    .extern func_ov040_021fd724
    .extern func_ov040_021fd740
    .extern func_ov040_022005d4
    .global func_ov040_02200378
func_ov040_02200378:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r4, [r6, #0xb8]
    ldr r5, [r6, #0xbc]
    smull r0, r2, r4, r4
    adds r3, r0, #0x800
    smull r1, r0, r5, r5
    adc r2, r2, #0
    adds r1, r1, #0x800
    mov r3, r3, lsr #12
    adc r0, r0, #0
    mov r1, r1, lsr #12
    orr r3, r3, r2, lsl #20
    orr r1, r1, r0, lsl #20
    add r0, r3, r1
    bl func_020adc40
    mov r7, r0
    mov r0, r4
    mov r1, r7
    bl func_020adc90
    mov r4, r0
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mvn r1, #0x27
    mul r3, r4, r1
    mul r2, r0, r1
    str r3, [r6, #0x1e8]
    str r2, [r6, #0x1ec]
    mov r1, r1, lsl #10
    ldr r0, .L_global
    str r1, [r6, #0x1f0]
    ldr r0, [r0, #0xc]
    tst r0, #1
    bne .L_registered
    ldr r0, .L_record
    bl func_ov040_021fd724
    ldr r0, .L_record
    ldr r1, .L_destructor
    ldr r2, .L_chain
    bl __register_global_object
    ldr r0, .L_global
    ldr r1, [r0, #0xc]
    orr r1, r1, #1
    str r1, [r0, #0xc]
.L_registered:
    ldr r2, .L_global
    ldr r1, [r6, #0xb8]
    ldr r0, [r2, #0x24]
    ldr r3, [r6, #0x8b0]
    sub r0, r1, r0
    ldr r4, [r6, #0xbc]
    ldr r1, [r2, #0x28]
    sub r0, r3, r0, asr #4
    str r0, [r6, #0x8b0]
    ldr r0, [r6, #0x8b4]
    sub r1, r4, r1
    sub r0, r0, r1, asr #4
    str r0, [r6, #0x8b4]
    ldr r1, [r6, #0xb8]
    ldr r0, .L_damping
    str r1, [r2, #0x24]
    ldr r3, [r6, #0xbc]
    mov r1, #0
    str r3, [r2, #0x28]
    ldr r2, [r6, #0x8b0]
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r2, r2, asr #31
    mla r3, r2, r0, r3
    adds r4, r4, #0x800
    adc r2, r3, #0
    mov r3, r4, lsr #12
    orr r3, r3, r2, lsl #20
    str r3, [r6, #0x8b0]
    ldr r2, [r6, #0x8b4]
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #31
    mla r3, r1, r0, r3
    adds r4, r4, #0x800
    adc r0, r3, #0
    mov r1, r4, lsr #12
    orr r1, r1, r0, lsl #20
    str r1, [r6, #0x8b4]
    ldr r0, [r6, #0x880]
    cmp r0, #0
    ldr r0, [r6, #0x8b0]
    subgt r0, r0, #0xa4
    addle r0, r0, #0xa4
    str r0, [r6, #0x8b0]
    ldr r0, [r6, #0x884]
    cmp r0, #0
    ldr r0, [r6, #0x8b4]
    subgt r0, r0, #0xa4
    addle r0, r0, #0xa4
    str r0, [r6, #0x8b4]
    ldr r0, [r6, #0x880]
    cmp r0, #0x2000
    movgt r0, #0x2000
    strgt r0, [r6, #0x880]
    movgt r0, #0
    strgt r0, [r6, #0x8b0]
    mov r0, #0x2000
    ldr r1, [r6, #0x880]
    rsb r0, r0, #0
    cmp r1, r0
    strlt r0, [r6, #0x880]
    movlt r0, #0
    strlt r0, [r6, #0x8b0]
    ldr r0, [r6, #0x884]
    cmp r0, #0x2000
    movgt r0, #0x2000
    strgt r0, [r6, #0x884]
    movgt r0, #0
    strgt r0, [r6, #0x8b4]
    mov r0, #0x2000
    ldr r1, [r6, #0x884]
    rsb r0, r0, #0
    cmp r1, r0
    strlt r0, [r6, #0x884]
    movlt r0, #0
    strlt r0, [r6, #0x8b4]
    add r0, r6, #0x7c
    add r1, r6, #0xac
    add r0, r0, #0x800
    add r1, r1, #0x800
    bl func_ov040_022005d4
    ldr r1, [r6, #0x880]
    ldr r0, .L_display_scale
    sub r1, r1, #0x5000
    str r1, [r6, #0x3ec]
    ldr r2, [r6, #0x884]
    mov r1, #0
    umull r4, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #31
    mla r3, r1, r0, r3
    adds r4, r4, #0x800
    adc r0, r3, #0
    mov r1, r4, lsr #12
    orr r1, r1, r0, lsl #20
    add r0, r1, #0x9a
    add r0, r0, #0x100
    str r0, [r6, #0x3e8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_global: .word data_ov040_02207dc0
.L_record: .word data_ov040_02207de0
.L_destructor: .word func_ov040_021fd740
.L_chain: .word data_ov040_02207e04
.L_damping: .word 0xfd7
.L_display_scale: .word 0x19a
    .size func_ov040_02200378, . - func_ov040_02200378
