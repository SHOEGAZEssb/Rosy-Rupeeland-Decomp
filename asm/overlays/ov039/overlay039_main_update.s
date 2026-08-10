.text
/* Exact fallback; see overlay039_main_update.c for documented portable C. */
    .extern func_ov039_021feff0
    .extern func_ov039_021fe05c
    .extern func_ov039_021ff01c
    .extern func_ov039_021ff330
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern GraphicsSpriteState_SetFrameIndex
    .extern VecFx32Object_InitCopy
    .extern VecFx32Object_Destroy
    .extern VecFx32Object_Assign
    .extern func_020adc40
    .extern func_020ae024
    .extern func_ov069_02211594
    .extern func_ov065_0220ff20
    .extern func_ov069_022119dc
    .extern func_ov069_022119bc
    .extern func_ov069_02210a44
    .extern func_0201e0ec
    .extern func_020a28e0
    .extern func_020a2614
    .extern func_0209f158
    .extern Sound_Play
    .extern DisplayBrightnessPair_GetScreen
    .extern DisplayBrightness_StartTransition
    .extern DisplayBrightness_GetCurrent
    .extern data_ov039_0220801c
    .extern data_ov039_02208028
    .extern data_ov039_02208034
    .extern data_020c9670
    .extern data_ov039_022083b0
    .extern data_ov039_022083a4
    .extern data_ov039_02208398
    .extern data_ov039_02207fe0
    .extern data_ov039_02207fe7
    .extern data_ov039_02207fdc
    .extern data_ov039_02207fd8
    .extern data_ov039_02208010
    .extern data_021052fc
    .extern data_020f4dc8
    .extern gSoundContext

    .global func_ov039_021ff610
