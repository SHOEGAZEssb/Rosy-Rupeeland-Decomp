.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_camera_interaction.c. */
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_02059278
.extern func_020a214c
.extern func_020a6990
.extern func_020a6aa8
.extern func_020be334
.extern func_020bf1f8
.extern func_ov041_021fe56c
.extern func_ov041_021fffc8
.extern func_ov041_02200ce8
.extern func_ov041_02203434
.extern func_ov070_02211dcc
.extern gSoundContext
.extern genrand_int32

    .global func_ov041_021feec8
func_ov041_021feec8: ; 0x021feec8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldr r0, [r7, #0x1f4]
    mov r1, #0x1
    cmp r0, #0x0
    cmpne r0, #0x2
    movne r1, #0x0
    cmp r1, #0x0
    ldr r4, [r7, #0x1a0]
    ldr r0, .L_021ff1c0
    mov r1, #0x0
    umull r3, r2, r4, r0
    mla r2, r4, r1, r2
    mov r1, r4, asr #0x1f
    mla r2, r1, r0, r2
    movne r6, #0x4800
    moveq r6, #0x8000
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    ldr r0, [r7, #0x190]
    orr r2, r2, r1, lsl #0x14
    ldr r5, [r7, #0x1ac]
    sub r1, r2, r0
    smull r0, r2, r1, r5
    adds r4, r0, #0x800
    ldr r1, [r7, #0x1a4]
    ldr r0, [r7, #0x194]
    adc r3, r2, #0x0
    sub r0, r1, r0
    smull r2, r1, r0, r5
    mov r5, r4, lsr #0xc
    adds r2, r2, #0x800
    orr r5, r5, r3, lsl #0x14
    mov r0, r5
    adc r1, r1, #0x0
    mov r4, r2, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    bl func_020be334
    cmp r0, r6
    ble .L_021fef88
    cmp r5, #0x0
    mvnlt r0, #0x0
    blt .L_021fef84
    movgt r0, #0x1
    movle r0, #0x0
.L_021fef84:
    mul r5, r6, r0
.L_021fef88:
    mov r0, r4
    bl func_020be334
    cmp r0, r6
    ble .L_021fefb0
    cmp r4, #0x0
    mvnlt r0, #0x0
    blt .L_021fefac
    movgt r0, #0x1
    movle r0, #0x0
.L_021fefac:
    mul r4, r6, r0
.L_021fefb0:
    mov r0, r5
    bl func_020be334
    ldr r1, .L_021ff1c4
    cmp r0, r1
    mov r0, r4
    movle r5, #0x0
    bl func_020be334
    ldr r1, .L_021ff1c4
    cmp r0, r1
    ldr r0, [r7, #0x190]
    movle r4, #0x0
    add r0, r0, r5
    str r0, [r7, #0x190]
    ldr r0, [r7, #0x194]
    add r0, r0, r4
    str r0, [r7, #0x194]
    ldr r0, [r7, #0x1cc]
    cmp r0, #0x1
    bne .L_021ff054
    ldr r1, [r7, #0x1d0]
    mov r0, #0x64
    rsb r1, r1, #0x96
    mul r4, r1, r0
    cmp r4, #0x1000
    movgt r4, #0x1000
    cmp r4, #0x0
    movlt r4, #0x0
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    ldr r2, [r7, #0x190]
    sub r0, r1, #0x5
    mla r0, r4, r0, r2
    str r0, [r7, #0x190]
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    ldr r2, [r7, #0x194]
    sub r0, r1, #0x5
    mla r0, r4, r0, r2
    str r0, [r7, #0x194]
.L_021ff054:
    ldr r0, [r7, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021ff094
    ldr r0, [r7, #0x194]
    cmp r0, #0xc0000
    movlt r0, #0xc0000
    strlt r0, [r7, #0x194]
    ldr r1, [r7, #0x174]
    mov r0, #0x60
    sub r1, r1, #0x3
    mul r2, r1, r0
    ldr r0, [r7, #0x194]
    mov r1, r2, lsl #0xc
    cmp r0, r2, lsl #0xc
    strgt r1, [r7, #0x194]
.L_021ff094:
    ldr r2, [r7, #0x1b0]
    ldr r1, [r7, #0x194]
    add r0, sp, #0x0
    sub r1, r2, r1
    mov r1, r1, asr #0x2
    str r1, [r7, #0x1b4]
    ldr r2, [r7, #0x194]
    add r1, r7, #0x18c
    str r2, [r7, #0x1b0]
    bl VecFx32Object_InitCopy
    ldr r0, [r7, #0x1ec]
    cmp r0, #0x0
    moveq r1, #0xc0000
    rsbeq r1, r1, #0x0
    ldr r0, [sp, #0x8]
    movne r1, #0x0
    add r0, r0, r1
    str r0, [sp, #0x8]
    ldr r0, [r7, #0x1cc]
    cmp r0, #0x1
    bne .L_021ff144
    ldr r0, [r7, #0x1d0]
    cmp r0, #0x2d
    ble .L_021ff144
    add r0, r7, #0x1c
    mov r1, #0x0
    mov r2, #0x6
    bl func_020a6990
    cmp r0, #0x0
    beq .L_021ff128
    mov r1, #0x2
    ldr r0, .L_021ff1c8
    str r1, [r7, #0x1cc]
    ldr r0, [r0, #0x0]
    mov r1, #0x5f
    mov r2, #0x7f
    bl func_02059278
.L_021ff128:
    ldr r0, [r7, #0x1ec]
    cmp r0, #0x0
    beq .L_021ff144
    add r1, sp, #0x0
    add r0, r7, #0x1c
    mov r2, #0x4
    bl func_020a6aa8
.L_021ff144:
    ldr r0, [r7, #0x1f8]
    cmp r0, #0x0
    bne .L_021ff198
    ldr r0, [r7, #0x10]
    add r1, sp, #0x0
    bl func_ov041_021fffc8
    ldr r0, [r7, #0x8]
    add r1, sp, #0x0
    bl func_ov070_02211dcc
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    beq .L_021ff17c
    add r1, sp, #0x0
    bl func_ov041_02203434
.L_021ff17c:
    ldr r0, [r7, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021ff198
    ldr r0, [r7, #0x14]
    add r1, sp, #0x0
    bl func_ov041_02200ce8
.L_021ff198:
    ldr r0, [r7, #0x18]
    add r1, sp, #0x0
    mov r2, #0x0
    bl func_020a214c
    mov r0, r7
    bl func_ov041_021fe56c
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021ff1c0: .word 0xbd7
.L_021ff1c4: .word 0x19a
.L_021ff1c8: .word gSoundContext
    .size func_ov041_021feec8, . - func_ov041_021feec8

