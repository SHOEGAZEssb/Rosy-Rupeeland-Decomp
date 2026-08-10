.text
/* Exact fallback; see overlay039_central_update.c for documented portable C. */
    .extern func_020befec
    .extern GameWork_TestFlag
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_ov039_021ff330
    .extern func_ov039_021fdb9c
    .extern Sound_Play
    .extern VecFx32Object_InitCopy
    .extern func_ov039_021fd93c
    .extern genrand_int32
    .extern func_020bf1f8
    .extern func_0205940c
    .extern VecFx32Object_Init
    .extern VecFx32Object_Assign
    .extern VecFx32Object_Destroy
    .extern func_ov069_0220fe2c
    .extern func_ov069_0220fe3c
    .extern VecFx32Object_Add
    .extern func_ov049_0220c6cc
    .extern data_ov039_02207fee
    .extern data_ov039_02207ff8
    .extern data_ov039_02208003
    .extern data_ov039_02208040
    .extern data_ov039_02208050
    .extern data_ov039_02208063
    .extern gGameWork
    .extern gSoundContext

    .global func_ov039_021fe05c
func_ov039_021fe05c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x9c
    ldr r3, L_021fed50
    add r2, sp, #0x8f
    mov r6, r0
    mov r1, #0xa
L_021fe074:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fe074
    ldr r3, L_021fed54
    add r2, sp, #0x84
    mov r1, #0xb
L_021fe090:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fe090
    ldr r3, L_021fed58
    add r2, sp, #0x79
    mov r1, #0xb
L_021fe0ac:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fe0ac
    ldr r3, L_021fed5c
    add r2, sp, #0x69
    mov r1, #0x10
L_021fe0c8:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fe0c8
    ldr r3, L_021fed60
    add r2, sp, #0x56
    mov r1, #0x13
L_021fe0e4:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fe0e4
    ldr r3, L_021fed64
    add r2, sp, #0x40
    mov r1, #0x16