func_ov039_021ff610:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xa8
    mov r10, r0
    bl func_ov039_021feff0
    add r3, r10, #0x1c00
    ldrh r1, [r3, #0xae]
    cmp r1, #0x0
    bne L_021ff68c
    mov r1, #0x190
    mul r1, r0, r1
    mov r2, #0xe6
    add r1, r1, #0x26
    mul r2, r0, r2
    ldrh r4, [r3, #0x94]
    add r0, r1, #0x200
    add r1, r2, #0x12c
    add r0, r4, r0
    strh r0, [r3, #0x94]
    ldrh r2, [r3, #0x96]
    ldr r0, L_022003c0
    add r1, r2, r1
    strh r1, [r3, #0x96]
    ldrh r2, [r3, #0x94]
    ldrh r1, [r3, #0xaa]
    mla r2, r1, r0, r2
    strh r2, [r3, #0x94]
    ldrh r2, [r3, #0x96]
    ldrh r1, [r3, #0xaa]
    mla r0, r1, r0, r2
    strh r0, [r3, #0x96]
    b L_021ff6bc
L_021ff68c:
    add r2, r10, #0x1c00
    mov r0, r1, lsr #0x3
    rsbs r4, r0, #0xa
    ldrh r3, [r2, #0x94]
    movmi r4, #0x0
    mov r0, #0x190
    mla r0, r4, r0, r3
    strh r0, [r2, #0x94]
    ldrh r0, [r2, #0x96]
    mov r1, #0xe6
    mla r0, r4, r1, r0
    strh r0, [r2, #0x96]
L_021ff6bc:
    ldr r0, L_022003c4
    ldr r3, L_022003c8
    add r5, sp, #0x9c
    ldmia r0, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldmia r3, {r0, r1, r2}
    add r4, sp, #0x90
    ldr r6, L_022003cc
    stmia r4, {r0, r1, r2}
    add r3, sp, #0x84
    ldmia r6, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r9, L_022003d0
    ldr lr, L_022003d4
    mov r11, #0x0
    add r0, r10, #0x1c00
L_021ff6fc:
    ldrh r2, [r0, #0x94]
    ldr r1, [r5, r11, lsl #0x2]
    ldrsh r7, [r0, #0xa0]
    add r1, r2, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r6, [r9, r1]
    add r2, r10, r11, lsl #0x2
    ldr r1, [r2, #0x74]
    smull r8, r7, r6, r7
    adds r6, r8, #0x800
    adc r7, r7, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r7, lsl #0x14
    mov r7, r6, asr #0x1f
    mov r7, r7, lsl #0xe
    mov r8, #0x800
    orr r7, r7, r6, lsr #0x12
    adds r6, r8, r6, lsl #0xe
    adc r7, r7, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r7, lsl #0x14
    str r6, [r1, #0x30]
    ldr r1, [r2, #0x74]
    ldrh r7, [r0, #0x96]
    ldr r2, [r4, r11, lsl #0x2]
    ldrsh r6, [r0, #0xa0]
    add r2, r7, r2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh ip, [r9, r2]
    ldr r2, [r3, r11, lsl #0x2]
    ldr r8, [lr, r11, lsl #0x2]
    smull r7, r6, ip, r6
    adds ip, r7, #0x800
    adc r6, r6, #0x0
    mov r7, ip, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    smull r6, r2, r7, r2
    adds r6, r6, #0x800
    adc r2, r2, #0x0
    mov r6, r6, lsr #0xc
    orr r6, r6, r2, lsl #0x14
    add r11, r11, #0x1
    add r2, r8, r6
    mov r7, #0x0
    str r2, [r1, #0x34]
    cmp r11, #0x3
    blt L_021ff6fc
    add r0, r10, #0x1000
    ldr r0, [r0, #0xc98]
    cmp r0, #0x0
    add r0, r10, #0x1c00
    bne L_021ff810
    ldrh r1, [r0, #0xaa]
    cmp r1, #0x0
    bne L_021ff8d8
    ldrsh r1, [r0, #0xa0]
    add r1, r1, #0x7b
    strh r1, [r0, #0xa0]
    ldrsh r1, [r0, #0xa0]
    cmp r1, #0x1000
    movgt r1, #0x1000
    strgth r1, [r0, #0xa0]
    b L_021ff8d8
L_021ff810:
    ldrsh r1, [r0, #0xa0]
    add r5, r10, #0x1000
    ldr lr, L_022003d8
    sub r1, r1, #0xcd
    strh r1, [r0, #0xa0]
    ldrsh r1, [r0, #0xa0]
    cmp r1, #0x0
    movlt r1, r7
    strlth r1, [r0, #0xa0]
    ldr r0, [r5, #0xc98]
    mov r1, #0x3
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r2, r0, #0x1
    ldr r0, L_022003d0
    mov r2, r2, lsl #0x1
    ldrsh r0, [r0, r2]
    sub r2, r1, #0x1
    mvn r1, #0x0
    rsb r0, r0, #0x0
    add r4, r0, #0x1000
    ldr r0, L_022003dc
    mov r3, r4, asr #0x1f
L_021ff874:
    ldr r6, [r5, #0xc98]
    cmp r6, #0x0
    movlt r6, r1
    blt L_021ff88c
    movgt r6, #0x1
    movle r6, #0x0
L_021ff88c:
    cmp r6, #0x0
    ldrgt r7, [r0, r2, lsl #0x2]
    add r6, r10, r2, lsl #0x2
    ldrgt ip, [r6, #0x74]
    ldrle r7, [lr, r2, lsl #0x2]
    ldrle ip, [r6, #0x74]
    mov r6, r7, asr #0x1f
    umull r9, r8, r4, r7
    mla r8, r4, r6, r8
    adds r6, r9, #0x800
    mla r8, r3, r7, r8
    adc r7, r8, #0x0
    mov r6, r6, lsr #0xc
    ldr r11, [ip, #0x30]
    orr r6, r6, r7, lsl #0x14
    add r6, r11, r6
    str r6, [ip, #0x30]
    subs r2, r2, #0x1
    bpl L_021ff874
L_021ff8d8:
    add r0, r10, #0x1000
    ldr r3, [r0, #0xc9c]
    cmp r3, #0x0
    beq L_021ffa0c
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, L_022003d0
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r3, #0x0
    rsb r0, r0, #0x0
    add r2, r0, #0x1000
    mvnlt r0, #0x0
    blt L_021ff928
    cmp r3, #0x0
    movgt r0, #0x1
    movle r0, #0x0
L_021ff928:
    cmp r0, #0x0
    ble L_021ff99c
    mov r3, #0x2800
    umull r1, r8, r2, r3
    mov r5, #0x0
    mov r4, #0x5000
    umull r7, r6, r2, r4
    ldr r0, [r10, #0x78]
    adds r9, r1, #0x800
    mla r8, r2, r5, r8
    mov r1, r2, asr #0x1f
    mla r8, r1, r3, r8
    mla r6, r2, r5, r6
    adc r3, r8, #0x0
    mov r5, r9, lsr #0xc
    adds r2, r7, #0x800
    mla r6, r1, r4, r6
    ldr r1, [r0, #0x34]
    orr r5, r5, r3, lsl #0x14
    add r1, r1, r5
    str r1, [r0, #0x34]
    ldr r3, [r10, #0x7c]
    adc r0, r6, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r3, #0x34]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r3, #0x34]
    b L_021ffa0c
L_021ff99c:
    mov r3, #0x5000
    rsb r3, r3, #0x0
    umull r1, r8, r2, r3
    mvn r5, #0x0
    mov r0, #0x800
    sub r4, r0, #0xa800
    umull r7, r6, r2, r4
    ldr r0, [r10, #0x78]
    adds r9, r1, #0x800
    mla r8, r2, r5, r8
    mov r1, r2, asr #0x1f
    mla r8, r1, r3, r8
    mla r6, r2, r5, r6
    adc r3, r8, #0x0
    mov r5, r9, lsr #0xc
    adds r2, r7, #0x800
    mla r6, r1, r4, r6
    ldr r1, [r0, #0x34]
    orr r5, r5, r3, lsl #0x14
    add r1, r1, r5
    str r1, [r0, #0x34]
    ldr r3, [r10, #0x7c]
    adc r0, r6, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r3, #0x34]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r3, #0x34]
L_021ffa0c:
    add r1, r10, #0x1c00
    ldr r4, [r10, #0x74]
    ldrh r2, [r1, #0xaa]
    ldr r3, [r4, #0x34]
    ldr r0, L_022003e0
    sub r2, r3, r2, lsl #0xc
    str r2, [r4, #0x34]
    ldrh r2, [r1, #0xaa]
    ldr r3, [r10, #0x78]
    mul r0, r2, r0
    ldr r2, [r3, #0x34]
    sub r0, r2, r0
    str r0, [r3, #0x34]
    ldr r3, [r10, #0x7c]
    ldrh r0, [r1, #0xaa]
    ldr r2, [r3, #0x34]
    sub r0, r2, r0, lsl #0xa
    str r0, [r3, #0x34]
    ldrh r2, [r1, #0xac]
    cmp r2, #0x0
    bne L_021ffa6c
    mov r0, r10
    bl func_ov039_021fe05c
    b L_0220002c
L_021ffa6c:
    ldrh r0, [r1, #0xb2]
    cmp r2, #0x1
    add r4, r0, r0, lsl #0x1
    subhi r0, r2, #0x1
    strhih r0, [r1, #0xac]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x74]
    cmp r0, #0x19
    bne L_021ffabc
    add r0, r10, #0x1c00
    ldrh r0, [r0, #0xac]
    cmp r0, #0x20
    blo L_021ffabc
    add r0, r10, #0x2fc
    add r0, r0, #0x800
    bl func_ov069_02211594
    cmp r0, #0x0
    addeq r0, r10, #0x1c00
    moveq r1, #0x20
    streqh r1, [r0, #0xac]
L_021ffabc:
    add r0, r10, #0x1c00
    ldrh r2, [r0, #0xae]
    add r1, r10, #0x1000
    add r2, r2, #0x1
    strh r2, [r0, #0xae]
    ldr r0, [r1, #0xdb0]
    cmp r0, #0x0
    ble L_021ffb70
    add r0, r0, #0x1
    str r0, [r1, #0xdb0]
    cmp r0, #0x14
    bne L_021ffb40
    add r0, r10, #0x118
    mvn r1, #0x0
    bl func_ov065_0220ff20 ; func_ov069_0220ff20
    ldr r1, [r10, #0x98]
    add r0, r10, #0xda0
    add r0, r0, #0x1000
    add r1, r1, #0x1c
    bl VecFx32Object_Assign
    ldr r5, [r10, #0x98]
    ldr r0, L_022003e4
    ldrh r3, [r5, #0x42]
    ldr r1, L_022003e8
    mov r2, #0x8
    orr r3, r3, #0x4
    strh r3, [r5, #0x42]
    ldr r5, [r10, #0x9c]
    ldrh r3, [r5, #0x42]
    orr r3, r3, #0x4
    strh r3, [r5, #0x42]
    ldr r0, [r0, #0x0]
    bl Sound_Play
L_021ffb40:
    add r0, r10, #0x1000
    ldr r1, [r0, #0xdb0]
    mov r0, #0xbe
    sub r1, r1, #0x14
    mul r2, r1, r0
    ldr r0, L_022003ec
    subs r2, r0, r2
    add r0, r10, #0x1000
    ldr r1, [r0, #0xda8]
    movmi r2, #0x0
    sub r1, r1, r2
    str r1, [r0, #0xda8]
L_021ffb70:
    ldr r0, L_022003f0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    add r1, r10, #0x1c00
    ldrh r1, [r1, #0xae]
    mov r5, r0
    cmp r1, #0xa
    bne L_021ffc60
    ldr r3, [r10, #0x74]
    mov r1, #0x8c
    str r1, [sp, #0x0]
    ldr r2, [r3, #0x20]
    ldr r1, [r3, #0x24]
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    sub r2, r2, #0x28
    add r3, r1, #0x14
    mov r1, #0x2
    bl func_020a28e0
    ldr r2, [r10, #0x78]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x20]
    ldr r0, [r2, #0x24]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r5
    add r2, r2, #0x32
    add r3, r1, #0xa
    mov r1, #0x2
    bl func_020a28e0
    ldr r2, [r10, #0x7c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x20]
    ldr r0, [r2, #0x24]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r5
    sub r2, r2, #0x3c
    add r3, r1, #0x14
    mov r1, #0x2
    bl func_020a28e0
    ldr r3, [r10, #0x7c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, #0x2
    ldr r2, [r3, #0x20]
    ldr r3, [r3, #0x24]
    mov r2, r2, asr #0xc
    add r2, r2, #0x19
    mov r3, r3, asr #0xc
    add r3, r3, #0x32
    bl func_020a28e0
    mov r0, r10
    mov r1, #0x4
    bl func_ov039_021ff330
L_021ffc60:
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne L_021ffc88
    add r0, r10, #0x1c00
    ldrh r1, [r0, #0xae]
    cmp r1, #0xb4
    moveq r1, #0x12c
    streqh r1, [r0, #0xae]
    b L_021ffca4
L_021ffc88:
    bl func_ov069_022119dc
    cmp r0, #0x0
    beq L_021ffca4
    ldr r0, [r10, #0x98]
    mov r1, #0x8
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
L_021ffca4:
    add r2, r10, #0x1c00
    ldrh r3, [r2, #0xae]
    cmp r3, #0x12c
    bne L_021ffce8
    ldrh r0, [r2, #0xb2]
    cmp r0, #0x0
    moveq r0, #0x17c
    streqh r0, [r2, #0xae]
    beq L_0220002c
    add r2, r10, #0x1000
    ldr r1, [r2, #0xdb0]
    add r0, r10, #0x118
    add r3, r1, #0x1
    mov r1, #0x1
    str r3, [r2, #0xdb0]
    bl func_ov065_0220ff20 ; func_ov069_0220ff20
    b L_0220002c
L_021ffce8:
    ldr r1, L_022003f4
    cmp r3, r1
    bne L_021ffddc
    ldr r1, [r10, #0x74]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x24]
    ldr r2, [r1, #0x20]
    mov r1, r0, asr #0xc
    mov r0, r5
    mov r2, r2, asr #0xc
    add r3, r1, #0x1e
    mov r1, #0x0
    bl func_020a2614
    ldr r3, [r10, #0x74]
    add r0, r10, #0x2fc
    ldrh r2, [r3, #0x42]
    mov r1, r4
    add r0, r0, #0x800
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x98]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x9c]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x80]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x84]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r10, #0x48]
    ldr r4, [r10, #0x74]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x24]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_022003e4
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r1, [r10, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_0220002c
L_021ffddc:
    add r0, r1, #0x28
    cmp r3, r0
    bne L_021ffeb0
    ldr r1, [r10, #0x78]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x24]
    ldr r2, [r1, #0x20]
    mov r1, r0, asr #0xc
    mov r0, r5
    mov r2, r2, asr #0xc
    add r3, r1, #0x1e
    mov r1, #0x0
    bl func_020a2614
    ldr r3, [r10, #0x78]
    add r0, r10, #0x2fc
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    add r1, r4, #0x1
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x88]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x8c]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r10, #0x48]
    ldr r4, [r10, #0x78]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x24]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_022003e4
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    ldr r1, [r10, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_0220002c
L_021ffeb0:
    add r0, r1, #0x50
    cmp r3, r0
    bne L_021fffc0
    ldr r1, [r10, #0x7c]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x24]
    ldr r2, [r1, #0x20]
    mov r1, r0, asr #0xc
    mov r0, r5
    mov r2, r2, asr #0xc
    sub r3, r1, #0x14
    mov r1, #0x0
    bl func_020a2614
    ldr r3, [r10, #0x7c]
    add r0, r10, #0x2fc
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    add r1, r4, #0x2
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x88]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x90]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r10, #0x94]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r10, #0x48]
    ldr r4, [r10, #0x7c]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x24]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_022003e4
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r1, [r10, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    add r0, r10, #0x1c00
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x1
    bne L_0220002c
    ldr r0, L_022003f8
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, #0x10
    mov r3, #0x30
    bl DisplayBrightness_StartTransition
    b L_0220002c
L_021fffc0:
    cmp r3, #0x1f4
    ldreqh r0, [r2, #0xb2]
    cmpeq r0, #0x0
    bne L_021ffff4
    ldr r0, [r10, #0x48]
    mov r1, #0x19
    str r1, [r0, #0x74]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq L_0220002c
    bl func_ov069_022119bc ; func_ov071_022119bc
    b L_0220002c
L_021ffff4:
    cmp r3, #0x1f4
    blt L_0220002c
    add r0, r10, #0x1c00
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    beq L_0220002c
    ldr r0, L_022003f8
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    cmp r0, #0x10
    ldreq r0, [r10, #0x48]
    moveq r1, #0x2b
    streq r1, [r0, #0x74]
L_0220002c:
    add r0, r10, #0x1c00
    ldrh r1, [r0, #0xaa]
    cmp r1, #0x0
    beq L_022000c8
    sub r1, r1, #0x1
    strh r1, [r0, #0xaa]
    ldrh r1, [r0, #0xaa]
    cmp r1, #0x0
    ldreqh r0, [r0, #0xac]
    cmpeq r0, #0x0
    bne L_022000ec
    add r1, r10, #0x1000
    mov r2, #0x0
    mov r0, r10
    str r2, [r1, #0xd94]
    bl func_ov039_021ff01c
    ldr r0, [r10, #0x98]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x5c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x4c]
    mov r2, #0x65
    strh r2, [r0, #0x40]
    ldr r1, [r10, #0x5c]
    ldr r0, L_022003e4
    strh r2, [r1, #0x40]
    ldr r0, [r0, #0x0]
    mov r1, #0x63
    mov r2, #0x8
    bl Sound_Play
    b L_022000ec
L_022000c8:
    add r0, r10, #0x1000
    ldr r2, [r10, #0x30]
    ldr r1, [r0, #0xd94]
    add r1, r2, r1
    str r1, [r10, #0x30]
    ldr r1, [r10, #0x34]
    ldr r0, [r0, #0xd98]
    add r0, r1, r0
    str r0, [r10, #0x34]
L_022000ec:
    add r0, r10, #0x1c00
    ldrh r0, [r0, #0xac]
    cmp r0, #0x0
    bne L_022001c0
    mov r0, #0x6
    mov r7, #0x28000
    sub r6, r0, #0x1
    rsb r7, r7, #0x0
    add r4, sp, #0x74
    mov r5, #0x0
L_02200114:
    add r0, r10, r6, lsl #0x2
    ldr r0, [r0, #0x80]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq L_022001b8
    mov r1, r5
    bl GraphicsSpriteState_SetFrameIndex
    add r2, r10, r6, lsl #0x2
    ldr r0, [r2, #0x80]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r2, #0x80]
    ldr r0, [r1, #0xc]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x5
    bne L_022001b8
    mov r0, r4
    add r1, r1, #0x1c
    bl VecFx32Object_InitCopy
    mov r1, r6, lsr #0x1f
    rsb r0, r1, r6, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    mov r1, r0, lsl #0x1
    ldr r0, [sp, #0x7c]
    ldr r2, [sp, #0x78]
    sub r1, r1, #0x1
    mla r2, r1, r7, r2
    add r0, r0, #0x1c000
    str r2, [sp, #0x78]
    str r0, [sp, #0x7c]
    ldr r0, [r10, #0x48]
    mov r1, r4
    ldr r0, [r0, #0x10]
    bl func_0209f158
    mov r0, r4
    bl VecFx32Object_Destroy
L_022001b8:
    subs r6, r6, #0x1
    bpl L_02200114
L_022001c0:
    ldr r0, [r10, #0x74]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    beq L_022001f8
    mov r2, #0x0
L_022001d4:
    add r0, r10, r2, lsl #0x2
    ldr r1, [r0, #0x4c]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x42]
    cmp r2, #0xa
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    blt L_022001d4
    b L_022006dc
L_022001f8:
    ldr r3, L_022003fc
    add r2, sp, #0x1f
    mov r9, #0x0
    mov r1, #0x7
L_02200208:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02200208
    ldr r3, L_02200400
    add r2, sp, #0x18
    mov r1, #0x7
L_02200224:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02200224
    ldr r3, L_02200404
    add r2, sp, #0x14
    mov r1, #0x4
L_02200240:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02200240
    ldr r3, L_02200408
    add r2, sp, #0x10
    mov r1, #0x4
L_0220025c:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_0220025c
    ldr r0, L_0220040c
    add r3, sp, #0x3c
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
L_0220027c:
    ldr r0, [r10, #0x48]
    add r1, r10, r9, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r2, [r1, #0x58]
    ldr r1, [r0, #0x48]
    add r0, sp, #0x64
    add r1, r1, #0x2c
    ldr r4, [r2, #0x30]
    ldr r5, [r2, #0x34]
    bl VecFx32Object_InitCopy
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x58]
    ldr r3, [sp, #0x6c]
    ldr r2, [sp, #0x70]
    add r0, sp, #0x54
    sub r2, r3, r2
    add r1, r1, #0x1c
    sub r7, r2, #0x10000
    ldr r6, [sp, #0x68]
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    sub r0, r6, r0
    str r0, [sp, #0xc]
    sub r0, r7, r1
    str r0, [sp, #0x8]
    ldr r0, [sp, #0xc]
    smull r1, r3, r0, r0
    adds r6, r1, #0x800
    ldr r0, [sp, #0x8]
    adc r3, r3, #0x0
    smull r2, r1, r0, r0
    adds r2, r2, #0x800
    mov r6, r6, lsr #0xc
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r6, r6, r3, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r6, r1
    bl func_020adc40
    add r3, r10, r9, lsl #0x2
    add r2, r3, #0x1000
    add r1, r3, #0xc8
    add r11, r1, #0x1c00
    add r1, r3, #0xcf0
    add r3, r1, #0x1000
    add r1, r10, #0x1c00
    ldrh r1, [r1, #0xaa]
    ldr r7, [r2, #0xcf0]
    ldr r6, [r2, #0xcc8]
    cmp r1, #0x0
    mov r8, #0x0
    movne r7, #0x1800
    bne L_02200538
    cmp r0, #0x50000
    bge L_0220038c
    cmp r7, #0x1000
    bge L_02200374
    add r7, r7, #0xcd
    cmp r7, #0x1000
    movgt r7, #0x1000
    str r7, [r3, #0x0]
L_02200374:
    cmp r6, #0x65
    moveq r8, #0x1
    beq L_02200424
    cmp r6, #0x66
    moveq r8, #0x2
    b L_02200424
L_0220038c:
    cmp r7, #0x0
    ble L_022003a0
    subs r7, r7, #0x7b
    movmi r7, r8
    str r7, [r3, #0x0]
L_022003a0:
    cmp r0, #0x91000
    bge L_02200410
    cmp r6, #0x64
    moveq r8, #0x3
    beq L_02200424
    cmp r6, #0x66
    moveq r8, #0x4
    b L_02200424
L_022003c0: .word 0x898
L_022003c4: .word data_ov039_0220801c
L_022003c8: .word data_ov039_02208028
L_022003cc: .word data_ov039_02208034
L_022003d0: .word data_020c9670
L_022003d4: .word data_ov039_022083b0
L_022003d8: .word data_ov039_022083a4
L_022003dc: .word data_ov039_02208398
L_022003e0: .word 0x555
L_022003e4: .word gSoundContext
L_022003e8: .word 0x1c5
L_022003ec: .word 0x2b33
L_022003f0: .word data_021052fc
L_022003f4: .word 0x186
L_022003f8: .word data_020f4dc8
L_022003fc: .word data_ov039_02207fe0
L_02200400: .word data_ov039_02207fe7
L_02200404: .word data_ov039_02207fdc
L_02200408: .word data_ov039_02207fd8
L_0220040c: .word data_ov039_02208010
L_02200410:
    cmp r6, #0x64
    moveq r8, #0x5
    beq L_02200424
    cmp r6, #0x65
    moveq r8, #0x6
L_02200424:
    cmp r8, #0x0
    beq L_022004a0
    add r3, sp, #0x1f
    add r2, sp, #0x35
    mov r1, #0x7
L_02200438:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02200438
    add r3, sp, #0x18
    add r2, sp, #0x2e
    mov r1, #0x7
L_02200454:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02200454
    add r1, r10, r9, lsl #0x2
    add r0, sp, #0x35
    ldr r2, [r1, #0x4c]
    ldrb r1, [r0, r8]
    ldr r0, [r2, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x4c]
    add r0, sp, #0x2e
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldrb r0, [r0, r8]
    str r0, [r11, #0x0]
L_022004a0:
    cmp r6, #0x1
    blt L_02200538
    cmp r6, #0x3
    bgt L_02200538
    add r3, sp, #0x14
    add r2, sp, #0x2a
    mov r1, #0x4
L_022004bc:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_022004bc
    add r3, sp, #0x10
    add r2, sp, #0x26
    mov r1, #0x4
L_022004d8:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_022004d8
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq L_02200538
    add r1, sp, #0x2a
    ldrb r1, [r1, r6]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x4c]
    add r0, sp, #0x26
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldrb r0, [r0, r6]
    str r0, [r11, #0x0]
L_02200538:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    bl func_020ae024
    add r1, sp, #0x3c
    mov r6, r0
    add r3, sp, #0x48
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [sp, #0x48]
    ldr r11, [sp, #0x4c]
    smull r1, r2, r0, r7
    adds r3, r1, #0x800
    ldr r8, [sp, #0x50]
    smull r1, r0, r11, r7
    smull r11, r7, r8, r7
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    adds r2, r1, #0x800
    adc r0, r0, #0x0
    adds r1, r11, #0x800
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    adc r0, r7, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r3, [sp, #0x48]
    str r2, [sp, #0x4c]
    add r0, r10, #0x1c00
    str r1, [sp, #0x50]
    ldrh r1, [r0, #0xaa]
    cmp r1, #0x0
    beq L_022005d4
    mov r0, #0xfa0
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    add r0, r6, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
L_022005d4:
    mov r0, r6, asr #0x4
    mov r2, r0, lsl #0x1
    ldr r0, L_022003d0
    add r3, r10, r9, lsl #0x2
    add r1, r0, r2, lsl #0x1
    ldrsh r6, [r1, #0x2]
    ldr r1, [sp, #0x48]
    ldr r7, [r3, #0x54]
    smull r11, r8, r6, r1
    adds r11, r11, #0x800
    adc r8, r8, #0x0
    mov r11, r11, lsr #0xc
    orr r11, r11, r8, lsl #0x14
    add r8, r4, r11
    str r8, [r7, #0x30]
    mov r2, r2, lsl #0x1
    ldrsh r2, [r0, r2]
    ldr r7, [r3, #0x54]
    add r0, sp, #0x54
    smull r8, r1, r2, r1
    adds r8, r8, #0x800
    adc r1, r1, #0x0
    mov r8, r8, lsr #0xc
    orr r8, r8, r1, lsl #0x14
    add r1, r5, r8
    str r1, [r7, #0x34]
    ldr r1, [sp, #0x4c]
    ldr r7, [r3, #0x50]
    smull r11, r8, r6, r1
    adds r11, r11, #0x800
    adc r8, r8, #0x0
    mov r11, r11, lsr #0xc
    orr r11, r11, r8, lsl #0x14
    add r8, r4, r11
    str r8, [r7, #0x30]
    smull r7, r1, r2, r1
    adds r7, r7, #0x800
    adc r1, r1, #0x0
    mov r7, r7, lsr #0xc
    orr r7, r7, r1, lsl #0x14
    ldr r1, [r3, #0x50]
    add r7, r5, r7
    str r7, [r1, #0x34]
    ldr r1, [sp, #0x50]
    ldr r7, [r3, #0x4c]
    smull r11, r8, r6, r1
    smull r6, r1, r2, r1
    adds r11, r11, #0x800
    adc r2, r8, #0x0
    mov r8, r11, lsr #0xc
    orr r8, r8, r2, lsl #0x14
    add r2, r4, r8
    str r2, [r7, #0x30]
    adds r2, r6, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    ldr r1, [r3, #0x4c]
    add r2, r5, r2
    str r2, [r1, #0x34]
    bl VecFx32Object_Destroy
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    add r9, r9, #0x4
    cmp r9, #0x4
    ble L_0220027c
L_022006dc:
    mov r0, #0x1e
    sub r1, r0, #0x1
    mov r2, #0x4
L_022006e8:
    add r0, r10, r1, lsl #0x2
    ldr r5, [r0, #0xa0]
    ldr r3, [r5, #0x18]
    cmp r3, #0x0
    bne L_0220075c
    ldr r4, [r5, #0x4]
    ldr r3, [r5, #0x10]
    add r3, r4, r3
    str r3, [r5, #0x4]
    ldr r4, [r5, #0x8]
    ldr r3, [r5, #0x14]
    add r3, r4, r3
    str r3, [r5, #0x8]
    ldr r4, [r0, #0xa0]
    ldr r3, [r4, #0x1c]
    add r3, r3, #0x1
    str r3, [r4, #0x1c]
    ldr r3, [r0, #0xa0]
    ldr r0, [r3, #0x4]
    cmp r0, #0x2bc000
    bgt L_02200758
    cmp r0, #0x144000
    blt L_02200758
    ldr r0, [r3, #0x8]
    cmp r0, #0x280000
    bgt L_02200758
    cmp r0, #0x6e000
    bge L_0220075c
L_02200758:
    str r2, [r3, #0x18]
L_0220075c:
    subs r1, r1, #0x1
    bpl L_022006e8
    add sp, sp, #0xa8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov039_021ff610, .-func_ov039_021ff610

