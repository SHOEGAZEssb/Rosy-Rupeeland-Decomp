.text
.extern func_ov042_021fcf80
.extern func_020adc40
.extern func_020adc90
.extern func_ov042_021ff2f8
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a1ec0
.extern func_ov042_02209af4
.extern func_ov071_022113fc
.extern VecFx32Object_Init
.extern func_ov042_02206fc0
.extern func_020a1794
.extern func_020befec
.extern func_020ae024
.extern func_ov042_021fde00
.extern func_ov042_02203658
.extern func_ov071_02211a10
.extern func_ov042_02205d74
.extern func_0205943c
.extern VecFx32Object_Destroy
.extern Sound_StopDirectSequence
.extern func_020a1f04
.extern genrand_int32
.extern func_ov042_022051a8
.extern func_ov042_021fdd48
.extern data_ov042_0220b19c
.extern data_ov042_0220b25a
.extern data_ov042_0220b31c
.extern data_ov042_0220b500
.extern gSoundContext

    .global func_ov042_02205d80
func_ov042_02205d80:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x350
    mov r9, r0
    add r0, sp, #0x90
    bl func_ov042_021fcf80
    mov r0, #0x5a
    mov r1, #0x0
    add r5, sp, #0x308
    add r2, sp, #0x348
    sub r11, r0, #0xc8
    add ip, sp, #0x310
    add r10, sp, #0x318
    mov r8, #0x6e
    str r0, [r5, #0x0]
    str r0, [r2, #0x0]
    sub r0, r1, #0x50
    str r11, [r2, #0x4]
    add r2, sp, #0x330
    mov r6, #0xa
    add r7, sp, #0x2f8
    str r0, [sp, #0x2ec]
    str r0, [r2, #0x0]
    sub r0, r1, #0x56
    str r1, [sp, #0x2e8]
    str r6, [r7, #0x0]
    str r0, [r7, #0x4]
    add r7, sp, #0x2f0
    sub r1, r1, #0xa
    str r1, [r7, #0x0]
    sub r1, r6, #0x6e
    str r0, [r7, #0x4]
    add r7, sp, #0x300
    add r0, sp, #0x340
    sub r6, r6, #0x64
    str r1, [r5, #0x4]
    sub r5, r8, #0x82
    str r6, [r7, #0x0]
    str r1, [r7, #0x4]
    add r7, sp, #0x320
    str r6, [r0, #0x0]
    sub r6, r8, #0xb4
    str r1, [r0, #0x4]
    mov r3, #0x46
    str r8, [r10, #0x0]
    str r11, [r10, #0x4]
    str r6, [r7, #0x0]
    add r4, sp, #0x328
    str r5, [r7, #0x4]
    str r11, [ip, #0x0]
    str r11, [ip, #0x4]
    stmia r4, {r3, r5}
    sub r1, r3, #0x82
    add r0, sp, #0x338
    mov r8, #0x50
    ldr r10, .L_02206d50
    add r6, sp, #0x228
    str r1, [r2, #0x4]
    str r1, [r0, #0x4]
    str r8, [r0, #0x0]
    mov r1, #0x5f
.L_02205e70:
    ldrh r0, [r10], #0x2
    subs r1, r1, #0x1
    strh r0, [r6], #0x2
    bne .L_02205e70
    add r2, sp, #0x100
    ldr r3, .L_02206d54
    add r2, r2, #0x66
    mov r1, #0x61
.L_02205e90:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02205e90
    ldr r3, .L_02206d58
    add r2, sp, #0x9c
    mov r1, #0x65
.L_02205eac:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02205eac
    ldr r1, [r9, #0xc0]
    add r0, sp, #0x228
    sub r1, r1, #0x1
    str r1, [r9, #0xc0]
    ldr r1, [r9, #0x150]
    cmp r1, #0x1
    addeq r0, sp, #0x100
    addeq r0, r0, #0x66
    cmp r1, #0x2
    ldr r1, [r9, #0xc0]
    addeq r0, sp, #0x9c
    cmp r1, #0x0
    bgt .L_02205f98
    ldr r1, [r9, #0xbc]
    mov r6, #0x0
    mov r1, r1, lsl #0x1
    ldrh r1, [r0, r1]
    add r5, sp, #0x2e8
    add r4, sp, #0x2ec
    and r1, r1, #0xf
    str r1, [r9, #0xc8]
    ldr r1, [r9, #0xbc]
    ldr r3, .L_02206d5c
    mov r1, r1, lsl #0x1
    ldrh r1, [r0, r1]
    ldr r2, .L_02206d60
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x10
    str r1, [r9, #0xcc]
    str r6, [r9, #0xd0]
    ldr r1, [r9, #0xc8]
    ldr r1, [r5, r1, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r9, #0x158]
    ldr r1, [r9, #0xc8]
    ldr r1, [r4, r1, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r9, #0x15c]
    str r3, [r9, #0xc0]
    ldr r1, [r9, #0xbc]
    add r1, r1, #0x1
    str r1, [r9, #0xbc]
    mov r1, r1, lsl #0x1
    ldrh r0, [r0, r1]
    cmp r0, r2
    moveq r0, #0x1
    streq r0, [r9, #0xbc]
    ldr r0, [r9, #0x48]
    ldr r0, [r0, #0x1c8]
    cmp r0, #0x5
    bne .L_02205f98
    ldr r0, [r9, #0xbc]
    cmp r0, #0x5
    movge r0, #0x1
    strge r0, [r9, #0xbc]
.L_02205f98:
    ldr r3, [r9, #0x158]
    ldr r2, [r9, #0xa8]
    ldr r1, [r9, #0x15c]
    ldr r0, [r9, #0xac]
    sub r4, r3, r2
    sub r5, r1, r0
    smull r0, r2, r4, r4
    adds r3, r0, #0x800
    smull r1, r0, r5, r5
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    ldr r2, [r9, #0xb4]
    ldr r3, .L_02206d64
    mov r1, #0x0
    umull r6, r8, r2, r3
    adds r10, r6, #0x800
    mla r8, r2, r1, r8
    mov r7, r2, asr #0x1f
    mov r6, r0
    mla r8, r7, r3, r8
    adc r0, r8, #0x0
    mov r7, r10, lsr #0xc
    orr r7, r7, r0, lsl #0x14
    sub r0, r2, r7
    str r0, [r9, #0xb4]
    ldr r8, [r9, #0xb8]
    umull r0, r2, r8, r3
    adds r0, r0, #0x800
    mov r7, r0, lsr #0xc
    mov r0, r8, asr #0x1f
    mla r2, r8, r1, r2
    mla r2, r0, r3, r2
    adc r0, r2, #0x0
    orr r7, r7, r0, lsl #0x14
    sub r0, r8, r7
    str r0, [r9, #0xb8]
    ldr r0, [r9, #0xd0]
    cmp r0, #0x0
    bne .L_02206290
    ldr r0, [r9, #0xcc]
    mov r1, r6
    cmp r0, #0xf
    mov r0, r4
    beq .L_022060b0
    bl func_020adc90
    ldr r1, .L_02206d68
    mov r2, #0x0
    umull r4, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r4, r4, #0x800
    adc r0, r3, #0x0
    mov r1, r4, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r9, #0xb4]
    mov r0, r5
    add r2, r2, r1
    mov r1, r6
    str r2, [r9, #0xb4]
    bl func_020adc90
    ldr r1, .L_02206d68
    b .L_022060f8
.L_022060b0:
    bl func_020adc90
    ldr r1, .L_02206d6c
    mov r2, #0x0
    umull r4, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r4, r4, #0x800
    adc r0, r3, #0x0
    mov r1, r4, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r9, #0xb4]
    mov r0, r5
    add r2, r2, r1
    mov r1, r6
    str r2, [r9, #0xb4]
    bl func_020adc90
    ldr r1, .L_02206d6c
.L_022060f8:
    mov r2, #0x0
    umull r4, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r4, r4, #0x800
    adc r0, r3, #0x0
    mov r1, r4, lsr #0xc
    ldr r2, [r9, #0xb8]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r9, #0xb8]
    add r0, r9, #0xa4
    add r1, r9, #0xb0
    bl func_ov042_021ff2f8
    cmp r6, #0x5000
    bgt .L_02206b18
    ldr r0, [r9, #0xcc]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9, #0xc0]
    beq .L_02206b18
    mov r0, #0x1
    str r0, [r9, #0xd0]
    ldr r0, [r9, #0x4c]
    ldr r2, [r9, #0xcc]
    ldr r1, [r0, #0xc]
    cmp r2, #0x1
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    bne .L_022061a0
    ldr r0, [r9, #0x4c]
    mov r1, #0xc
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02206b18
.L_022061a0:
    cmp r2, #0x2
    bne .L_022061d0
    ldr r0, [r9, #0x4c]
    mov r1, #0xc
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02206b18
.L_022061d0:
    cmp r2, #0x3
    bne .L_02206200
    ldr r0, [r9, #0x4c]
    mov r1, #0xd
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02206b18
.L_02206200:
    cmp r2, #0x4
    bne .L_02206228
    ldr r0, [r9, #0x4c]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d70
    bl func_020a1ec0
    b .L_02206b18
.L_02206228:
    cmp r2, #0x5
    bne .L_02206244
    ldr r0, [r9, #0x4c]
    mov r1, #0x4
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02206b18
.L_02206244:
    cmp r2, #0x6
    bne .L_02206274
    ldr r0, [r9, #0x4c]
    mov r1, #0xd
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02206b18
.L_02206274:
    cmp r2, #0xf
    bne .L_02206b18
    ldr r0, [r9, #0x4c]
    mov r1, #0xe
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02206b18
.L_02206290:
    add r4, r0, #0x1
    str r4, [r9, #0xd0]
    ldr r5, [r9, #0xcc]
    cmp r5, #0x1
    bne .L_022062e0
    cmp r4, #0x2
    bne .L_022062d4
    ldr r0, [r9, #0x8c]
    add r2, r9, #0xa4
    mov r1, #0x6
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
    str r5, [r9, #0x230]
    mov r0, #0x1
    str r0, [r9, #0x22c]
.L_022062d4:
    cmp r4, #0x3c
    ldreq r4, .L_02206d78
    b .L_02206acc
.L_022062e0:
    sub r0, r5, #0x2
    cmp r0, #0x1
    bhi .L_0220632c
    cmp r4, #0x2
    bne .L_0220631c
    ldr r0, [r9, #0x8c]
    add r1, r5, #0x2
    add r2, r9, #0xa4
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
    str r5, [r9, #0x230]
    mov r0, #0x1
    str r0, [r9, #0x22c]
.L_0220631c:
    ldr r0, [r9, #0xd0]
    cmp r0, #0x3c
    ldreq r4, .L_02206d78
    b .L_02206acc
.L_0220632c:
    cmp r5, #0x4
    bne .L_02206870
    cmp r4, #0x93
    bne .L_02206350
    ldr r0, [r9, #0x4c]
    mov r1, #0xa
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_022063bc
.L_02206350:
    cmp r4, #0x9b
    bne .L_022063bc
    mov r1, #0x1000
    str r1, [r9, #0x20c]
    mov r0, #0x3000
    str r0, [r9, #0x210]
    str r1, [r9, #0x220]
    ldr r0, [r9, #0x4c]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r9, #0x50]
    mov r0, #0x100
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d7c
    bl func_020a1ec0
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d80
    bl func_020a1ec0
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d84
    bl func_020a1ec0
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d88
    bl func_020a1ec0
.L_022063bc:
    ldr r1, [r9, #0x48]
    ldr r0, [r9, #0xac]
    ldr r1, [r1, #0x8]
    ldr r2, [r9, #0xa8]
    ldr r3, [r1, #0x98]
    ldr r1, [r1, #0x9c]
    add r0, r0, #0x28000
    sub r6, r3, r2
    sub r8, r1, r0
    smull r0, r2, r6, r6
    adds r3, r0, #0x800
    smull r1, r0, r8, r8
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r10, r0
    mov r5, #0x1000
    ldr r0, [r9, #0x20c]
    mov r1, r10
    rsb r5, r5, #0x0
    bl func_020adc90
    sub r0, r0, #0x800
    movs r0, r0, lsl #0x1
    str r0, [r9, #0x224]
    rsbmi r0, r0, #0x0
    strmi r0, [r9, #0x224]
    cmp r4, #0x9b
    blt .L_0220685c
    ldr r0, [r9, #0x210]
    cmp r0, #0x0
    bge .L_022064b4
    ldr r0, [r9, #0x20c]
    cmp r0, #0x50000
    bge .L_02206480
    ldr r0, [r9, #0x4c]
    ldr r5, .L_02206d8c
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x10
    beq .L_022064a4
    mov r1, #0x10
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_022064a4
.L_02206480:
    cmp r0, #0xa0000
    bge .L_022064a4
    ldr r0, [r9, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0xb
    beq .L_022064a4
    mov r1, #0xb
    bl GraphicsSpriteState_SetAnimationIndex
.L_022064a4:
    ldr r0, [r9, #0x20c]
    cmp r0, #0x28000
    ldrlt r5, .L_02206d90
    b .L_022064d0
.L_022064b4:
    ldr r0, [r9, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x3
    beq .L_022064d0
    mov r1, #0x3
    bl GraphicsSpriteState_SetAnimationIndex
.L_022064d0:
    ldr r1, [r9, #0x20c]
    ldr r0, [r9, #0x210]
    add r0, r1, r0
    str r0, [r9, #0x20c]
    cmp r0, #0x1000
    mvnlt r0, #0x0
    strlt r0, [r9, #0x20c]
    blt .L_0220685c
    mov r0, r6
    mov r1, r10
    bl func_020adc90
    mov r7, r0
    mov r0, r8
    mov r1, r10
    bl func_020adc90
    ldr r1, [r9, #0x20c]
    sub r2, r10, #0xf000
    mov r8, r0
    cmp r2, r1
    bgt .L_022065c8
    ldr r1, .L_02206d94
    str r2, [r9, #0x20c]
    mov r0, #0x0
    str r0, [r9, #0x210]
    cmp r4, r1
    bge .L_022065a8
    ldr r1, [r9, #0x20c]
    ldr r3, [r9, #0xa8]
    smull r2, r1, r7, r1
    adds r2, r2, #0x800
    adc r1, r1, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [r9, #0x218]
    ldr r1, [r9, #0x20c]
    ldr r3, [r9, #0xac]
    smull r2, r1, r8, r1
    adds r2, r2, #0x800
    adc r0, r1, r0
    mov r1, r2, lsr #0xc
    add r2, r3, #0x28000
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r9, #0x21c]
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d98
    ldr r0, [r0, #0x8]
    add r2, r9, #0x214
    bl func_ov071_022113fc
    ldr r1, .L_02206d94
    mov r0, #0x1
    str r1, [r9, #0xd0]
    str r0, [r9, #0x248]
.L_022065a8:
    ldr r3, [r9, #0x50]
    mov r1, #0x0
    ldrh r2, [r3, #0x42]
    mov r0, #0xe
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    str r1, [r9, #0xd0]
    str r0, [r9, #0xcc]
.L_022065c8:
    ldr r0, [r9, #0x20c]
    ldr r2, [r9, #0xa8]
    smull r1, r0, r7, r0
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r9, #0x218]
    ldr r0, [r9, #0x20c]
    ldr r2, [r9, #0xac]
    smull r1, r0, r8, r0
    adds r1, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r2, r2, #0x28000
    add r1, r2, r1
    str r1, [r9, #0x21c]
    mov r1, r7, asr #0x1f
    add r0, sp, #0x80
    str r1, [sp, #0x10]
    mov r11, r8, asr #0x1f
    bl VecFx32Object_Init
    ldr r1, .L_02206d9c
    mov r0, r7, lsl #0x4
    str r0, [sp, #0x24]
    mov r0, r8, lsl #0x4
    str r1, [sp, #0x20]
    str r0, [sp, #0x28]
    add r0, sp, #0x74
    add r1, r9, #0x214
    add r2, sp, #0x20
    bl func_ov042_02206fc0
    ldr r0, [r9, #0x48]
    add r1, sp, #0x74
    add r2, sp, #0x80
    mov r3, #0x0
    bl func_020a1794
    ldr r1, [sp, #0x84]
    mov r0, #0x18
    str r1, [r9, #0x254]
    ldr r2, [sp, #0x88]
    mul r0, r4, r0
    str r2, [r9, #0x258]
    ldr r2, [sp, #0x84]
    mov r1, #0x60
    str r2, [r9, #0x268]
    ldr r2, [sp, #0x88]
    str r2, [r9, #0x26c]
    bl func_020befec
    mov r6, r1, lsl #0xc
    rsb r0, r7, #0x0
    mov r1, r8
    bl func_020ae024
    str r0, [sp, #0x8]
    b .L_02206728
.L_022066ac:
    add r0, sp, #0x68
    bl func_ov042_021fcf80
    umull r10, r0, r7, r6
    adds r3, r10, #0x800
    mov lr, r6, asr #0x1f
    mla r0, r7, lr, r0
    ldr r10, [sp, #0x10]
    ldr ip, [r9, #0xa8]
    mla r0, r10, r6, r0
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    orr r3, r3, r0, lsl #0x14
    add r0, ip, r3
    umull r10, r3, r8, r6
    mla r3, r8, lr, r3
    ldr r1, [sp, #0x8]
    adds r10, r10, #0x800
    mla r3, r11, r6, r3
    str r0, [sp, #0x6c]
    ldr r0, [r9, #0xac]
    mov r10, r10, lsr #0xc
    adc r3, r3, #0x0
    add r0, r0, #0x28000
    orr r10, r10, r3, lsl #0x14
    add r0, r0, r10
    str r0, [sp, #0x70]
    ldr r0, [r9, #0x48]
    add r2, sp, #0x68
    ldr r0, [r0, #0x14]
    bl func_ov042_021fde00
    add r6, r6, #0x60000
.L_02206728:
    ldr r0, [r9, #0x20c]
    cmp r6, r0
    blt .L_022066ac
    add r0, sp, #0x14
    add r1, r9, #0x214
    bl func_ov042_02203658
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x48]
    add r1, sp, #0x14
    ldr r0, [r0, #0x8]
    mov r2, #0x28000
    ldr r0, [r0, #0xe8]
    mov r3, #0x3
    bl func_ov071_02211a10
    movs r6, r0
    ldr r0, [r9, #0x220]
    beq .L_022067ac
    add r0, r0, #0x7b
    str r0, [r9, #0x220]
    cmp r0, #0x1800
    movgt r0, #0x1800
    strgt r0, [r9, #0x220]
    mov r0, #0x6
    str r0, [r9, #0x244]
    ldr r0, [r9, #0x220]
    mov r1, #0xbe
    sub r0, r0, #0x1000
    bl func_020befec
    str r0, [r9, #0x25c]
    mov r0, #0x0
    str r0, [r9, #0x260]
    b .L_022067c0
.L_022067ac:
    sub r0, r0, #0x31
    str r0, [r9, #0x220]
    cmp r0, #0x1000
    movlt r0, #0x1000
    strlt r0, [r9, #0x220]
.L_022067c0:
    ldr r2, [r9, #0x220]
    ldr r0, [r9, #0x50]
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    mov r2, r1
    bl func_ov042_02205d74
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, .L_02206da0
    ldr r2, [r9, #0x25c]
    ldr r0, [r0, #0x0]
    rsb r3, r2, r2, lsl #0x3
    ldr r1, .L_02206da4
    mov r2, #0xa
    bl func_0205943c
    cmp r6, #0x0
    cmpgt r4, #0xb3
    ldr r0, [r9, #0x210]
    ble .L_0220683c
    cmp r0, #0x3000
    movgt r0, #0x3000
    strgt r0, [r9, #0x210]
    ldr r0, [r9, #0x210]
    sub r0, r0, #0xcd
    sub r0, r0, #0x400
    str r0, [r9, #0x210]
    cmp r0, r5
    strlt r5, [r9, #0x210]
    b .L_02206854
.L_0220683c:
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r9, #0x210]
    cmp r0, #0x6000
    movgt r0, #0x6000
    strgt r0, [r9, #0x210]
.L_02206854:
    add r0, sp, #0x80
    bl VecFx32Object_Destroy
.L_0220685c:
    ldr r0, .L_02206da8
    cmp r4, r0
    addeq r0, r0, #0x3d
    streq r0, [r9, #0xd0]
    b .L_02206acc
.L_02206870:
    cmp r5, #0x5
    bne .L_0220691c
    cmp r4, #0x5
    bne .L_0220689c
    ldr r0, [r9, #0x8c]
    add r2, r9, #0xa4
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
    b .L_02206910
.L_0220689c:
    cmp r4, #0x14
    bne .L_022068c4
    ldr r0, [r9, #0x90]
    add r2, r9, #0xa4
    mov r1, #0x1
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
    b .L_02206910
.L_022068c4:
    cmp r4, #0x23
    bne .L_022068ec
    ldr r0, [r9, #0x94]
    add r2, r9, #0xa4
    mov r1, #0x2
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
    b .L_02206910
.L_022068ec:
    cmp r4, #0x32
    bne .L_02206910
    ldr r0, [r9, #0x98]
    add r2, r9, #0xa4
    mov r1, #0x3
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
.L_02206910:
    cmp r4, #0x32
    ldrge r4, .L_02206d78
    b .L_02206acc
.L_0220691c:
    cmp r5, #0x6
    bne .L_02206954
    cmp r4, #0x5
    bne .L_02206948
    ldr r0, [r9, #0x9c]
    add r2, r9, #0xa4
    mov r1, #0x7
    bl func_ov042_02209af4
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206d74
    bl func_020a1ec0
.L_02206948:
    cmp r4, #0x1e
    ldrge r4, .L_02206d78
    b .L_02206acc
.L_02206954:
    cmp r5, #0xf
    bne .L_02206a84
    ldr r0, [r9, #0x150]
    cmp r0, #0x0
    bne .L_02206a2c
    cmp r4, #0x2
    bne .L_022069a4
    ldr r0, [r9, #0x54]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x54]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r9, #0x54]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_02206acc
.L_022069a4:
    cmp r4, #0x3c
    bne .L_022069cc
    ldr r0, [r9, #0x4c]
    mov r1, #0xf
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x48]
    ldr r1, .L_02206dac
    bl func_020a1ec0
    b .L_02206acc
.L_022069cc:
    cmp r4, #0xc8
    bne .L_022069fc
    ldr r0, [r9, #0x54]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r9, #0x54]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02206acc
.L_022069fc:
    ble .L_02206acc
    ldr r1, [r9, #0x54]
    ldr r0, [r1, #0xc]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneh r0, [r1, #0x42]
    ldrne r4, .L_02206d78
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x42]
    b .L_02206acc
.L_02206a2c:
    cmp r0, #0x1
    bne .L_02206a5c
    cmp r4, #0x2
    bne .L_02206a50
    ldr r0, [r9, #0x4c]
    mov r1, #0x12
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02206acc
.L_02206a50:
    cmp r4, #0x64
    ldrgt r4, .L_02206d78
    b .L_02206acc
.L_02206a5c:
    cmp r4, #0x2
    bne .L_02206a78
    ldr r0, [r9, #0x4c]
    mov r1, #0x13
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02206acc
.L_02206a78:
    cmp r4, #0x64
    ldrgt r4, .L_02206d78
    b .L_02206acc
.L_02206a84:
    cmp r5, #0xe
    bne .L_02206acc
    cmp r4, #0x1
    bne .L_02206aa8
    ldr r0, [r9, #0x4c]
    mov r1, #0xe
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02206acc
.L_02206aa8:
    cmp r4, #0x1e
    bne .L_02206ac4
    ldr r0, [r9, #0x4c]
    mov r1, #0xf
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02206acc
.L_02206ac4:
    cmp r4, #0x64
    ldrgt r4, .L_02206d78
.L_02206acc:
    ldr r0, .L_02206d78
    cmp r4, r0
    blt .L_02206b18
    ldr r0, [r9, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r9, #0x4c]
    mov r0, #0x0
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r2, [r9, #0x50]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    str r0, [r9, #0x20c]
    str r0, [r9, #0xc0]
.L_02206b18:
    ldr r0, [r9, #0x22c]
    cmp r0, #0x0
    beq .L_02206b84
    add r0, r0, #0x1
    str r0, [r9, #0x22c]
    cmp r0, #0x5a
    bne .L_02206b84
    ldr r1, [r9, #0x230]
    mov r0, #0x1
    str r1, [r9, #0x238]
    str r0, [r9, #0x234]
    mov r2, #0x0
    ldr r0, .L_02206da0
    str r2, [r9, #0x22c]
    ldr r0, [r0, #0x0]
    mov r1, #0xa4
    bl Sound_StopDirectSequence
    ldr r0, .L_02206da0
    mov r1, #0xa5
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, .L_02206da0
    mov r1, #0xcd
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
.L_02206b84:
    ldr r0, [r9, #0x234]
    cmp r0, #0x0
    beq .L_02206e9c
    add r0, r0, #0x1
    str r0, [r9, #0x234]
    cmp r0, #0x1e
    bne .L_02206bd0
    ldr r0, [r9, #0x238]
    cmp r0, #0x1
    bne .L_02206bbc
    ldr r0, [r9, #0x48]
    mov r1, #0xcd
    bl func_020a1f04
    b .L_02206bd0
.L_02206bbc:
    add r0, r0, #0xa2
    mov r1, r0, lsl #0x10
    ldr r0, [r9, #0x48]
    mov r1, r1, lsr #0x10
    bl func_020a1f04
.L_02206bd0:
    ldr r0, [r9, #0x238]
    cmp r0, #0x1
    bne .L_02206c88
    ldr r0, [r9, #0x234]
    cmp r0, #0x1e
    ble .L_02206c34
    add r0, sp, #0x5c
    bl func_ov042_021fcf80
    bl genrand_int32
    mov r4, r0
    ldr r0, [r9, #0x234]
    mov r1, #0xa
    bl func_020befec
    ldr r0, .L_02206db0
    sub r2, r1, #0x5
    mov r1, #0x28000
    and r0, r4, r0
    add r0, r0, r2, lsl #0x11
    str r1, [sp, #0x64]
    str r0, [sp, #0x60]
    ldr r0, [r9, #0xa0]
    mov r1, #0x4
    add r2, sp, #0x5c
    mov r3, #0x0
    bl func_ov042_022051a8
.L_02206c34:
    add r0, sp, #0x50
    bl func_ov042_021fcf80
    ldr r0, [r9, #0x234]
    mov r1, #0xf
    bl func_020befec
    sub r1, r1, #0x7
    mov r0, #0x15
    mul r0, r1, r0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x54]
    bl genrand_int32
    and r0, r0, #0xf
    add r0, r0, #0x64
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x58]
    ldr r0, [r9, #0x48]
    add r2, sp, #0x50
    ldr r0, [r0, #0x14]
    mov r1, #0x0
    bl func_ov042_021fdd48
    b .L_02206e50
.L_02206c88:
    sub r0, r0, #0x2
    cmp r0, #0x1
    bhi .L_02206e50
    add r0, sp, #0x44
    bl func_ov042_021fcf80
    ldr r0, [r9, #0x238]
    cmp r0, #0x2
    ldr r0, [r9, #0x234]
    bne .L_02206db4
    cmp r0, #0x1e
    ble .L_02206cfc
    mov r0, #0x7f000
    rsb r0, r0, #0x0
    str r0, [sp, #0x48]
    bl genrand_int32
    ldr r1, [r9, #0x234]
    ldr r3, .L_02206db0
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    and r0, r0, r3
    add r1, r1, #0x3
    add r0, r0, r1, lsl #0x11
    str r0, [sp, #0x4c]
    ldr r0, [r9, #0xa0]
    add r2, sp, #0x44
    mov r1, #0x4
    mov r3, #0x4000
    bl func_ov042_022051a8
.L_02206cfc:
    add r0, sp, #0x38
    bl func_ov042_021fcf80
    bl genrand_int32
    and r0, r0, #0xf
    sub r0, r0, #0x7f
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x3c]
    ldr r0, [r9, #0x234]
    mov r1, #0x9
    bl func_020befec
    add r1, r1, #0x5
    mov r0, #0x15
    mul r0, r1, r0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x40]
    ldr r0, [r9, #0x48]
    add r2, sp, #0x38
    ldr r0, [r0, #0x14]
    mov r1, #0x0
    bl func_ov042_021fdd48
    b .L_02206e50
.L_02206d50: .word data_ov042_0220b19c
.L_02206d54: .word data_ov042_0220b25a
.L_02206d58: .word data_ov042_0220b31c
.L_02206d5c: .word 0x4e20
.L_02206d60: .word 0xffff
.L_02206d64: .word 0x19a
.L_02206d68: .word 0x333
.L_02206d6c: .word 0x28f
.L_02206d70: .word 0xb509
.L_02206d74: .word 0xb503
.L_02206d78: .word 0x2710
.L_02206d7c: .word 0xb505
.L_02206d80: .word 0xb506
.L_02206d84: .word 0xb50b
.L_02206d88: .word 0xb50a
.L_02206d8c: .word 0xfffff333
.L_02206d90: .word 0xfffff666
.L_02206d94: .word 0x26d4
.L_02206d98: .word 0x186a0
.L_02206d9c: .word data_ov042_0220b500
.L_02206da0: .word gSoundContext
.L_02206da4: .word 0x16a
.L_02206da8: .word 0x26d3
.L_02206dac: .word 0xb502
.L_02206db0: .word 0x1ffff
.L_02206db4:
    cmp r0, #0x1e
    ble .L_02206e00
    mov r0, #0x7f000
    str r0, [sp, #0x48]
    bl genrand_int32
    ldr r1, [r9, #0x234]
    ldr r3, .L_02206db0
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    and r0, r0, r3
    add r1, r1, #0x3
    add r0, r0, r1, lsl #0x11
    str r0, [sp, #0x4c]
    ldr r0, [r9, #0xa0]
    add r2, sp, #0x44
    mov r1, #0x4
    mov r3, #0xc000
    bl func_ov042_022051a8
.L_02206e00:
    add r0, sp, #0x2c
    bl func_ov042_021fcf80
    bl genrand_int32
    and r0, r0, #0xf
    rsb r0, r0, #0x7f
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x30]
    ldr r0, [r9, #0x234]
    mov r1, #0x9
    bl func_020befec
    add r1, r1, #0x5
    mov r0, #0x15
    mul r0, r1, r0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x34]
    ldr r0, [r9, #0x48]
    add r2, sp, #0x2c
    ldr r0, [r0, #0x14]
    mov r1, #0x0
    bl func_ov042_021fdd48
.L_02206e50:
    ldr r0, [r9, #0x234]
    cmp r0, #0xf0
    blt .L_02206e9c
    mov r2, #0x0
    ldr r0, .L_02206da0
    str r2, [r9, #0x234]
    ldr r0, [r0, #0x0]
    mov r1, #0xa4
    bl Sound_StopDirectSequence
    ldr r0, .L_02206da0
    mov r1, #0xa5
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, .L_02206da0
    mov r1, #0xcd
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
.L_02206e9c:
    mov r4, #0x0
    mov r0, #0x4
    sub r3, r0, #0x1
    mov r5, r4
    mov r0, r4
    mov r1, #0x1
.L_02206eb4:
    add r2, r9, r3, lsl #0x2
    ldr r2, [r2, #0x8c]
    ldr r2, [r2, #0x74]
    cmp r2, #0x2
    moveq r2, r1
    movne r2, r0
    cmp r2, #0x0
    addne r4, r4, #0x1
    subs r3, r3, #0x1
    bpl .L_02206eb4
    ldr r0, [r9, #0x9c]
    ldr r0, [r0, #0x74]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    addne r5, r5, #0x1
    cmp r4, #0x0
    bne .L_02206f2c
    ldr r0, [r9, #0x1ec]
    tst r0, #0x1
    beq .L_02206f2c
    ldr r0, .L_02206da0
    mov r1, #0xea
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, [r9, #0x1ec]
    bic r0, r0, #0x1
    str r0, [r9, #0x1ec]
.L_02206f2c:
    cmp r4, #0x0
    ble .L_02206f58
    ldr r0, [r9, #0x1ec]
    tst r0, #0x1
    bne .L_02206f58
    ldr r0, [r9, #0x48]
    mov r1, #0xea
    bl func_020a1f04
    ldr r0, [r9, #0x1ec]
    orr r0, r0, #0x1
    str r0, [r9, #0x1ec]
.L_02206f58:
    cmp r5, #0x0
    bne .L_02206f8c
    ldr r0, [r9, #0x1ec]
    tst r0, #0x2
    beq .L_02206f8c
    ldr r0, .L_02206da0
    mov r1, #0xf0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, [r9, #0x1ec]
    bic r0, r0, #0x2
    str r0, [r9, #0x1ec]
.L_02206f8c:
    cmp r5, #0x0
    ble .L_02206fb8
    ldr r0, [r9, #0x1ec]
    tst r0, #0x2
    bne .L_02206fb8
    ldr r0, [r9, #0x48]
    mov r1, #0xf0
    bl func_020a1f04
    ldr r0, [r9, #0x1ec]
    orr r0, r0, #0x2
    str r0, [r9, #0x1ec]
.L_02206fb8:
    add sp, sp, #0x350
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov042_02205d80, . - func_ov042_02205d80

