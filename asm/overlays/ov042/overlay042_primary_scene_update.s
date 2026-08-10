.text
.extern func_ov042_02205d80
.extern func_0205940c
.extern func_020594bc
.extern func_020594d4
.extern func_0205946c
.extern func_ov042_0220549c
.extern func_ov042_02209cd8
.extern func_ov042_021fdd48
.extern func_020befec
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a1e10
.extern func_ov042_021fcf80
.extern genrand_int32
.extern func_020bf1f8
.extern func_ov042_021fe1c4
.extern func_ov042_021fe098
.extern func_020a1ec0
.extern func_ov042_021ff2f8
.extern func_ov042_02203658
.extern func_ov071_02211a10
.extern func_020595b0
.extern func_0205929c
.extern func_ov042_02205180
.extern func_ov042_02209cbc
.extern func_ov042_02206ff8
.extern func_020adc90
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern func_020a1e50
.extern func_ov042_022008f8
.extern func_0205958c
.extern func_ov042_021fea78
.extern func_020a1794
.extern func_020050a4
.extern func_ov042_021fdeac
.extern func_ov042_022009a0
.extern gSoundContext
.extern data_020c9670
.extern data_ov042_0220b190
.extern data_020f4dc8

    .global func_ov042_02207114
func_ov042_02207114:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4c
    mov r6, r0
    ldr r1, [r6, #0x1bc]
    cmp r1, #0x0
    ldreq r1, [r6, #0x1c4]
    cmpeq r1, #0x0
    ldreq r1, [r6, #0x1b0]
    cmpeq r1, #0x0
    bne .L_02207140
    bl func_ov042_02205d80
.L_02207140:
    ldr r0, [r6, #0x224]
    cmp r0, #0x0
    strge r0, [r6, #0x228]
    bge .L_0220719c
    ldr r0, [r6, #0x228]
    subs r0, r0, #0x4c
    str r0, [r6, #0x228]
    bpl .L_0220719c
    ldr r0, .L_02207dd8
    ldr r1, .L_02207ddc
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    bl func_0205940c
    ldr r0, .L_02207dd8
    ldr r1, .L_02207ddc
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl func_0205940c
    ldr r0, .L_02207dd8
    ldr r1, .L_02207ddc
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl func_0205940c
.L_0220719c:
    mvn r0, #0x0
    str r0, [r6, #0x224]
    ldr r4, [r6, #0x228]
    cmp r4, #0x0
    blt .L_0220727c
    mov r0, #0xff000
    umull r3, r2, r4, r0
    mov r1, #0x0
    mla r2, r4, r1, r2
    mov r1, r4, asr #0x1f
    adds r3, r3, #0x800
    mla r2, r1, r0, r2
    ldr r0, .L_02207dd8
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    ldr r0, [r0, #0x0]
    ldr r1, .L_02207ddc
    mov r3, r2, asr #0xc
    mov r2, #0x6
    bl func_020594bc
    ldr r3, [r6, #0x228]
    mov r1, #0xef000
    umull r2, r4, r3, r1
    mov r0, #0x0
    adds r5, r2, #0x800
    ldr r2, .L_02207dd8
    mla r4, r3, r0, r4
    ldr r0, [r2, #0x0]
    mov r2, r3, asr #0x1f
    mla r4, r2, r1, r4
    adc r1, r4, #0x0
    mov r2, r5, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r2, r2, asr #0xc
    ldr r1, .L_02207ddc
    add r3, r2, #0x10
    mov r2, #0x6
    bl func_020594d4
    ldr r0, .L_02207dd8
    ldr r1, .L_02207ddc
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    ldr ip, [r6, #0x228]
    mov r4, #0x0
    mov r5, ip, asr #0x1f
    mov r3, #0xc00000
    umull r7, lr, ip, r3
    mla lr, ip, r4, lr
    mla lr, r5, r3, lr
    adds r4, r7, #0x800
    adc r3, lr, #0x0
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    mov r3, r4, asr #0xc
    bl func_0205946c
.L_0220727c:
    ldr r0, [r6, #0xa0]
    bl func_ov042_0220549c
    mov r0, #0x5
    sub r4, r0, #0x1
.L_0220728c:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x8c]
    bl func_ov042_02209cd8
    subs r4, r4, #0x1
    bpl .L_0220728c
    ldr r0, [r6, #0x1f0]
    cmp r0, #0x0
    beq .L_022072d4
    cmp r0, #0x1
    bne .L_022072d4
    ldr r0, [r6, #0x1f8]
    add r2, r6, #0x1f4
    add r0, r0, #0xa000
    str r0, [r6, #0x1f8]
    ldr r0, [r6, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x14]
    bl func_ov042_021fdd48
.L_022072d4:
    ldr r5, [r6, #0x1b0]
    cmp r5, #0x0
    beq .L_022073d8
    mov r0, r5
    mov r1, #0x3c
    bl func_020befec
    mov r1, #0x46
    mul r4, r0, r1
    mov r0, r5
    mov r1, #0x3c
    bl func_020befec
    add r0, r1, r1, lsl #0x2
    mov r1, #0x3
    bl func_020befec
    cmp r0, #0x46
    movgt r0, #0x46
    add r1, r4, #0x2e
    add r0, r0, r1
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r2, [r6, #0x4c]
    ldr r0, .L_02207de0
    mov r1, r1, lsl #0x1
    ldrsh r3, [r0, r1]
    ldrh r0, [r2, #0x42]
    mov r1, #0x0
    mov r3, r3, asr #0x4
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    rsb r0, r3, #0x100
    mov r0, r0, lsl #0x10
    ldr r2, [r6, #0x4c]
    mov r0, r0, asr #0x10
    strh r0, [r2, #0x3c]
    strh r0, [r2, #0x3e]
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0xc]
    strh r1, [r0, #0x30]
    ldr r0, [r6, #0x1b0]
    add r0, r0, #0x1
    str r0, [r6, #0x1b0]
    cmp r0, #0xb4
    ble .L_022073c4
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r6, #0x1b0]
    ldr r1, [r6, #0x4c]
    mov r0, #0x100
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r0, [r6, #0xac]
    add r0, r0, #0x1e000
    str r0, [r6, #0xac]
    ldr r0, [r6, #0x48]
    bl func_020a1e10
.L_022073c4:
    ldr r0, [r6, #0x48]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    str r1, [r0, #0x240]
    b .L_02207bbc
.L_022073d8:
    ldr r0, [r6, #0x1c4]
    cmp r0, #0x0
    beq .L_02207610
    add r0, r0, #0x1
    str r0, [r6, #0x1c4]
    cmp r0, #0x3c
    bge .L_022074d8
    tst r0, #0x1
    beq .L_0220745c
    add r0, sp, #0x40
    bl func_ov042_021fcf80
    ldr r0, [r6, #0xa8]
    str r0, [sp, #0x44]
    ldr r0, [r6, #0xac]
    str r0, [sp, #0x48]
    bl genrand_int32
    mov r1, #0x8c
    bl func_020bf1f8
    ldr r2, [sp, #0x44]
    sub r0, r1, #0x46
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x44]
    bl genrand_int32
    mov r1, #0x8c
    bl func_020bf1f8
    sub r0, r1, #0x78
    ldr r2, [sp, #0x48]
    add r1, sp, #0x40
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x48]
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov042_021fe1c4
.L_0220745c:
    ldr r0, [r6, #0x1c4]
    cmp r0, #0x1e
    bge .L_02207bbc
    and r0, r0, #0x3
    cmp r0, #0x1
    bne .L_02207bbc
    add r0, sp, #0x34
    bl func_ov042_021fcf80
    ldr r0, [r6, #0xa8]
    str r0, [sp, #0x38]
    ldr r0, [r6, #0xac]
    str r0, [sp, #0x3c]
    bl genrand_int32
    mov r1, #0x8c
    bl func_020bf1f8
    ldr r2, [sp, #0x38]
    sub r0, r1, #0x46
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x38]
    bl genrand_int32
    mov r1, #0x8c
    bl func_020bf1f8
    sub r0, r1, #0x78
    ldr r2, [sp, #0x3c]
    add r1, sp, #0x34
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x3c]
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov042_021fe098
    b .L_02207bbc
.L_022074d8:
    bne .L_022074f0
    ldr r0, [r6, #0x48]
    ldr r1, .L_02207de4
    bl func_020a1ec0
    mov r0, #0x1
    str r0, [r6, #0xe8]
.L_022074f0:
    ldr r1, [r6, #0x1c4]
    mov r0, #0xc8
    sub r4, r1, #0x3c
    mul r0, r4, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_02207de0
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    ldr r1, [r6, #0x4c]
    mov r0, r0, asr #0x4
    rsb r5, r0, #0x100
    cmp r5, #0x10
    bge .L_0220758c
    ldrh r0, [r1, #0x42]
    mov r5, #0x10
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r6, #0x1bc]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x1c4]
    bne .L_022075ac
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x9
    beq .L_022075ac
    mov r1, #0x9
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x4c]
    mov r2, #0x0
    ldr r0, [r0, #0xc]
    ldr r1, .L_02207de8
    strh r2, [r0, #0x30]
    ldr r0, [r6, #0x48]
    bl func_020a1ec0
    b .L_022075ac
.L_0220758c:
    ldrh r0, [r1, #0x42]
    cmp r4, #0x51
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    bge .L_022075ac
    add r0, r6, #0xa4
    add r1, r6, #0xb0
    bl func_ov042_021ff2f8
.L_022075ac:
    ldr r0, [r6, #0x4c]
    ldr r1, [r0, #0xc]
    ldrb r0, [r1, #0x38]
    cmp r0, #0x9
    ldrne r0, .L_02207dec
    mulne r0, r4, r0
    strneh r0, [r1, #0x30]
    cmp r5, #0x100
    ble .L_022075f8
    mov r1, #0x0
    str r1, [r6, #0x1c4]
    str r1, [r6, #0x20c]
    ldr r0, [r6, #0x4c]
    mov r5, #0x100
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r6, #0xbc]
    str r0, [r6, #0xc0]
.L_022075f8:
    mov r0, r5, lsl #0x10
    ldr r1, [r6, #0x4c]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    b .L_02207bbc
.L_02207610:
    ldr r0, [r6, #0x1bc]
    cmp r0, #0x0
    bne .L_022078e0
    add r0, sp, #0x4
    add r1, r6, #0xa4
    bl func_ov042_02203658
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x48]
    add r1, sp, #0x4
    ldr r0, [r0, #0x8]
    mov r2, #0x3c000
    ldr r0, [r0, #0xe8]
    mov r3, #0x4
    bl func_ov071_02211a10
    ldr r1, [r6, #0x20c]
    cmp r1, #0x0
    movlt r0, #0x3e8
    cmp r0, #0x0
    ble .L_02207898
    ldr r1, [r6, #0xe0]
    sub r0, r1, r0
    str r0, [r6, #0xe0]
    cmp r0, #0x0
    bgt .L_0220774c
    mov r1, #0x0
    mov r2, #0x1
    str r1, [r6, #0xe0]
    str r2, [r6, #0x1c0]
    str r2, [r6, #0x1bc]
    ldr r0, .L_02207dd8
    mov r2, #0x3c
    ldr r0, [r0, #0x0]
    bl func_020595b0
    ldr r0, .L_02207dd8
    mov r1, #0xa4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, .L_02207dd8
    mov r1, #0xa5
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, .L_02207dd8
    mov r1, #0xcd
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, .L_02207dd8
    mov r1, #0xea
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, .L_02207dd8
    mov r1, #0xf0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, [r6, #0x48]
    mov r1, #0xb500
    bl func_020a1ec0
    mov r0, #0x0
    str r0, [r6, #0x1c4]
    str r0, [r6, #0x20c]
    ldr r0, [r6, #0xa0]
    bl func_ov042_02205180
    mov r0, #0x5
    sub r4, r0, #0x1
.L_02207724:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x8c]
    bl func_ov042_02209cbc
    subs r4, r4, #0x1
    bpl .L_02207724
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_022077b0
.L_0220774c:
    ldr r0, [r6, #0x20c]
    cmp r0, #0x0
    bge .L_02207778
    mov r0, #0x1
    str r0, [r6, #0x1c4]
    mov r0, #0x0
    str r0, [r6, #0x20c]
    ldr r0, [r6, #0x48]
    mov r1, #0xb500
    bl func_020a1ec0
    b .L_022077b0
.L_02207778:
    ldr r0, [r6, #0xd0]
    cmp r0, #0x0
    ldreq r0, [r6, #0x4c]
    ldreq r0, [r0, #0xc]
    ldreqb r1, [r0, #0x38]
    cmpeq r1, #0x0
    bne .L_022077b0
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022077b0:
    ldr r0, .L_02207df0
    add r3, sp, #0x28
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [r6, #0xe0]
    mov r1, #0x3e8
    bl func_020befec
    rsb r4, r0, #0x2
    cmp r4, #0x2
    movgt r4, #0x2
    add r1, sp, #0x28
    ldr r0, [r6, #0xc4]
    ldr r5, [r1, r4, lsl #0x2]
    cmp r0, r5
    beq .L_022077f8
    mov r0, r6
    mov r1, r5
    bl func_ov042_02206ff8
.L_022077f8:
    str r5, [r6, #0xc4]
    str r4, [r6, #0x150]
    ldr r0, [r6, #0x1c4]
    cmp r0, #0x0
    ldreq r0, [r6, #0x1bc]
    cmpeq r0, #0x0
    beq .L_02207890
    mov r0, #0x0
    str r0, [r6, #0x158]
    sub r0, r0, #0xa0000
    str r0, [r6, #0x15c]
    ldr r2, [r6, #0x158]
    ldr r0, [r6, #0xa8]
    mov r1, #0x50000
    sub r0, r2, r0
    bl func_020adc90
    str r0, [r6, #0xb4]
    ldr r2, [r6, #0x15c]
    ldr r0, [r6, #0xac]
    mov r1, #0x50000
    sub r0, r2, r0
    bl func_020adc90
    str r0, [r6, #0xb8]
    ldr r0, [r6, #0x1bc]
    cmp r0, #0x0
    ldr r0, [r6, #0x4c]
    beq .L_02207874
    ldr r0, [r0, #0xc]
    mov r1, #0x11
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02207880
.L_02207874:
    ldr r0, [r0, #0xc]
    mov r1, #0x8
    bl GraphicsSpriteState_SetAnimationIndex
.L_02207880:
    ldr r1, [r6, #0x50]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
.L_02207890:
    mov r0, #0x5a
    str r0, [r6, #0xe8]
.L_02207898:
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x1
    bne .L_02207bbc
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02207bbc
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02207bbc
.L_022078e0:
    add r0, r0, #0x1
    str r0, [r6, #0x1bc]
    cmp r0, #0x78
    bge .L_0220794c
    ldr r0, [r6, #0xa8]
    cmp r0, #0x2000
    subgt r0, r0, #0x1000
    strgt r0, [r6, #0xa8]
    mov r0, #0x2000
    ldr r1, [r6, #0xa8]
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1000
    strlt r0, [r6, #0xa8]
    mov r0, #0x4e000
    ldr r1, [r6, #0xac]
    rsb r0, r0, #0x0
    cmp r1, r0
    subgt r0, r1, #0x1000
    strgt r0, [r6, #0xac]
    mov r0, #0x52000
    ldr r1, [r6, #0xac]
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1000
    strlt r0, [r6, #0xac]
    b .L_02207bbc
.L_0220794c:
    moveq r1, #0x1
    streq r1, [r6, #0x24c]
    ldreq r0, [r6, #0x48]
    streq r1, [r0, #0x1ec]
    ldr r0, [r6, #0x1bc]
    cmp r0, #0xd2
    bne .L_022079b4
    ldr r0, .L_02207df4
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x11
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02207df4
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x11
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02207dd8
    mov r1, #0x16
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
.L_022079b4:
    ldr r0, [r6, #0x1bc]
    cmp r0, #0xd2
    ble .L_02207a74
    cmp r0, #0xea
    bge .L_02207a74
    ldr r0, .L_02207df4
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    cmp r0, #0x10
    bne .L_02207a74
    ldr r0, .L_02207df4
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    cmp r0, #0x10
    bne .L_02207a74
    ldr r0, .L_02207df4
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r3, r1
    mov r2, #0x0
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02207df4
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r3, r1
    mov r2, #0x0
    bl DisplayBrightness_StartTransition
    mov r0, #0x0
    str r0, [r6, #0x24c]
    str r0, [r6, #0x1c0]
    mov r0, #0xea
    str r0, [r6, #0x1bc]
    ldr r0, [r6, #0xac]
    sub r0, r0, #0x20000
    str r0, [r6, #0xac]
    ldr r0, [r6, #0x48]
    bl func_020a1e50
    mov r0, r6
    mvn r1, #0x0
    bl func_ov042_02206ff8
    ldr r1, [r6, #0x50]
    mov r0, #0x100
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
.L_02207a74:
    ldr r1, [r6, #0x1bc]
    cmp r1, #0xea
    ble .L_02207b1c
    ldr r0, .L_02207df8
    cmp r1, r0
    bge .L_02207b1c
    sub r0, r1, #0x6
    rsb r0, r0, #0x170
    cmp r0, #0x100
    movgt r0, #0x100
    cmp r0, #0x20
    bge .L_02207b08
    ldr r1, .L_02207df8
    mov r0, #0x100
    str r1, [r6, #0x1bc]
    ldr r2, [r6, #0x4c]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r2, [r6, #0x50]
    ldrh r1, [r2, #0x42]
    bic r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r1, [r6, #0x50]
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r2, [r6, #0x4c]
    ldr r1, [r6, #0x50]
    ldr r2, [r2, #0x30]
    str r2, [r1, #0x30]
    ldr r2, [r6, #0x4c]
    ldr r1, [r6, #0x50]
    ldr r2, [r2, #0x34]
    sub r2, r2, #0x5000
    str r2, [r1, #0x34]
.L_02207b08:
    mov r0, r0, lsl #0x10
    ldr r1, [r6, #0x4c]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
.L_02207b1c:
    ldr r1, [r6, #0x1bc]
    ldr r0, .L_02207df8
    cmp r1, r0
    ble .L_02207bbc
    add r0, r0, #0xaf
    cmp r1, r0
    bne .L_02207b44
    ldr r0, [r6, #0x48]
    ldr r1, .L_02207dfc
    bl func_020a1ec0
.L_02207b44:
    ldr r0, [r6, #0x50]
    ldr r0, [r0, #0xc]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02207bbc
    mov r0, r6
    bl func_ov042_022008f8
    ldr r0, .L_02207dd8
    mov r1, #0x19
    ldr r0, [r0, #0x0]
    bl func_0205958c
    mov r0, #0x3
    sub r3, r0, #0x1
.L_02207b80:
    add r2, r6, r3, lsl #0x2
    ldr r1, [r2, #0x4c]
    subs r3, r3, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    bpl .L_02207b80
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov042_021fea78
.L_02207bbc:
    ldr r2, [r6, #0x4c]
    ldr r0, [r6, #0x48]
    add r1, r6, #0xa4
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r0, [r6, #0x54]
    ldr r1, [r6, #0x4c]
    add r0, r0, #0x2c
    add r1, r1, #0x2c
    bl func_020050a4
    ldr r1, [r6, #0x54]
    ldr r0, [r1, #0x34]
    add r0, r0, #0x28000
    str r0, [r1, #0x34]
    ldr r0, [r6, #0x1bc]
    cmp r0, #0x0
    beq .L_02207c4c
    cmp r0, #0xea
    bge .L_02207c4c
    bl genrand_int32
    ldr r4, [r6, #0x4c]
    mov r1, #0xc
    bl func_020bf1f8
    ldr r2, [r4, #0x30]
    sub r0, r1, #0x6
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0x30]
    bl genrand_int32
    ldr r4, [r6, #0x4c]
    mov r1, #0xc
    bl func_020bf1f8
    ldr r2, [r4, #0x34]
    sub r0, r1, #0x6
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0x34]
.L_02207c4c:
    ldr r0, [r6, #0x20c]
    cmp r0, #0x0
    ble .L_02207c74
    ldr r2, [r6, #0x50]
    ldr r0, [r6, #0x48]
    add r1, r6, #0x214
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    b .L_02207d98
.L_02207c74:
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0xc]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x2
    bne .L_02207d98
    ldr r2, [r6, #0x50]
    ldr r0, [r6, #0xd0]
    ldrh r1, [r2, #0x42]
    add r0, r0, #0x96
    mov r0, r0, lsl #0x10
    bic r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r1, [r6, #0x50]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r0, [r6, #0x50]
    ldr r1, [r6, #0x4c]
    add r0, r0, #0x2c
    add r1, r1, #0x2c
    bl func_020050a4
    add r0, sp, #0x1c
    add r1, r6, #0xa4
    bl func_ov042_02203658
    ldr r4, [r6, #0xd0]
    mov r1, #0x3
    mov r0, r4
    bl func_020befec
    mov r1, r0
    cmp r4, #0x87
    movgt r1, #0x0
    tst r4, #0x2
    ldr r2, [r6, #0x50]
    beq .L_02207d4c
    ldr r0, [r2, #0x30]
    cmp r1, #0x0
    sub r0, r0, #0x37000
    str r0, [r2, #0x30]
    ldr r2, [r6, #0x50]
    ldr r0, [r2, #0x34]
    sub r0, r0, #0x35000
    str r0, [r2, #0x34]
    ldr r2, [sp, #0x20]
    ldr r0, [sp, #0x24]
    sub r2, r2, #0x50000
    sub r0, r0, #0x50000
    str r2, [sp, #0x20]
    str r0, [sp, #0x24]
    beq .L_02207d98
    ldr r0, [r6, #0x48]
    add r2, sp, #0x1c
    ldr r0, [r0, #0x14]
    bl func_ov042_021fdeac
    b .L_02207d98
.L_02207d4c:
    ldr r0, [r2, #0x30]
    cmp r1, #0x0
    add r0, r0, #0x37000
    str r0, [r2, #0x30]
    ldr r2, [r6, #0x50]
    ldr r0, [r2, #0x34]
    sub r0, r0, #0x36000
    str r0, [r2, #0x34]
    ldr r2, [sp, #0x20]
    ldr r0, [sp, #0x24]
    add r2, r2, #0x50000
    sub r0, r0, #0x50000
    str r2, [sp, #0x20]
    str r0, [sp, #0x24]
    beq .L_02207d98
    ldr r0, [r6, #0x48]
    add r2, sp, #0x1c
    ldr r0, [r0, #0x14]
    bl func_ov042_021fdeac
.L_02207d98:
    add r0, sp, #0x10
    bl func_ov042_021fcf80
    ldr r0, [r6, #0x4c]
    ldr r3, .L_02207e00
    ldr r0, [r0, #0x30]
    add r1, sp, #0x10
    str r0, [sp, #0x14]
    ldr r2, [r6, #0x4c]
    mov r0, r6
    ldr r2, [r2, #0x34]
    sub r2, r2, #0x50000
    str r2, [sp, #0x18]
    ldr r2, [r6, #0xe0]
    bl func_ov042_022009a0
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02207dd8: .word gSoundContext
.L_02207ddc: .word 0x16a
.L_02207de0: .word data_020c9670
.L_02207de4: .word 0xb501
.L_02207de8: .word 0xb486
.L_02207dec: .word 0x578
.L_02207df0: .word data_ov042_0220b190
.L_02207df4: .word data_020f4dc8
.L_02207df8: .word 0x2ea
.L_02207dfc: .word 0xb482
.L_02207e00: .word 0xbb8
.size func_ov042_02207114, . - func_ov042_02207114

