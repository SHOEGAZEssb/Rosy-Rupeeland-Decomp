.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern GameWork_TestFlag
.extern Sound_Play
.extern data_020c9670
.extern data_ov071_02212224
.extern data_ov071_022122b4
.extern data_ov071_022122f4
.extern data_ov071_02212340
.extern data_ov071_022123e0
.extern VecFx32Object_Assign
.extern func_020595b0
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a1794
.extern func_020adc40
.extern func_020adc90
.extern func_020befec
.extern func_ov036_02200b38
.extern func_ov071_02210560
.extern func_ov071_02211158
.extern func_ov071_02211178
.extern func_ov071_02211190
.extern func_ov071_022113fc
.extern func_ov071_022115bc
.extern func_ov071_02211ca4
.extern gGameWork
.extern gSoundContext
.extern gSystemState

.global func_ov071_0221083c
func_ov071_0221083c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xa4
    mov r6, r0
    ldr r1, [r6, #0x48]
    ldr r0, [r1, #0x1c0]
    cmp r0, #0x0
    beq .L_0221086c
    add r0, sp, #0x18
    bl func_ov071_02211158
    add r1, sp, #0x18
    add r0, r6, #0xdc
    bl func_ov071_02211178
.L_0221086c:
    ldr r0, [r6, #0xc8]
    cmp r0, #0x0
    ble .L_022108f8
    add r1, r0, #0x1
    mov r0, #0xc
    mul r0, r1, r0
    add r2, r0, #0x100
    cmp r2, #0x1d0
    movgt r2, #0x1d0
    str r1, [r6, #0xc8]
    cmp r1, #0x11
    ble .L_022108cc
    ldr r0, .L_02211110
    sub r1, r1, #0x11
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_02211114
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    mov r0, #0x30
    smulbb r0, r1, r0
    add r2, r2, r0, asr #0xc
.L_022108cc:
    mov r0, r2, lsl #0x10
    ldr r1, [r6, #0xec]
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    ldr r0, [r6, #0xc8]
    cmp r0, #0x14
    ldreq r0, [r6, #0x48]
    moveq r1, #0xb
    streq r1, [r0, #0x1c8]
    b .L_022110e0
.L_022108f8:
    ldrh r0, [r6, #0xf8]
    cmp r0, #0x0
    beq .L_02210910
    mov r0, r6
    bl func_ov071_02210560
    b .L_022110e0
.L_02210910:
    ldr ip, .L_02211118
    add r7, sp, #0x64
    mov r4, #0x0
    mov r5, #0x4
.L_02210920:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_02210920
    ldr ip, .L_0221111c
    add r7, sp, #0x24
    mov r5, #0x4
.L_0221093c:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_0221093c
    ldr r0, .L_02211120
    ldr r1, [r6, #0x48]
    ldrh r2, [r0, #0x1a]
    ldr r0, [r1, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x52c]
    ldr r1, [r6, #0x48]
    ldr r0, [r1, #0x1ec]
    cmp r0, #0x0
    ldreq r0, [r6, #0xcc]
    cmpeq r0, #0x0
    movne r2, #0x0
    tst r2, #0x40
    orrne r4, r4, #0x2
    tst r2, #0x80
    orrne r4, r4, #0x1
    tst r2, #0x20
    ldrne r0, [r1, #0x10]
    movne r1, #0x640
    strne r1, [r0, #0x52c]
    orrne r4, r4, #0x8
    tst r2, #0x10
    beq .L_022109c0
    ldr r0, [r6, #0x48]
    mov r1, #0x640
    ldr r0, [r0, #0x10]
    rsb r1, r1, #0x0
    str r1, [r0, #0x52c]
    orr r4, r4, #0x4
.L_022109c0:
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x1ec]
    cmp r0, #0x0
    beq .L_02210b0c
    ldr r1, [r6, #0x98]
    cmp r1, #0x4000
    ldrgt r1, [r6, #0xa4]
    ldrgt r0, .L_02211124
    addgt r0, r1, r0
    strgt r0, [r6, #0xa4]
    bgt .L_02210a40
    mov r0, #0x4000
    rsb r0, r0, #0x0
    cmp r1, r0
    ldrlt r0, [r6, #0xa4]
    addlt r0, r0, #0x8f
    addlt r0, r0, #0x200
    strlt r0, [r6, #0xa4]
    blt .L_02210a40
    ldr r5, [r6, #0xa4]
    ldr r0, .L_02211128
    mov r1, #0x0
    umull r3, r2, r5, r0
    mla r2, r5, r1, r2
    mov r1, r5, asr #0x1f
    adds r3, r3, #0x800
    mla r2, r1, r0, r2
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r5, r1
    str r0, [r6, #0xa4]
.L_02210a40:
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x1ec]
    cmp r0, #0x1
    ldr r0, [r6, #0x9c]
    bne .L_02210a6c
    cmp r0, #0xe6000
    ldrlt r0, [r6, #0xa8]
    addlt r0, r0, #0x8f
    addlt r0, r0, #0x200
    strlt r0, [r6, #0xa8]
    b .L_02210ad0
.L_02210a6c:
    cmp r0, #0xb4000
    ldrgt r0, [r6, #0xa8]
    subgt r0, r0, #0x8f
    subgt r0, r0, #0x200
    strgt r0, [r6, #0xa8]
    bgt .L_02210ad0
    cmp r0, #0xaa000
    ldrlt r0, [r6, #0xa8]
    addlt r0, r0, #0x8f
    addlt r0, r0, #0x200
    strlt r0, [r6, #0xa8]
    blt .L_02210ad0
    ldr r5, [r6, #0xa8]
    ldr r0, .L_02211128
    mov r1, #0x0
    umull r3, r2, r5, r0
    mla r2, r5, r1, r2
    mov r1, r5, asr #0x1f
    adds r3, r3, #0x800
    mla r2, r1, r0, r2
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r5, r1
    str r0, [r6, #0xa8]
.L_02210ad0:
    ldrh r0, [r6, #0xb8]
    cmp r0, #0x8000
    subhi r0, r0, #0x400
    addls r0, r0, #0x400
    strh r0, [r6, #0xb8]
    ldr r0, [r6, #0xec]
    ldrh r1, [r6, #0xb8]
    ldr r0, [r0, #0xc]
    add r1, r1, #0x1000
    mov r1, r1, asr #0xd
    ldrb r2, [r0, #0x38]
    and r1, r1, #0x7
    cmp r1, r2
    beq .L_02210b0c
    bl GraphicsSpriteState_SetAnimationIndex
.L_02210b0c:
    ldr r1, [r6, #0x48]
    ldr r0, .L_0221112c
    ldr r1, [r1, #0xc]
    ldmia r0, {r7, lr}
    ldr ip, [r0, #0x8]
    ldr r5, [r0, #0xc]
    ldr r3, [r0, #0x10]
    ldr r2, [r0, #0x14]
    ldr r0, [r1, #0x1b4]
    str lr, [sp, #0x14]
    cmp r0, #0x2
    str r5, [sp, #0xc]
    moveq r5, #0x1
    str r7, [sp, #0x10]
    movne r5, #0x0
    add r1, sp, #0x10
    ldr r1, [r1, r5, lsl #0x2]
    ldr lr, [r6, #0xa4]
    str ip, [sp, #0x8]
    str r3, [sp, #0x0]
    smull ip, r3, lr, r1
    adds ip, ip, #0x800
    adc r3, r3, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r3, lsl #0x14
    sub r3, lr, ip
    str r3, [r6, #0xa4]
    ldr ip, [r6, #0xa8]
    str r2, [sp, #0x4]
    smull r3, r1, ip, r1
    adds r3, r3, #0x800
    add r0, sp, #0x8
    adc r1, r1, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    sub r1, ip, r3
    str r1, [r6, #0xa8]
    add r2, sp, #0x64
    ldr r0, [r0, r5, lsl #0x2]
    ldr r1, [r2, r4, lsl #0x2]
    ldr ip, [r6, #0xa4]
    smull r3, r2, r1, r0
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, ip, r2
    str r1, [r6, #0xa4]
    add r1, sp, #0x24
    ldr r1, [r1, r4, lsl #0x2]
    ldr r3, [r6, #0xa8]
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r4, r3, r1
    str r4, [r6, #0xa8]
    ldr r1, [r6, #0xa4]
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, r4, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    add r1, sp, #0x0
    mov r4, r0
    ldr r0, [r1, r5, lsl #0x2]
    cmp r4, r0
    ble .L_02210c8c
    ldr r0, [r6, #0xa4]
    mov r1, r4
    bl func_020adc90
    add r2, sp, #0x0
    mov r1, r4
    ldr r4, [r2, r5, lsl #0x2]
    smull r3, r2, r0, r4
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [r6, #0xa4]
    ldr r0, [r6, #0xa8]
    bl func_020adc90
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0xa8]
.L_02210c8c:
    ldr r2, [r6, #0xd4]
    cmp r2, #0x0
    beq .L_02210d1c
    ldr r1, .L_02211130
    mov r0, r6
    mul r1, r2, r1
    mov r2, #0x0
    bl func_ov071_022113fc
    cmp r0, #0x0
    beq .L_02210d14
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x1b4]
    cmp r0, #0x0
    bne .L_02210ce0
    ldr r0, .L_02211134
    ldr r1, .L_02211138
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    b .L_02210d14
.L_02210ce0:
    cmp r0, #0x1
    bne .L_02210d00
    ldr r0, .L_02211134
    ldr r1, .L_0221113c
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b .L_02210d14
.L_02210d00:
    ldr r0, .L_02211134
    ldr r1, .L_02211140
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_Play
.L_02210d14:
    mov r0, #0x0
    str r0, [r6, #0xcc]
.L_02210d1c:
    ldr r0, [r6, #0xd0]
    cmp r0, #0x0
    beq .L_02210de8
    subs r0, r0, #0x1
    str r0, [r6, #0xd0]
    bne .L_02210d44
    ldr r0, [r6, #0x90]
    mov r1, #0xb
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
.L_02210d44:
    mov r0, #0x0
    str r0, [r6, #0xb4]
    str r0, [r6, #0xb0]
    ldr r0, [r6, #0xcc]
    cmp r0, #0x0
    bne .L_02210d90
    ldrh r1, [r6, #0xb8]
    ldr r0, [r6, #0xec]
    add r1, r1, #0x1000
    ldr r0, [r0, #0xc]
    mov r1, r1, asr #0xd
    and r1, r1, #0x7
    add r1, r1, #0x10
    ldrb r2, [r0, #0x38]
    and r1, r1, #0xff
    cmp r1, r2
    beq .L_02210de8
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02210de8
.L_02210d90:
    ldr r0, [r6, #0xec]
    mov r1, #0x4
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r6, #0xec]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r6, #0xf0]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r6, #0xf0]
    mov r1, #0x0
    ldrh r2, [r3, #0x42]
    mov r0, #0x1
    bic r2, r2, #0x4
    strh r2, [r3, #0x42]
    str r1, [r6, #0xa8]
    str r1, [r6, #0xa4]
    str r1, [r6, #0xd0]
    strh r0, [r6, #0xf8]
.L_02210de8:
    ldr r1, [r6, #0x48]
    ldr r0, [r1, #0xc]
    ldr r0, [r0, #0x1bc]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_02210f0c
    ldr r0, [r1, #0x1c0]
    cmp r0, #0x0
    beq .L_02210f0c
    ldr r0, [r1, #0x1ec]
    cmp r0, #0x0
    ldreq r0, [r6, #0xcc]
    cmpeq r0, #0x0
    bne .L_02210f0c
    ldr r0, [r6, #0xc4]
    ldr r1, .L_02211144
    add r0, r0, #0x1
    str r0, [r6, #0xc4]
    ldr r1, [r1, #0x24]
    bl func_020befec
    cmp r1, #0x0
    bne .L_02210eb8
    ldr r0, [r6, #0xe8]
    bl func_ov071_022115bc
    ldr r0, .L_02211148
    ldr r1, .L_0221114c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r6, #0xd8]
    subne r0, r0, #0x1
    strne r0, [r6, #0xd8]
    ldr r0, .L_02211150
    ldr r2, [r6, #0xd8]
    ldr r1, [r0, #0xc]
    sub r2, r2, #0x1
    eors r1, r1, #0x1
    str r1, [r0, #0xc]
    str r2, [r6, #0xd8]
    ldr r1, .L_02211154
    beq .L_02210ea8
    ldr r0, .L_02211134
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_02210eb8
.L_02210ea8:
    ldr r0, .L_02211134
    mov r2, #0xa
    ldr r0, [r0, #0x0]
    bl Sound_Play
.L_02210eb8:
    ldr r0, [r6, #0xc0]
    tst r0, #0x2
    moveq r0, #0x0
    streq r0, [r6, #0xb4]
    streq r0, [r6, #0xb0]
    ldr r0, [r6, #0xd0]
    cmp r0, #0x0
    bne .L_02210f4c
    ldrh r1, [r6, #0xb8]
    ldr r0, [r6, #0xec]
    add r1, r1, #0x1000
    ldr r0, [r0, #0xc]
    mov r1, r1, asr #0xd
    and r1, r1, #0x7
    add r1, r1, #0x8
    ldrb r2, [r0, #0x38]
    and r1, r1, #0xff
    cmp r1, r2
    beq .L_02210f4c
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02210f4c
.L_02210f0c:
    mov r0, #0x0
    str r0, [r6, #0xb4]
    str r0, [r6, #0xb0]
    ldr r0, [r6, #0xd0]
    cmp r0, #0x0
    bne .L_02210f4c
    ldr r0, [r6, #0xec]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x8
    blt .L_02210f4c
    ldrh r1, [r6, #0xb8]
    add r1, r1, #0x1000
    mov r1, r1, asr #0xd
    and r1, r1, #0x7
    bl GraphicsSpriteState_SetAnimationIndex
.L_02210f4c:
    add r0, r6, #0x94
    add r1, r6, #0xa0
    bl func_ov071_02211190
    mov r0, #0x78000
    ldr r1, [r6, #0x98]
    rsb r0, r0, #0x0
    cmp r1, r0
    strlt r0, [r6, #0x98]
    movlt r0, #0x0
    strlt r0, [r6, #0xa4]
    ldr r0, [r6, #0x98]
    cmp r0, #0x78000
    movgt r0, #0x78000
    strgt r0, [r6, #0x98]
    movgt r0, #0x0
    strgt r0, [r6, #0xa4]
    ldr r0, [r6, #0x9c]
    cmp r0, #0x9a000
    movlt r0, #0x9a000
    strlt r0, [r6, #0x9c]
    movlt r0, #0x0
    strlt r0, [r6, #0xa8]
    ldr r0, [r6, #0x9c]
    cmp r0, #0xf2000
    movgt r0, #0xf2000
    strgt r0, [r6, #0x9c]
    movgt r0, #0x0
    strgt r0, [r6, #0xa8]
    ldr r1, [r6, #0xa4]
    cmp r1, #0x7b
    bge .L_02210fd8
    mvn r0, #0x7a
    cmp r1, r0
    movgt r0, #0x0
    strgt r0, [r6, #0xa4]
.L_02210fd8:
    ldr r1, [r6, #0xa8]
    cmp r1, #0x7b
    bge .L_02210ff4
    mvn r0, #0x7a
    cmp r1, r0
    movgt r0, #0x0
    strgt r0, [r6, #0xa8]
.L_02210ff4:
    ldr r2, [r6, #0xec]
    ldr r0, [r6, #0x48]
    add r1, r6, #0x94
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r0, [r6, #0xf0]
    ldr r1, [r6, #0xec]
    add r0, r0, #0x2c
    add r1, r1, #0x2c
    bl VecFx32Object_Assign
    ldr r0, .L_02211148
    ldr r1, .L_0221114c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02211048
    ldr r0, [r6, #0xd8]
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r6, #0xd8]
.L_02211048:
    ldr r0, [r6, #0xd8]
    cmp r0, #0x0
    bgt .L_022110b8
    mov r1, #0x0
    str r1, [r6, #0xd8]
    mov r0, #0x1
    str r0, [r6, #0xc8]
    str r1, [r6, #0xb4]
    str r1, [r6, #0xb0]
    str r1, [r6, #0xa8]
    str r1, [r6, #0xa4]
    ldr r0, [r6, #0xec]
    mov r1, #0x18
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0xc]
    bl func_ov036_02200b38
    ldr r0, .L_02211134
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x2d
    bl Sound_Play
    ldr r0, .L_02211134
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3c
    bl func_020595b0
.L_022110b8:
    ldr r2, [r6, #0xec]
    ldr r0, [r6, #0xb0]
    ldr r1, [r2, #0x30]
    add r0, r1, r0
    str r0, [r2, #0x30]
    ldr r2, [r6, #0xec]
    ldr r0, [r6, #0xb4]
    ldr r1, [r2, #0x34]
    add r0, r1, r0
    str r0, [r2, #0x34]
.L_022110e0:
    ldr r0, [r6, #0xe8]
    bl func_ov071_02211ca4
    ldr r1, .L_02211150
    ldr r0, .L_02211144
    ldr r2, [r1, #0x8]
    ldr r0, [r0, #0x1c]
    add r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0x8]
    add sp, sp, #0xa4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02211110: .word 0x6d6
.L_02211114: .word data_020c9670
.L_02211118: .word data_ov071_022122b4
.L_0221111c: .word data_ov071_022122f4
.L_02211120: .word gSystemState
.L_02211124: .word 0xfffffd71
.L_02211128: .word 0x19a
.L_0221112c: .word data_ov071_02212224
.L_02211130: .word 0x9c4
.L_02211134: .word gSoundContext
.L_02211138: .word 0x169
.L_0221113c: .word 0x16b
.L_02211140: .word 0x16a
.L_02211144: .word data_ov071_02212340
.L_02211148: .word gGameWork
.L_0221114c: .word 0x306
.L_02211150: .word data_ov071_022123e0
.L_02211154: .word 0x1d7
.size func_ov071_0221083c, . - func_ov071_0221083c
