    .text
/* Exact fallback; see src/overlays/ov018/overlay018_result_sequence.c. */
    .extern Heap_Alloc
    .extern data_020c9670
    .extern data_ov018_021ffbf0
    .extern data_ov018_021ffbf8
    .extern data_ov018_021ffd68
    .extern func_02059344
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern TitleRandom_NextBounded
    .extern func_02091b98
    .extern func_02091bac
    .extern func_02091c7c
    .extern func_02091cf0
    .extern func_020922f0
    .extern func_02092c8c
    .extern TitleDialog_ClearTextRect
    .extern PresentationList_Append
    .extern SpritePresentation_Show
    .extern func_020afd0c
    .extern func_020befec
    .extern func_ov003_021fb7ec
    .extern func_ov018_021fce00
    .extern func_ov018_021fcf40
    .extern func_ov018_021fd788
    .extern func_ov018_021fda10
    .extern func_ov018_021fda60
    .extern func_ov018_021fe19c
    .extern func_ov018_021fe1d8
    .extern func_ov018_021fe46c
    .extern func_ov018_021fe644
    .extern func_ov018_021ff3cc
    .extern gDebugFont
    .extern gHeapContext
    .extern gSoundContext
    .extern genrand_int32

.global func_ov018_021fea1c
func_ov018_021fea1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r2, #0x0
    str r2, [r4, #0x414]
    ldr r1, [r4, #0x4]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b L_021feef4
L_021fea40: ; jump table
    b L_021fea6c ; case 0
    b L_021feaa4 ; case 1
    b L_021feb68 ; case 2
    b L_021febbc ; case 3
    b L_021fed40 ; case 4
    b L_021fedb8 ; case 5
    b L_021fedf8 ; case 6
    b L_021fee78 ; case 7
    b L_021feef4 ; case 8
    b L_021feef4 ; case 9
    b L_021feecc ; case 10
L_021fea6c:
    mov r1, #0x8f
    bl func_020922f0
    mov r0, #0x14
    str r0, [sp, #0x0]
    add r0, r4, #0x1a8
    mov r1, #0x1
    mov r2, #0x10
    mov r3, #0x0
    bl func_02091bac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021feaa4:
    ldr r2, [r4, #0x1b8]
    add r0, r4, #0x1a8
    mov r1, #0x1
    rsb r5, r2, #0x10
    bl func_02091c7c
    orr r2, r0, r5, lsl #0x8
    ldr r1, L_021fef08
    add r0, r4, #0x1a8
    strh r2, [r1, #0x0]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021feef4
    ldr r0, [r4, #0x190]
    bl func_ov003_021fb7ec
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff3cc
    mov r5, #0x0
    ldr r1, L_021fef0c
    ldr r3, L_021fef10
    mov r0, #0xac
    mov r2, #0x4
    str r5, [r4, #0x3c8]
    bl Heap_Alloc
    movs r6, r0
    beq L_021feb40
    ldr r1, [r4, #0x194]
    mov r0, r4
    bl func_ov018_021fe19c
    mov r5, r0
    ldr r1, [r4, #0x194]
    mov r0, r4
    bl func_ov018_021fe1d8
    str r0, [sp, #0x0]
    ldr r1, [r4, #0xcc]
    ldr r2, [r4, #0x194]
    mov r0, r6
    mov r3, r5
    bl func_ov018_021fce00
    mov r6, r0
L_021feb40:
    mov r1, r6
    str r6, [r4, #0x1c4]
    add r0, r4, #0x3cc
    bl PresentationList_Append
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feef4
L_021feb68:
    mov r5, #0x3c
    add r0, r4, #0x1a8
    mov r1, #0x1
    mov r3, #0x10
    str r5, [sp, #0x0]
    bl func_02091bac
    mov r2, #0x10
    mov r1, #0x0
    ldr r0, L_021fef14
    mov r3, r1
    str r2, [sp, #0x0]
    mov r2, #0x24
    bl func_020afd0c
    ldr r0, [r4, #0x1c4]
    bl SpritePresentation_Show
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feef4
L_021febbc:
    add r0, r4, #0x1a8
    mov r1, #0x1
    bl func_02091c7c
    orr r2, r0, #0x1000
    ldr r1, L_021fef08
    add r0, r4, #0x1a8
    strh r2, [r1, #0x0]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fec20
    mov r5, #0x3c
    add r0, r4, #0x1a8
    mov r1, #0x1
    mov r2, #0x10
    mov r3, #0x0
    str r5, [sp, #0x0]
    bl func_02091bac
    mov r0, r4
    bl func_ov018_021fe46c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feef4
L_021fec20:
    ldr r1, [r4, #0x194]
    mov r9, #0x0
    ldrsh r3, [r1, #0x10]
    ldrsh r0, [r1, #0x14]
    ldrsh r2, [r1, #0x12]
    ldrsh r1, [r1, #0x16]
    sub r5, r0, r3
    add r0, r5, r5, lsr #0x1f
    sub r6, r1, r2
    add r1, r6, r6, lsr #0x1f
    add r7, r3, r0, asr #0x1
    add r8, r2, r1, asr #0x1
L_021fec50:
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r10, r0, lsl #0x1
    ldr r1, [r4, #0x194]
    mov r0, r4
    bl func_ov018_021fe19c
    mov r11, r0
    add r0, r9, #0x2
    mul r0, r5, r0
    mov r1, #0x5
    bl func_020befec
    ldr r1, L_021fef18
    mov r3, r10, lsl #0x1
    ldrsh r3, [r1, r3]
    add r2, r7, r11
    ldr r1, [r4, #0x194]
    mul r3, r0, r3
    mov r0, r3, asr #0xb
    add r0, r3, r0, lsr #0x14
    add r0, r2, r0, asr #0xc
    str r0, [sp, #0xc]
    mov r0, r4
    bl func_ov018_021fe1d8
    mov r11, r0
    add r0, r9, #0x2
    mul r0, r6, r0
    mov r1, #0x5
    bl func_020befec
    ldr r1, L_021fef18
    add r3, r8, r11
    add r1, r1, r10, lsl #0x1
    ldrsh r10, [r1, #0x2]
    add r1, r4, #0xac
    mov r2, #0x1
    mul r10, r0, r10
    mov r0, r10, asr #0xb
    add r0, r10, r0, lsr #0x14
    add r10, r3, r0, asr #0xc
    ldr r0, [r4, #0xcc]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r11, r0
    add r0, r4, #0x3dc
    mov r1, #0x4
    bl TitleRandom_NextBounded
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x100
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r2, [sp, #0xc]
    mov r3, r10
    mov r0, r11
    bl func_02073e48
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_021fec50
    b L_021feef4
L_021fed40:
    add r0, r4, #0x1a8
    mov r1, #0x1
    bl func_02091c7c
    mov r0, r0, lsl #0x8
    ldr r1, L_021fef08
    orr r2, r0, #0x10
    add r0, r4, #0x1a8
    strh r2, [r1, #0x0]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021feef4
    ldr r0, [r4, #0x1c4]
    mov r5, #0x0
    ldr r1, [r0, #0x9c]
    ldr r0, L_021fef14
    strh r5, [r1, #0x2a]
    mov r1, #0x1
    mov r2, #0x3e
    mov r3, #0x10
    str r5, [sp, #0x0]
    bl func_020afd0c
    add r0, r4, #0x1a8
    mov r1, #0x78
    bl func_02091b98
    ldr r1, [r4, #0x4]
    mov r0, r5
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feef4
L_021fedb8:
    ldr r0, L_021fef1c
    mov r1, #0x8f
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    bne L_021feef4
    ldr r2, [r4, #0xd4]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feef4
L_021fedf8:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021feef4
    str r2, [r4, #0x408]
    str r2, [r4, #0x404]
    ldr r2, [r4, #0xd4]
    ldr r0, L_021fef20
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x54]
    cmp r0, #0x1
    movne r0, #0xa
    strne r0, [r4, #0x4]
    movne r0, #0x0
    strne r0, [r4, #0x8]
    bne L_021feef4
    mov r0, #0x2
    sub r1, r0, #0xa
    bl func_02092c8c
    mov r0, r4
    mov r1, #0x1ec
    bl func_ov018_021fda10
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021feef4
L_021fee78:
    bl func_ov018_021fda60
    cmp r0, #0x0
    beq L_021feef4
    ldr r0, [r4, #0x418]
    bl TitleDialog_ClearTextRect
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, [r4, #0x418]
    cmp r0, #0x0
    beq L_021feeb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feeb0:
    mov r0, #0x0
    ldr r1, L_021fef24
    str r0, [r4, #0x418]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
    b L_021feef4
L_021feecc:
    ldr r1, [r4, #0x8]
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    cmp r1, #0x14
    ble L_021feef4
    bl func_ov018_021fe644
    ldr r1, L_021fef28
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
L_021feef4:
    mov r0, r4
    bl func_ov018_021fd788
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fef08: .word 0x4001052
L_021fef0c: .word data_ov018_021ffd68
L_021fef10: .word gHeapContext
L_021fef14: .word 0x4001050
L_021fef18: .word data_020c9670
L_021fef1c: .word gSoundContext
L_021fef20: .word gDebugFont
L_021fef24: .word data_ov018_021ffbf8
L_021fef28: .word data_ov018_021ffbf0
    .size func_ov018_021fea1c, . - func_ov018_021fea1c