L_021fe100:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_021fe100
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xb2]
    add r4, sp, #0x8f
    ldrsh r0, [r0, #0xa8]
    cmp r1, #0x0
    mov r1, #0xa
    bne L_021fe14c
    bl func_020befec
    cmp r0, #0x1
    beq L_021fe144
    cmp r0, #0x2
    addeq r4, sp, #0x84
    b L_021fe16c
L_021fe144:
    add r4, sp, #0x79
    b L_021fe16c
L_021fe14c:
    add r4, sp, #0x69
    bl func_020befec
    cmp r0, #0x1
    beq L_021fe168
    cmp r0, #0x2
    addeq r4, sp, #0x56
    b L_021fe16c
L_021fe168:
    add r4, sp, #0x40
L_021fe16c:
    ldr r0, [r6, #0x48]
    mov r5, #0x0
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    ble L_021fe22c
    cmp r0, #0x7
    bne L_021fe1dc
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xb8]
    cmp r1, #0x0
    moveq r1, #0x6
    streqh r1, [r0, #0xb8]
    moveq r1, #0xa
    streqh r1, [r0, #0xba]
    streqh r5, [r0, #0xb6]
    ldr r0, L_021fed68
    ldr r1, L_021fed6c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021fe310
    ldr r0, L_021fed68
    mov r1, #0x354
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r5, #0x1
    b L_021fe310
L_021fe1dc:
    cmp r0, #0x9
    cmpne r0, #0x8
    bne L_021fe310
    add r0, r6, #0x1c00
    mov r1, #0x0
    strh r1, [r0, #0xb8]
    strh r1, [r0, #0xba]
    strh r1, [r0, #0xb6]
    str r1, [r6, #0x448]
    str r1, [r6, #0x44c]
    add r0, r6, #0x1d00
    strh r1, [r0, #0x9c]
    ldr r0, [r6, #0x98]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x3
    beq L_021fe310
    mov r1, #0x3
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fe310
L_021fe22c:
    add r2, r6, #0x1c00
    ldrh r0, [r2, #0xc0]
    cmp r0, #0x0
    ldreqh r0, [r2, #0xb8]
    cmpeq r0, #0x0
    addeq r0, r6, #0x1d00
    ldreqh r0, [r0, #0x9c]
    cmpeq r0, #0x0
    bne L_021fe310
    ldrh r0, [r2, #0xb4]
    ldrb r0, [r4, r0]
    tst r0, #0x1
    beq L_021fe280
    mov r3, #0x1
    mov r0, r6
    mov r1, #0x5
    strh r3, [r2, #0xc0]
    bl func_ov039_021ff330
    add r0, r6, #0x1000
    mov r1, #0x2000
    str r1, [r0, #0xcc4]
L_021fe280:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xb4]
    ldrb r1, [r4, r1]
    tst r1, #0x2
    beq L_021fe2b4
    mov r1, #0x4
    strh r1, [r0, #0xb8]
    mov r1, #0x1e
    strh r1, [r0, #0xb6]
    ldrh r1, [r0, #0xb4]
    ldrb r1, [r4, r1]
    mov r1, r1, asr #0x4
    strh r1, [r0, #0xba]
L_021fe2b4:
    add r0, r6, #0x1c00
    ldrh r0, [r0, #0xb4]
    ldrb r0, [r4, r0]
    tst r0, #0x4
    addne r0, r6, #0x1d00
    movne r1, #0x1
    strneh r1, [r0, #0x9c]
    add r0, r6, #0x1c00
    ldrh r0, [r0, #0xb4]
    ldrb r0, [r4, r0]
    tst r0, #0x8
    addne r0, r6, #0x1d00
    movne r1, #0x8
    strneh r1, [r0, #0x9c]
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xb4]
    add r1, r1, #0x1
    strh r1, [r0, #0xb4]
    ldrh r1, [r0, #0xb4]
    ldrb r1, [r4, r1]
    cmp r1, #0xff
    moveq r1, #0x0
    streqh r1, [r0, #0xb4]
L_021fe310:
    mov r0, r6
    bl func_ov039_021fdb9c
    add r0, r6, #0x1000
    ldr r1, [r0, #0xca4]
    cmp r1, #0x0
    ble L_021fe340
    subs r1, r1, #0x1
    str r1, [r0, #0xca4]
    ldreq r1, [r6, #0x9c]
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x42]
L_021fe340:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xb8]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b L_021fe94c
L_021fe354: ; jump table
    b L_021fe370 ; case 0
    b L_021fe3b4 ; case 1
    b L_021fe448 ; case 2
    b L_021fe49c ; case 3
    b L_021fe904 ; case 4
    b L_021fe92c ; case 5
    b L_021fe380 ; case 6
L_021fe370:
    mov r1, #0x0
    strh r1, [r0, #0xb6]
    strh r1, [r0, #0xbc]
    b L_021fe94c
L_021fe380:
    ldrh r1, [r0, #0xb6]
    add r1, r1, #0x1
    strh r1, [r0, #0xb6]
    ldrh r1, [r0, #0xb6]
    cmp r1, #0x5a
    bls L_021fe94c
    mov r1, #0x1
    strh r1, [r0, #0xb8]
    mov r1, #0x0
    strh r1, [r0, #0xb6]
    mov r1, #0xa
    strh r1, [r0, #0xba]
    b L_021fe94c
L_021fe3b4:
    cmp r5, #0x0
    beq L_021fe3e8
    ldr r2, [r6, #0x9c]
    mov r1, #0x1
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r6, #0x9c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r6, #0x1000
    mov r1, #0x5a
    str r1, [r0, #0xca4]
L_021fe3e8:
    add r0, r6, #0x1c00
    ldrh r2, [r0, #0xb8]
    mov r1, #0x0
    add r2, r2, #0x1
    strh r2, [r0, #0xb8]
    strh r1, [r0, #0xb6]
    ldrh r0, [r0, #0xba]
    cmp r0, #0x0
    beq L_021fe94c
    ldr r0, [r6, #0x98]
    mov r1, #0x9
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r6, #0x98]
    ldr r0, L_021fed70
    ldr r4, [r1, #0xc]
    mov r1, #0x63
    ldrh r3, [r4, #0x24]
    mov r2, #0xd
    orr r3, r3, #0x2
    strh r3, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_021fe94c
L_021fe448:
    ldrh r1, [r0, #0xb6]
    add r1, r1, #0x1
    strh r1, [r0, #0xb6]
    ldrh r1, [r0, #0xb6]
    cmp r1, #0x14
    bls L_021fe94c
    ldrh r2, [r0, #0xb8]
    mov r1, #0x0
    add r2, r2, #0x1
    strh r2, [r0, #0xb8]
    strh r1, [r0, #0xb6]
    strh r1, [r0, #0xbc]
    ldrh r0, [r0, #0xba]
    cmp r0, #0x0
    beq L_021fe94c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_Play
    b L_021fe94c
L_021fe49c:
    ldr r1, [r6, #0x48]
    add r0, sp, #0x30
    ldr r1, [r1, #0x8]
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl VecFx32Object_InitCopy
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xba]
    ldr r3, [sp, #0x38]
    ldr r2, [sp, #0x3c]
    ldr r4, [sp, #0x34]
    sub r2, r3, r2
    cmp r1, #0xa
    sub r5, r2, #0x10000
    addls pc, pc, r1, lsl #0x2
    b L_021fe898
L_021fe4dc: ; jump table
    b L_021fe508 ; case 0
    b L_021fe528 ; case 1
    b L_021fe5d8 ; case 2
    b L_021fe648 ; case 3
    b L_021fe6b0 ; case 4
    b L_021fe770 ; case 5
    b L_021fe898 ; case 6
    b L_021fe898 ; case 7
    b L_021fe898 ; case 8
    b L_021fe898 ; case 9
    b L_021fe87c ; case 10
L_021fe508:
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0xf
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
    b L_021fe898
L_021fe528:
    ldrh r0, [r0, #0xbc]
    mov r1, #0xf
    bl func_020befec
    cmp r1, #0x0
    bne L_021fe5b4
    ldr r3, L_021fed74
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov039_021fd93c
    ldr r3, L_021fed78
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov039_021fd93c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_ov039_021fd93c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    ldr r3, L_021fed7c
    bl func_ov039_021fd93c
    mov r1, r4
    mov r2, r5
    mov r0, r6
    ldr r3, L_021fed80
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
L_021fe5b4:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x3c
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
    b L_021fe898
L_021fe5d8:
    ldrh r0, [r0, #0xbc]
    mov r1, #0x14
    bl func_020befec
    cmp r1, #0x0
    bne L_021fe624
    bl genrand_int32
    mov r1, #0x3e8
    bl func_020bf1f8
    mov r3, r1
    mov r0, r6
    mov r1, r4
    mov r2, r5
    sub r3, r3, #0x1f4
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
L_021fe624:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x28
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
    b L_021fe898
L_021fe648:
    ldrh r4, [r0, #0xbc]
    mov r1, #0xa
    mov r0, r4
    bl func_020befec
    cmp r1, #0x0
    bne L_021fe68c
    ldr r0, L_021fed84
    mov r1, #0x0
    mul r3, r4, r0
    mov r0, r6
    mov r2, r1
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
L_021fe68c:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x104
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
    b L_021fe898
L_021fe6b0:
    ldrh r7, [r0, #0xbc]
    mov r1, #0x12
    mov r0, r7
    bl func_020befec
    cmp r1, #0x0
    bne L_021fe74c
    mov r0, r7
    mov r1, #0x12
    bl func_020befec
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    bne L_021fe710
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
    b L_021fe74c
L_021fe710:
    ldr r3, L_021fed88
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov039_021fd93c
    ldr r3, L_021fed8c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
L_021fe74c:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x64
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
    b L_021fe898
L_021fe770:
    ldrh r0, [r0, #0xbc]
    mov r1, #0x28
    bl func_020befec
    cmp r1, #0x0
    bne L_021fe7ec
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, r1
    bl func_ov039_021fd93c
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0x4000
    bl func_ov039_021fd93c
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0x8000
    bl func_ov039_021fd93c
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0xc000
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
    b L_021fe858
L_021fe7ec:
    cmp r1, #0x14
    bne L_021fe858
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0x2000
    bl func_ov039_021fd93c
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0x6000
    bl func_ov039_021fd93c
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0xa000
    bl func_ov039_021fd93c
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, #0xe000
    bl func_ov039_021fd93c
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
L_021fe858:
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x104
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
    b L_021fe898
L_021fe87c:
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x5a
    movhi r1, #0x0
    strhih r1, [r0, #0xbc]
L_021fe898:
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xbc]
    cmp r1, #0x0
    bne L_021fe94c
    mov r1, #0x0
    strh r1, [r0, #0xb6]
    ldr r0, [r6, #0x98]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl func_0205940c
    add r0, r6, #0x1c00
    ldrh r1, [r0, #0xba]
    cmp r1, #0xa
    movne r1, #0x5
    strneh r1, [r0, #0xb8]
    moveq r1, #0x4
    streqh r1, [r0, #0xb8]
    moveq r1, #0x0
    streqh r1, [r0, #0xb6]
    b L_021fe94c
L_021fe904:
    ldrh r1, [r0, #0xb6]
    add r1, r1, #0x1
    strh r1, [r0, #0xb6]
    ldrh r1, [r0, #0xb6]
    cmp r1, #0x1e
    movhi r1, #0x0
    strhih r1, [r0, #0xb6]
    movhi r1, #0x1
    strhih r1, [r0, #0xb8]
    b L_021fe94c
L_021fe92c:
    ldrh r1, [r0, #0xb6]
    add r1, r1, #0x1
    strh r1, [r0, #0xb6]
    ldrh r1, [r0, #0xb6]
    cmp r1, #0x1e
    movhi r1, #0x0
    strhih r1, [r0, #0xb6]
    strhih r1, [r0, #0xb8]
L_021fe94c:
    add r1, r6, #0x1d00
    ldrh r0, [r1, #0x9c]
    cmp r0, #0x11
    addls pc, pc, r0, lsl #0x2
    b L_021fed48
L_021fe960: ; jump table
    b L_021fe9a8 ; case 0
    b L_021fe9cc ; case 1
    b L_021fea28 ; case 2
    b L_021fe9cc ; case 3
    b L_021fea28 ; case 4
    b L_021fea4c ; case 5
    b L_021fea9c ; case 6
    b L_021feb10 ; case 7
    b L_021fe9cc ; case 8
    b L_021fea28 ; case 9
    b L_021fe9cc ; case 10
    b L_021fea28 ; case 11
    b L_021feb4c ; case 12
    b L_021febf4 ; case 13
    b L_021fec14 ; case 14
    b L_021fec8c ; case 15
    b L_021fecdc ; case 16
    b L_021fed2c ; case 17
L_021fe9a8:
    mov r0, #0x0
    str r0, [r6, #0x448]
    str r0, [r6, #0x44c]
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    movgt r0, #0xe
    strgth r0, [r1, #0x9c]
    b L_021fed48
L_021fe9cc:
    add r0, sp, #0x20
    bl VecFx32Object_Init
    ldr r1, [r6, #0x74]
    add r0, sp, #0x20
    add r1, r1, #0x1c
    bl VecFx32Object_Assign
    ldr r0, [sp, #0x28]
    add r1, sp, #0x20
    add r2, r0, #0x46000
    add r0, r6, #0x118
    str r2, [sp, #0x28]
    bl func_ov069_0220fe2c
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    ldr r0, [r6, #0x448]
    add r0, r0, #0xcd
    str r0, [r6, #0x448]
    cmp r0, #0x1000
    addgt r0, r6, #0x1d00
    ldrgth r1, [r0, #0x9c]
    addgt r1, r1, #0x1
    strgth r1, [r0, #0x9c]
    b L_021fed48
L_021fea28:
    ldr r2, [r6, #0x448]
    ldr r0, L_021fed90
    sub r2, r2, #0xcd
    str r2, [r6, #0x448]
    cmp r2, r0
    ldrlth r0, [r1, #0x9c]
    addlt r0, r0, #0x1
    strlth r0, [r1, #0x9c]
    b L_021fed48
L_021fea4c:
    ldr r0, [r6, #0x48]
    ldr r3, [r6, #0x74]
    ldr r1, [r0, #0x8]
    add r0, r6, #0x118
    ldr r2, [r1, #0x48]
    add r1, r3, #0x1c
    add r2, r2, #0x2c
    bl func_ov069_0220fe3c
    mov r1, #0x0
    ldr r0, L_021fed70
    str r1, [r6, #0x44c]
    ldr r0, [r0, #0x0]
    mov r1, #0x63
    mov r2, #0x8
    bl func_0205940c
    add r0, r6, #0x1d00
    ldrh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
    b L_021fed48
L_021fea9c:
    ldr r0, [r6, #0x48]
    ldr r3, [r6, #0x74]
    ldr r1, [r0, #0x8]
    add r0, r6, #0x118
    ldr r2, [r1, #0x48]
    add r1, r3, #0x1c
    add r2, r2, #0x2c
    bl func_ov069_0220fe3c
    add r0, r6, #0x28
    add r1, r6, #0x38
    add r0, r0, #0x400
    add r1, r1, #0x400
    bl VecFx32Object_Add
    ldr r0, [r6, #0x448]
    add r0, r0, #0x33
    add r0, r0, #0x300
    str r0, [r6, #0x448]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r6, #0x448]
    ldr r0, [r6, #0x44c]
    add r0, r0, #0x1
    str r0, [r6, #0x44c]
    cmp r0, #0x18
    addgt r0, r6, #0x1d00
    ldrgth r1, [r0, #0x9c]
    addgt r1, r1, #0x1
    strgth r1, [r0, #0x9c]
    b L_021fed48
L_021feb10:
    ldr r0, [r6, #0x448]
    subs r0, r0, #0x118
    str r0, [r6, #0x448]
    bpl L_021fed48
    mov r1, #0x0
    ldr r0, L_021fed70
    str r1, [r6, #0x448]
    ldr r0, [r0, #0x0]
    mov r1, #0x63
    mov r2, #0x8
    bl Sound_Play
    add r0, r6, #0x1d00
    mov r1, #0x0
    strh r1, [r0, #0x9c]
    b L_021fed48
L_021feb4c:
    add r0, sp, #0x10
    bl VecFx32Object_Init
    ldr r1, [r6, #0x74]
    add r0, sp, #0x10
    add r1, r1, #0x1c
    bl VecFx32Object_Assign
    ldr r1, [sp, #0x18]
    add r0, r6, #0x54
    add r3, r1, #0x39000
    add r1, sp, #0x10
    add r0, r0, #0x400
    mov r2, #0x4000
    str r3, [sp, #0x18]
    bl func_ov049_0220c6cc
    ldr r1, [sp, #0x14]
    add r0, r6, #0x54
    add r2, r1, #0x19000
    str r2, [sp, #0x14]
    add r1, sp, #0x10
    add r0, r0, #0x400
    mov r2, #0x0
    bl func_ov049_0220c6cc
    ldr r1, [sp, #0x14]
    add r0, r6, #0x54
    sub r1, r1, #0x32000
    str r1, [sp, #0x14]
    add r0, r0, #0x400
    add r1, sp, #0x10
    mov r2, #0x8000
    bl func_ov049_0220c6cc
    ldr r0, L_021fed70
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl Sound_Play
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, r6, #0x1d00
    ldrh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
    b L_021fed48
L_021febf4:
    ldr r0, [r6, #0x448]
    add r0, r0, #0x148
    str r0, [r6, #0x448]
    cmp r0, #0x0
    movgt r0, #0x0
    strgt r0, [r6, #0x448]
    strgth r0, [r1, #0x9c]
    b L_021fed48
L_021fec14:
    add r0, sp, #0x0
    bl VecFx32Object_Init
    ldr r1, [r6, #0x74]
    add r0, sp, #0x0
    add r1, r1, #0x1c
    bl VecFx32Object_Assign
    ldr r0, [sp, #0x8]
    add r1, sp, #0x0
    add r0, r0, #0x46000
    str r0, [sp, #0x8]
    add r0, r6, #0x118
    bl func_ov069_0220fe2c
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    addeq r0, r6, #0x1d00
    moveq r1, #0x0
    streqh r1, [r0, #0x9c]
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r1, [r6, #0x448]
    ldr r0, L_021fed94
    add r1, r1, #0xa4
    cmp r1, r0
    addgt r0, r6, #0x1d00
    str r1, [r6, #0x448]
    ldrgth r1, [r0, #0x9c]
    addgt r1, r1, #0x1
    strgth r1, [r0, #0x9c]
    b L_021fed48
L_021fec8c:
    ldr r2, [r6, #0x448]
    ldr r0, L_021fed98
    sub r2, r2, #0xa4
    str r2, [r6, #0x448]
    cmp r2, r0
    bge L_021fed48
    ldr r0, [r6, #0x44c]
    add r0, r0, #0x1
    str r0, [r6, #0x44c]
    cmp r0, #0x3
    ldrlth r0, [r1, #0x9c]
    sublt r0, r0, #0x1
    strlth r0, [r1, #0x9c]
    blt L_021fed48
    ldrh r2, [r1, #0x9c]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x9c]
    str r0, [r6, #0x44c]
    b L_021fed48
L_021fecdc:
    ldr r2, [r6, #0x448]
    ldr r0, L_021fed9c
    sub r2, r2, #0x33
    sub r2, r2, #0x300
    str r2, [r6, #0x448]
    cmp r2, r0
    bge L_021fed48
    mov r0, r0, asr #0x1
    str r0, [r6, #0x448]
    ldr r0, [r6, #0x44c]
    add r0, r0, #0x1
    str r0, [r6, #0x44c]
    cmp r0, #0xc
    ble L_021fed48
    ldrh r2, [r1, #0x9c]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x9c]
    str r0, [r6, #0x44c]
    b L_021fed48
L_021fed2c:
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    movne r0, #0xe
    strneh r0, [r1, #0x9c]
    moveq r0, #0x0
    streqh r0, [r1, #0x9c]
L_021fed48:
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fed50: .word data_ov039_02207fee
L_021fed54: .word data_ov039_02207ff8
L_021fed58: .word data_ov039_02208003
L_021fed5c: .word data_ov039_02208040
L_021fed60: .word data_ov039_02208050
L_021fed64: .word data_ov039_02208063
L_021fed68: .word gGameWork
L_021fed6c: .word 0x14d
L_021fed70: .word gSoundContext
L_021fed74: .word 0xffffee08
L_021fed78: .word 0xfffff704
L_021fed7c: .word 0x8fc
L_021fed80: .word 0x11f8
L_021fed84: .word 0x19a
L_021fed88: .word 0xfffff254
L_021fed8c: .word 0xdac
L_021fed90: .word 0xfffff4cd
L_021fed94: .word 0xe66
L_021fed98: .word 0xfffffccd
L_021fed9c: .word 0xffffeccd
    .size func_ov039_021fe05c, .-func_ov039_021fe05c

