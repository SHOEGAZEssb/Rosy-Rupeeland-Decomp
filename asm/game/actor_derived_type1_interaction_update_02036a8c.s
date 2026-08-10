; Matching retail form; see src/game/actor_derived_type1_interaction_update.c.
.text
.extern GameWork_TestFlag
.extern Sound_Play
.extern data_020c3d80
.extern data_020c3d88
.extern data_020c9670
.extern data_020d37dc
.extern data_021052fc
.extern data_02105310
.extern data_0210568c
.extern data_02105690
.extern data_021e9ac0
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern func_02005084
.extern func_020050a4
.extern func_020066a4
.extern func_02007f0c
.extern func_0200b164
.extern func_0200b23c
.extern func_0200b294
.extern func_0201e0ec
.extern func_020328d0
.extern func_020343e4
.extern func_020349b8
.extern Actor_IsAtCachedTerrainHeight
.extern func_020372b4
.extern func_02039468
.extern func_02039db8
.extern func_0203a314
.extern func_0203a8b8
.extern func_02063820
.extern func_02072b68
.extern func_020a25c8
.extern func_020adcac
.extern gGameWork
.extern gSceneTouchInitialData
.extern gSoundContext
.extern gSystemState

    .global func_02036a8c
    .type func_02036a8c, @function
