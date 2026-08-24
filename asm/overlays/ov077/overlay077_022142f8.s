.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern gFx32CosSinTable
.extern data_ov077_02216f2c
.extern data_ov077_02216f34
.extern data_ov077_02216f7c
.extern data_ov077_02216f94
.extern data_ov077_02216fc8
.extern data_ov077_02217018
.extern data_ov077_02217020
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Actor_SynchronizeStatePresentation
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020befec
.extern func_ov077_022130b8
.extern func_ov077_022142c8
.extern func_ov077_022142e0
.extern func_ov077_02214c7c
.extern func_ov077_02214cd4
.extern func_ov090_0221be40
.extern func_ov090_0221c184
.extern func_ov090_0221c434
.extern func_ov090_0221c44c

.global func_ov077_022142f8
func_ov077_022142f8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xf0
    mov r7, r0
    ldr r0, [r7, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214c40
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r0, r7
    ldr r2, [r0, #0x0]
    add r1, sp, #0xc0
    ldr r2, [r2, #0xc8]
    blx r2
    mov r0, #0x0
    strb r0, [r7, #0x24c]
    ldr r0, [r7, #0x260]
    bic r0, r0, #0x1
    str r0, [r7, #0x260]
    ldr r0, [r7, #0x21c]
    tst r0, #0x1
    add r0, r7, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r7, #0x218]
    ldrne r2, [r2, r1]
    add r1, sp, #0xc0
    ldreq r2, [r7, #0x218]
    blx r2
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r1, #0x0
    strb r1, [r7, #0xd5]
    mov r0, r7
    strb r1, [r7, #0xd4]
    bl Actor_SynchronizeStatePresentation
    ldr r0, .L_02214c48
    mov r6, #0x1
    ldr r2, [r7, #0x218]
    ldr r0, [r0, #0x58]
    mov r4, r6
    cmp r2, r0
    mov r3, #0x0
    ldr r0, .L_02214c4c
    bne .L_022143d4
    ldr r1, [r7, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r4, #0x0
.L_022143d4:
    cmp r4, #0x0
    bne .L_022143ec
    ldrb r0, [r7, #0x2e4]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1d
    movne r3, #0x1
.L_022143ec:
    cmp r3, #0x0
    bne .L_0221444c
    ldr r0, .L_02214c48
    ldr r2, [r7, #0x218]
    ldr r0, [r0, #0x50]
    mov r3, #0x0
    cmp r2, r0
    mov r4, #0x1
    ldr r0, .L_02214c50
    bne .L_02214428
    ldr r1, [r7, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r4, #0x0
.L_02214428:
    cmp r4, #0x0
    bne .L_02214444
    ldrb r0, [r7, #0x2e4]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    movlo r3, #0x1
.L_02214444:
    cmp r3, #0x0
    moveq r6, #0x0
.L_0221444c:
    ldr r0, [r7, #0x298]
    bl func_ov090_0221c44c
    mov r4, r0
    add r1, r4, #0x1
    mov r0, #0x18
    mul r5, r1, r0
    cmp r6, #0x0
    bne .L_02214898
    add r0, r7, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022144cc
    ldrsh r0, [r7, #0xda]
    ldrb r1, [r7, #0x2a0]
    add r0, r0, #0x2
    add r0, r1, r0
    strb r0, [r7, #0x2a0]
    ldrsh r0, [r7, #0xda]
    ldrb r1, [r7, #0x2a1]
    add r0, r0, #0x1
    add r0, r1, r0
    strb r0, [r7, #0x2a1]
    ldrsh r0, [r7, #0xda]
    cmp r0, #0x2
    movle r0, r0, lsl #0x1
    addle r0, r0, #0x8
    movgt r0, #0x4
    b .L_02214528
.L_022144cc:
    ldrb r0, [r7, #0x2e4]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    bne .L_022144fc
    ldrb r1, [r7, #0x2a0]
    mov r0, #0x8
    add r1, r1, #0x2
    strb r1, [r7, #0x2a0]
    ldrb r1, [r7, #0x2a1]
    add r1, r1, #0x1
    strb r1, [r7, #0x2a1]
    b .L_02214528
.L_022144fc:
    ldrsh r1, [r7, #0xda]
    ldrb r2, [r7, #0x2a0]
    mov r0, #0xa
    add r1, r1, #0x2
    add r1, r2, r1
    strb r1, [r7, #0x2a0]
    ldrsh r1, [r7, #0xda]
    ldrb r2, [r7, #0x2a1]
    add r1, r1, #0x1
    add r1, r2, r1
    strb r1, [r7, #0x2a1]
.L_02214528:
    ldrb r1, [r7, #0x2a0]
    ldr r3, .L_02214c54
    add r2, r7, #0x200
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r3, r1]
    mul r1, r0, r1
    str r1, [r7, #0x2a8]
    ldrb r1, [r7, #0x2a1]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r3, r1]
    mul r1, r0, r1
    str r1, [r7, #0x2ac]
    ldrsb r0, [r2, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214780
    add r0, r7, #0x200
    ldrsh r0, [r0, #0xea]
    cmp r0, #0x3
    blt .L_02214780
    mov r0, r7
    bl func_ov077_022142c8
    cmp r0, #0x0
    movne r1, #0x14000
    bne .L_022145c4
    mov r0, r7
    bl func_ov077_022142e0
    cmp r0, #0x0
    movne r1, #0x14000
    rsbne r1, r1, #0x0
    moveq r1, #0x0
.L_022145c4:
    add r0, r7, #0x200
    ldrsh r2, [r0, #0xea]
    cmp r2, #0x5
    ble .L_022145dc
    cmp r2, #0xa
    blt .L_02214648
.L_022145dc:
    ldr r0, .L_02214c58
    ldr r1, [r7, #0x2b8]
    mov r2, #0x0
    umull r8, r3, r1, r0
    mla r3, r1, r2, r3
    mov r1, r1, asr #0x1f
    adds r8, r8, #0x800
    mla r3, r1, r0, r3
    adc r1, r3, #0x0
    mov r3, r8, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    str r3, [r7, #0x2b8]
    ldr r3, [r7, #0x2bc]
    add r1, r0, #0x7b
    umull r9, r8, r3, r1
    adds r9, r9, #0x800
    mla r8, r3, r2, r8
    mov r3, r3, asr #0x1f
    mla r8, r3, r1, r8
    adc r1, r8, #0x0
    mov r3, r9, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    sub r0, r0, #0x2ec0
    add r0, r3, r0
    str r0, [r7, #0x2bc]
    str r2, [r7, #0x2f4]
    b .L_022148c0
.L_02214648:
    cmp r2, #0x6
    bne .L_022146f4
    ldrsh r0, [r0, #0x5a]
    cmp r0, #0x19
    bge .L_022146f4
    ldr r2, .L_02214c58
    ldr r0, [r7, #0x2b8]
    mov r9, #0x0
    umull r10, ip, r0, r2
    sub r3, r2, #0x1000
    mla ip, r0, r9, ip
    mov r8, r0, asr #0x1f
    adds r0, r10, #0x800
    mla ip, r8, r2, ip
    sub r8, r9, #0x1
    umull r11, r10, r1, r3
    adc ip, ip, #0x0
    mov r0, r0, lsr #0xc
    orr r0, r0, ip, lsl #0x14
    mla r10, r1, r8, r10
    mov r1, r1, asr #0x1f
    mla r10, r1, r3, r10
    adds r3, r11, #0x800
    adc r1, r10, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    add r0, r0, r3
    str r0, [r7, #0x2b8]
    ldr r3, [r7, #0x2bc]
    add r0, r2, #0x7b
    umull r1, r2, r3, r0
    adds r1, r1, #0x800
    mov r8, r1, lsr #0xc
    mov r1, r3, asr #0x1f
    mla r2, r3, r9, r2
    mla r2, r1, r0, r2
    adc r0, r2, #0x0
    orr r8, r8, r0, lsl #0x14
    ldr r0, .L_02214c5c
    add r0, r8, r0
    str r0, [r7, #0x2bc]
    str r9, [r7, #0x2f4]
    b .L_022148c0
.L_022146f4:
    ldr ip, [r7, #0x2b8]
    ldr r8, .L_02214c60
    mov r9, #0x0
    umull r2, r0, ip, r8
    rsb r3, r8, #0x1000
    umull r11, r10, r1, r3
    adds r2, r2, #0x800
    mla r0, ip, r9, r0
    mov ip, ip, asr #0x1f
    mla r0, ip, r8, r0
    adc ip, r0, #0x0
    mov r0, r2, lsr #0xc
    orr r0, r0, ip, lsl #0x14
    adds r2, r11, #0x800
    mov r11, r2, lsr #0xc
    mov r2, r1, asr #0x1f
    mla r10, r1, r9, r10
    mla r10, r2, r3, r10
    adc r1, r10, #0x0
    orr r11, r11, r1, lsl #0x14
    add r0, r0, r11
    str r0, [r7, #0x2b8]
    ldr r1, [r7, #0x2bc]
    umull r0, r2, r1, r8
    adds r0, r0, #0x800
    mov r3, r0, lsr #0xc
    mov r0, r1, asr #0x1f
    mla r2, r1, r9, r2
    mla r2, r0, r8, r2
    adc r0, r2, #0x0
    orr r3, r3, r0, lsl #0x14
    add r0, r3, #0x3340
    str r0, [r7, #0x2bc]
    str r9, [r7, #0x2f4]
    b .L_022148c0
.L_02214780:
    add r0, r7, #0x200
    ldrsh r3, [r0, #0xec]
    ldrsh r0, [r0, #0xee]
    cmp r3, r0
    ble .L_02214880
    add r0, r7, #0x300
    ldrsh r2, [r0, #0x2]
    ldr r0, [r7, #0x2f4]
    ldr r1, .L_02214c64
    smulbb r3, r3, r2
    add r2, r0, #0x52
    mov r0, r3, lsl #0x10
    str r2, [r7, #0x2f4]
    cmp r2, r1
    strgt r1, [r7, #0x2f4]
    mov r2, r0, lsr #0x10
    add r0, r7, #0x200
    ldrh r0, [r0, #0xf2]
    ldr r11, .L_02214c54
    ldr r8, [r7, #0x2f4]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x17
    mov r0, r2, asr #0x4
    mov lr, r0, lsl #0x1
    mov r0, lr, lsl #0x1
    ldrsh r2, [r11, r0]
    mov r0, #0xc
    ldr r1, [r7, #0x2b8]
    movne r10, #0x30000
    rsbne r10, r10, #0x0
    rsb r9, r8, #0x1000
    smulbb r0, r2, r0
    smull r2, r3, r1, r9
    moveq r10, #0x0
    adds ip, r2, #0x800
    smull r2, r1, r0, r8
    adc r0, r3, #0x0
    mov r3, ip, lsr #0xc
    adds r2, r2, #0x800
    orr r3, r3, r0, lsl #0x14
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [r7, #0x2b8]
    ldr r1, [r7, #0x2bc]
    add r0, lr, #0x1
    smull r3, r2, r1, r9
    adds r1, r3, #0x800
    mov r0, r0, lsl #0x1
    ldrsh r3, [r11, r0]
    adc r0, r2, #0x0
    mov r2, #0xc
    smlabb r2, r3, r2, r10
    smull r8, r3, r2, r8
    adds r8, r8, #0x800
    mov r1, r1, lsr #0xc
    adc r2, r3, #0x0
    mov r3, r8, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    add r0, r1, r3
    str r0, [r7, #0x2bc]
    b .L_022148c0
.L_02214880:
    ldr r1, .L_02214c68
    add r0, r7, #0x2b4
    bl func_ov077_02214c7c
    mov r0, #0x0
    str r0, [r7, #0x2f4]
    b .L_022148c0
.L_02214898:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x2a4
    bl func_ov077_02214cd4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r7, #0x2b4
    bl func_ov077_02214cd4
.L_022148c0:
    add r0, sp, #0xb0
    bl VecFx32Object_Init
    ldr r1, [r7, #0x29c]
    add r0, sp, #0xb0
    cmp r1, #0x0
    beq .L_022148e4
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    b .L_022148ec
.L_022148e4:
    add r1, r7, #0x22c
    bl VecFx32Object_Assign
.L_022148ec:
    add r0, r7, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    mov r0, r0, asr #0x1c
    cmp r0, #0x1
    bne .L_02214940
    ldr r3, .L_02214c6c
    add r2, sp, #0x8
    mov r1, #0x4
.L_02214910:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02214910
    ldrsh r1, [r7, #0xda]
    add r0, sp, #0x8
    ldr r2, [sp, #0xbc]
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xbc]
    b .L_022149e0
.L_02214940:
    mov r0, r7
    bl func_ov077_022142c8
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02214968
    mov r0, r7
    bl func_ov077_022142e0
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x1
.L_02214968:
    ldr r8, .L_02214c70
    add r3, sp, #0x98
    mov r2, #0xc
.L_02214974:
    ldrh r1, [r8], #0x2
    subs r2, r2, #0x1
    strh r1, [r3], #0x2
    bne .L_02214974
    ldr r8, .L_02214c74
    add r3, sp, #0x80
    mov r2, #0xc
.L_02214990:
    ldrh r1, [r8], #0x2
    subs r2, r2, #0x1
    strh r1, [r3], #0x2
    bne .L_02214990
    ldrsh r2, [r7, #0xda]
    add r8, sp, #0x98
    add r1, sp, #0x80
    mov r3, r2, lsl #0x1
    add r2, r8, r0, lsl #0x3
    ldrsh r2, [r3, r2]
    ldr r3, [sp, #0xb4]
    add r0, r1, r0, lsl #0x3
    add r1, r3, r2, lsl #0xc
    str r1, [sp, #0xb4]
    ldrsh r1, [r7, #0xda]
    ldr r2, [sp, #0xb8]
    mov r1, r1, lsl #0x1
    ldrsh r0, [r1, r0]
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0xb8]
.L_022149e0:
    ldr r0, [r7, #0x14]
    tst r0, #0x40
    beq .L_02214a4c
    ldr r1, [r7, #0x24]
    mov r0, #0x62
    mul r0, r1, r0
    ldr r2, [r7, #0x238]
    mov r1, #0x64
    add r8, r2, #0x20000
    add r0, r0, r8, lsl #0x1
    bl func_020befec
    str r0, [r7, #0x24]
    cmp r0, r8
    mov r0, r7
    ldr r1, [r0, #0x0]
    ble .L_02214a38
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r7, #0x44]
    sub r0, r1, r0
    str r0, [r7, #0x44]
    b .L_02214a4c
.L_02214a38:
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r7, #0x44]
    add r0, r1, r0
    str r0, [r7, #0x44]
.L_02214a4c:
    add r0, sp, #0x38
    add r1, r7, #0x18
    add r2, r7, #0x2a4
    bl func_ov077_022130b8
    add r0, sp, #0x70
    add r1, sp, #0x38
    add r2, r7, #0x2b4
    bl func_ov077_022130b8
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
    mov r0, #0x0
    cmp r6, #0x0
    add r2, sp, #0xb0
    str r0, [sp, #0x0]
    beq .L_02214aa0
    ldr r1, [r7, #0x54]
    ldr r0, [r7, #0x298]
    ldrb r3, [r1, #0x3a]
    add r1, sp, #0x70
    bl func_ov090_0221c184
    b .L_02214ab8
.L_02214aa0:
    str r0, [sp, #0x4]
    ldr r1, [r7, #0x54]
    ldr r0, [r7, #0x298]
    ldrb r3, [r1, #0x3a]
    add r1, sp, #0x70
    bl func_ov090_0221be40
.L_02214ab8:
    add r0, r7, #0x200
    ldrsb r2, [r0, #0xe5]
    cmp r2, #0x0
    beq .L_02214b0c
    ldrsh r1, [r0, #0xe6]
    cmp r2, #0x0
    add r1, r1, r2
    ble .L_02214af4
    strh r1, [r0, #0xe6]
    ldrsh r1, [r0, #0xe6]
    cmp r1, r5
    movge r1, #0x0
    strgeb r1, [r7, #0x2e5]
    strgeh r1, [r0, #0xe6]
    b .L_02214b0c
.L_02214af4:
    strh r1, [r0, #0xe6]
    ldrsh r1, [r0, #0xe6]
    cmp r1, #0x0
    movlt r1, #0x0
    strltb r1, [r7, #0x2e5]
    strlth r1, [r0, #0xe6]
.L_02214b0c:
    ldr r3, .L_02214c78
    add r2, sp, #0x10
    mov r5, #0x0
    mov r1, #0x14
.L_02214b1c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02214b1c
    b .L_02214c0c
.L_02214b30:
    sub r1, r4, r5
    ldr r0, [r7, #0x298]
    sub r1, r1, #0x1
    bl func_ov090_0221c434
    add r2, r7, #0x200
    ldrsb r1, [r2, #0xe5]
    ldr r6, [r0, #0x4]
    mov r0, #0x100
    cmp r1, #0x0
    beq .L_02214bb8
    mov r1, #0x18
    mul r1, r5, r1
    ldrsh r2, [r2, #0xe6]
    add r8, sp, #0x10
    add r3, sp, #0x48
    sub r2, r2, r1
    mov r1, r2, asr #0x1
    add r1, r2, r1, lsr #0x1e
    mov r9, r1, asr #0x2
    mov r2, #0x14
.L_02214b80:
    ldrh r1, [r8], #0x2
    subs r2, r2, #0x1
    strh r1, [r3], #0x2
    bne .L_02214b80
    cmp r9, #0x0
    blt .L_02214bb8
    cmp r9, #0x14
    bge .L_02214bb8
    add r1, sp, #0x48
    mov r2, r9, lsl #0x1
    ldrsh r1, [r1, r2]
    add r0, r0, r1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
.L_02214bb8:
    ldr r1, [r6, #0x4]
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    ldr r1, [r6, #0x8]
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    ldrsh r8, [r7, #0xda]
    ldr r0, [r6, #0x4]
    cmp r8, #0x2
    movgt r8, #0x2
    cmp r5, #0x0
    ldrb r1, [r0, #0x38]
    addeq r8, r8, #0x3
    cmp r8, r1
    beq .L_02214c08
    and r1, r8, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    and r1, r8, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02214c08:
    add r5, r5, #0x1
.L_02214c0c:
    cmp r5, r4
    blt .L_02214b30
    ldr r1, [r7, #0x260]
    mov r0, r7
    orr r1, r1, #0x2
    str r1, [r7, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    add r0, sp, #0x70
    bl VecFx32Object_Destroy
    add r0, sp, #0xb0
    bl VecFx32Object_Destroy
.L_02214c40:
    add sp, sp, #0xf0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02214c48: .word data_ov077_02216fc8
.L_02214c4c: .word data_ov077_02217020
.L_02214c50: .word data_ov077_02217018
.L_02214c54: .word gFx32CosSinTable
.L_02214c58: .word 0xeb8
.L_02214c5c: .word 0xffffc7f2
.L_02214c60: .word 0xe66
.L_02214c64: .word 0xb33
.L_02214c68: .word 0xf0a
.L_02214c6c: .word data_ov077_02216f2c
.L_02214c70: .word data_ov077_02216f7c
.L_02214c74: .word data_ov077_02216f34
.L_02214c78: .word data_ov077_02216f94
.size func_ov077_022142f8, . - func_ov077_022142f8