func_02036a8c: ; 0x02036a8c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x70
    mov r10, r0
    ldr r1, [r10, #0x230]
    tst r1, #0x4
    moveq r0, #0x0
    beq .L_0203725c
    ldr r1, [r10, #0xd0]
    tst r1, #0x100
    movne r0, #0x0
    bne .L_0203725c
    ldr r4, [r10, #0x278]
    cmp r4, #0x0
    beq .L_02036b4c
    ldr r0, .L_02037264
    ldr r1, [r10, #0x27c]
    ldrh r0, [r0, #0x1a]
    ands r0, r0, #0xf0
    ldrnesh r2, [r1, #0x2a]
    ldreqsh r2, [r1, #0x26]
    cmp r0, #0x0
    ldrnesh r3, [r1, #0x2c]
    mov r0, r4
    ldr r4, [r0, #0x0]
    ldreqsh r3, [r1, #0x28]
    ldrb r1, [r10, #0xd4]
    ldr r4, [r4, #0xd0]
    blx r4
    mov r3, #0x0
    str r3, [r10, #0x278]
    ldr r1, [r10, #0x8c]
    ldr r0, [r10, #0x3c]
    add r0, r1, r0
    str r0, [r10, #0x8c]
    ldr r2, [r10, #0x90]
    ldr r1, [r10, #0x40]
    add r0, r10, #0x200
    add r1, r2, r1
    str r1, [r10, #0x90]
    str r3, [r10, #0x40]
    str r3, [r10, #0x3c]
    mov r1, #0x1e
    strh r1, [r0, #0x80]
    ldr r1, [r10, #0x230]
    mov r0, #0x1
    orr r1, r1, #0x8000
    str r1, [r10, #0x230]
    b .L_0203725c
.L_02036b4c:
    ldr r1, [r10, #0x274]
    cmp r1, #0x0
    beq .L_02037258
    add r1, r10, #0x200
    ldrsh r1, [r1, #0x80]
    cmp r1, #0x0
    bne .L_02037258
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_02037258
    ldr r0, [r10, #0x230]
    tst r0, #0x1000
    beq .L_02036e64
    mov r0, r10
    bl func_0203a314
    cmp r0, #0x0
    beq .L_02036c24
    mvn r1, #0x0
    cmp r0, r1
    bne .L_02036bb8
    ldr r0, [r10, #0x27c]
    ldrh r1, [r0, #0x2e]
    cmp r1, #0x0
    beq .L_02036bb8
    mov r0, r10
    mov r2, #0x0
    bl func_020349b8
.L_02036bb8:
    ldrb r0, [r10, #0xd4]
    ldr r1, [r10, #0x27c]
    ldr r4, .L_02037268
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r3, r0, lsl #0x1
    add r0, r0, #0x1
    mov r2, r0, lsl #0x1
    ldrsh r3, [r4, r3]
    mvn r0, #0xb
    ldrsh r2, [r4, r2]
    smulbb r3, r3, r0
    mov r0, #0xc
    smulbb r2, r2, r0
    ldrsh r1, [r1, #0x0]
    ldr r5, [r10, #0x1c]
    mov r4, r3, asr #0xc
    ldr r3, [r10, #0x20]
    add r0, r10, #0x200
    mov r2, r2, asr #0xc
    strh r1, [r0, #0x94]
    add r1, r4, r5, asr #0xc
    strh r1, [r0, #0x96]
    add r1, r2, r3, asr #0xc
    strh r1, [r0, #0x98]
.L_02036c24:
    add r0, r10, #0x200
    mov r2, #0x1e
    strh r2, [r0, #0x80]
    mov r1, #0x0
    str r1, [r10, #0x90]
    str r1, [r10, #0x8c]
    str r1, [r10, #0x40]
    add r0, sp, #0x60
    str r1, [r10, #0x3c]
    bl func_02004fe0
    add r0, sp, #0x50
    add r1, r10, #0x18
    bl func_02005030
    ldrb r0, [r10, #0xd4]
    ldr r1, .L_02037268
    ldr r3, [sp, #0x54]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r0, #0x1
    ldrsh r2, [r1, r2]
    mov r0, r0, lsl #0x1
    ldrsh r1, [r1, r0]
    mov r0, r2, lsl #0x4
    rsb r0, r0, #0x0
    add r3, r3, r0
    ldr r2, [sp, #0x58]
    str r3, [sp, #0x54]
    add r0, r2, r1, lsl #0x4
    str r0, [sp, #0x58]
    mov r9, #0x0
    ldr r8, .L_0203726c
    add r7, sp, #0x50
    add r6, sp, #0x40
    mov r5, #0x1800
    mov r11, #0x1
    ldr r4, .L_02037270
    b .L_02036d44
.L_02036cc4:
    ldr r0, [r8, r9, lsl #0x2]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d0]
    blx r1
    cmp r0, #0x0
    beq .L_02036d40
    ldr r0, [r8, r9, lsl #0x2]
    add r1, r7, #0x4
    adds r0, r0, #0x18
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x20000
    bge .L_02036d40
    ldr r1, [r8, r9, lsl #0x2]
    mov r0, r6
    add r1, r1, #0x18
    add r2, r10, #0x18
    bl func_020066a4
    mov r0, r6
    bl func_02005084
    mov r0, r6
    mov r1, r5
    bl func_020328d0
    ldr r0, [r8, r9, lsl #0x2]
    mov r1, r6
    mov r2, r11
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xb8]
    blx r3
    mov r0, r6
    bl func_02005058
.L_02036d40:
    add r9, r9, #0x1
.L_02036d44:
    ldrsh r0, [r4, #0x2]
    cmp r9, r0
    blt .L_02036cc4
    mov r9, #0x0
    mov r6, #0x1
    mov r11, r9
    add r5, sp, #0x50
    mov r7, r6
    ldr r4, .L_02037274
    b .L_02036e30
.L_02036d6c:
    ldr r0, [r4, #0x0]
    mov r1, r7
    bl func_02007f0c
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    beq .L_02036e2c
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x4
    moveq r0, r6
    movne r0, r11
    cmp r0, #0x0
    beq .L_02036e2c
    ldrh r0, [r8, #0x4e]
    cmp r0, #0x15
    blt .L_02036e2c
    cmp r0, #0x1b
    bgt .L_02036e2c
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd0]
    blx r1
    cmp r0, #0x0
    bne .L_02036e2c
    adds r0, r8, #0x18
    addne r0, r0, #0x4
    add r1, r5, #0x4
    bl func_020adcac
    cmp r0, #0x20000
    bge .L_02036e2c
    mov r0, r8
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
    add r0, sp, #0x30
    add r1, r8, #0x18
    add r2, r10, #0x18
    bl func_020066a4
    add r0, sp, #0x30
    bl func_02005084
    add r0, sp, #0x30
    mov r1, #0x3000
    bl func_020328d0
    add r0, r8, #0x38
    add r1, sp, #0x30
    bl func_020050a4
    add r0, sp, #0x30
    bl func_02005058
.L_02036e2c:
    add r9, r9, #0x1
.L_02036e30:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_02036d6c
    add r0, sp, #0x50
    bl func_02005058
    add r0, sp, #0x60
    bl func_02005058
    mov r0, #0x1
    b .L_0203725c
.L_02036e64:
    tst r0, #0x2000
    beq .L_02037168
    add r0, r10, #0x200
    mov r1, #0x28
    strh r1, [r0, #0x80]
    ldr r3, .L_02037278
    add r2, sp, #0x1c
    mov r1, #0x8
.L_02036e84:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_02036e84
    ldr r3, .L_0203727c
    add r2, sp, #0x14
    mov r1, #0x8
.L_02036ea0:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_02036ea0
    ldr r0, .L_02037274
    ldrb r5, [r10, #0xd4]
    ldr r0, [r0, #0x0]
    add r2, sp, #0x1c
    ldrsb r4, [r2, r5]
    add r0, r0, #0x2000
    ldr r2, [r10, #0x1c]
    ldr r0, [r0, #0xed4]
    add r1, sp, #0x14
    add r7, r4, r2, asr #0x10
    ldrsb r2, [r1, r5]
    ldr r3, [r0, #0x0]
    ldr r1, [r10, #0x20]
    ldr r3, [r3, #0x2c]
    add r8, r2, r1, asr #0x10
    mov r1, r7
    mov r2, r8
    blx r3
    mov r3, r0, lsl #0x12
    mov r1, r7
    mov r2, r8
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    mov r0, r10
    mov r4, r3, lsr #0x1c
    ldr r5, [r10, #0x24]
    bl func_020343e4
    ldr r1, [r10, #0xd0]
    mov r0, r0, lsl #0x4
    tst r1, #0x100
    rsb r5, r0, r5, asr #0xc
    bne .L_02036f78
    mov r0, r10
    bl func_020372b4
    cmp r0, #0x0
    ldreq r0, [r10, #0x270]
    cmpeq r0, #0x0
    bne .L_02036f78
    mov r0, r10
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_02036f78
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bne .L_02036f78
    ldr r0, [r10, #0xd0]
    tst r0, #0x4000
    moveq r0, #0x1
    beq .L_02036f7c
.L_02036f78:
    mov r0, #0x0
.L_02036f7c:
    cmp r0, #0x0
    beq .L_02037110
    ldr r0, .L_02037280
    bl func_0200b294
    cmp r0, #0x0
    bne .L_02037110
    ldr r0, .L_02037284
    mov r1, #0x11
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02037110
    ldr r0, .L_02037284
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    cmpeq r4, #0x1
    bne .L_02037110
    cmp r5, #0x0
    blt .L_02037110
    cmp r5, #0x10
    bgt .L_02037110
    ldr r0, .L_02037280
    ldr r1, .L_02037288
    bl func_0200b23c
    cmp r0, #0x0
    bne .L_02037110
    ldr r0, .L_02037280
    ldr r1, .L_02037288
    bl func_0200b164
    ldrb r1, [r10, #0xd4]
    ldr r0, [r10, #0x54]
    add r1, r1, #0x10
    and r1, r1, #0xff
    bl func_02072b68
    ldr r2, [r10, #0x54]
    mov r0, r10
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r2, [r10, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    bl func_02039db8
    ldr r0, .L_0203728c
    mov r1, #0x41
    ldr r0, [r0, #0x0]
    bl func_02063820
    ldr r0, [r10, #0x27c]
    ldrh r2, [r0, #0x1a]
    cmp r2, #0x0
    beq .L_02037068
    ldr r0, .L_02037290
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
.L_02037068:
    ldr r11, .L_02037274
    mov r9, #0x0
    mov r6, #0x20
    mov r5, #0x18
    mov r4, #0x46
.L_0203707c:
    ldr r0, [r11, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r2, [r10, #0x24]
    ldr ip, [r10, #0x20]
    mov r3, r2, asr #0xc
    ldr r2, [r10, #0x1c]
    rsb r3, r3, ip, asr #0xc
    mov r2, r2, asr #0xc
    sub r2, r2, #0x10
    sub r3, r3, #0x14
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r1, #0x0
    mov r2, r2, asr #0x10
    mov r3, r3, asr #0x10
    bl func_020a25c8
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_0203707c
    ldr r3, .L_02037294
    mov r2, r7, lsl #0x4
    mov r1, r8, lsl #0x4
    add r0, sp, #0x24
    str r3, [sp, #0x24]
    str r2, [sp, #0x28]
    str r1, [sp, #0x2c]
    bl func_0203a8b8
    ldr r1, [r10, #0x230]
    mov r0, #0x1
    orr r1, r1, #0x8000
    str r1, [r10, #0x230]
    b .L_0203725c
.L_02037110:
    ldr r0, [r10, #0x27c]
    ldrh r1, [r0, #0x2e]
    cmp r1, #0x0
    beq .L_0203712c
    mov r0, r10
    mov r2, #0x0
    bl func_020349b8
.L_0203712c:
    ldr r0, [r10, #0x27c]
    mov r2, r7, lsl #0x4
    ldrsh r3, [r0, #0x0]
    add r0, r10, #0x200
    mov r1, #0x0
    strh r3, [r0, #0x94]
    strh r2, [r0, #0x96]
    mov r2, r8, lsl #0x4
    strh r2, [r0, #0x98]
    str r1, [r10, #0x90]
    str r1, [r10, #0x8c]
    str r1, [r10, #0x40]
    str r1, [r10, #0x3c]
    mov r0, #0x1
    b .L_0203725c
.L_02037168:
    tst r0, #0x4000
    beq .L_020371a4
    mov r0, r10
    bl func_02039468
    ldr r0, [r10, #0x27c]
    ldr r3, [r10, #0x1c]
    ldrsh r2, [r0, #0x0]
    add r1, r10, #0x200
    mov r0, r3, lsl #0x4
    strh r2, [r1, #0x94]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x96]
    strh r0, [r1, #0x98]
    mov r0, #0x1
    b .L_0203725c
.L_020371a4:
    ldr r1, [r10, #0x27c]
    ldrsh r0, [r1, #0x0]
    ldrb r2, [r1, #0x8]
    cmp r0, #0x7b
    cmpne r0, #0x7c
    cmpne r0, #0x80
    bne .L_02037204
    mov r0, #0xa
    strb r0, [r10, #0x26b]
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x82]
    cmp r1, #0x0
    ble .L_020371f0
    sub r1, r1, #0x4
    strh r1, [r0, #0x82]
    ldrsh r1, [r0, #0x82]
    cmp r1, #0x1
    movlt r1, #0x1
    strlth r1, [r0, #0x82]
.L_020371f0:
    ldr r0, [r10, #0x54]
    mov r1, #0x300
    strh r1, [r0, #0x36]
    mov r0, #0x1
    b .L_0203725c
.L_02037204:
    sub r0, r2, #0x73
    cmp r0, #0x1
    bhi .L_02037258
    mov r0, #0xa
    strb r0, [r10, #0x26b]
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x82]
    cmp r1, #0x0
    ble .L_02037240
    sub r1, r1, #0x4
    strh r1, [r0, #0x82]
    ldrsh r1, [r0, #0x82]
    cmp r1, #0x1
    movlt r1, #0x1
    strlth r1, [r0, #0x82]
.L_02037240:
    cmp r2, #0x73
    ldreq r0, [r10, #0x54]
    moveq r1, #0x200
    streqh r1, [r0, #0x36]
    mov r0, #0x1
    b .L_0203725c
.L_02037258:
    mov r0, #0x0
.L_0203725c:
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02037264: .word gSystemState
.L_02037268: .word data_020c9670
.L_0203726c: .word data_02105690
.L_02037270: .word data_0210568c
.L_02037274: .word data_021052fc
.L_02037278: .word data_020c3d80
.L_0203727c: .word data_020c3d88
.L_02037280: .word data_02105310
.L_02037284: .word gGameWork
.L_02037288: .word data_020d37dc
.L_0203728c: .word data_021e9ac0
.L_02037290: .word gSoundContext
.L_02037294: .word gSceneTouchInitialData
    .size func_02036a8c, . - func_02036a8c
