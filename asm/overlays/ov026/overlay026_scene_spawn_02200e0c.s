.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_spawn.c. */
.extern data_020c9670
.extern data_ov026_02204acc
.extern GraphicsAnimationInstanceManager_CreateInstance
.extern func_0209189c
.extern TitleRandom_NextBounded
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern PresentationScalar_TransitionBy
.extern Presentation_SetPosition
.extern PresentationList_Append
.extern AlternateSpritePresentation_Init
.extern AlternateSpritePresentation_SyncTransform
.extern func_ov026_021fe5c0
.extern func_ov026_021ff830
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_02200e0c
func_ov026_02200e0c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0x6c]
    mov r6, r1
    add r1, r4, #0x94
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r5, r0
    ldr r1, L_02200fdc
    ldr r3, L_02200fe0
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_02200e54
    mov r1, r5
    bl AlternateSpritePresentation_Init
    mov r9, r0
L_02200e54:
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    mov r1, #0x0
    mov r7, r0, lsl #0x14
    str r1, [sp, #0x0]
    mov r8, #0x14
    mov r0, r5
    mov r2, r1
    mov r3, r1
    str r8, [sp, #0x4]
    mov r8, #0x42
    str r8, [sp, #0x8]
    mov r7, r7, lsr #0x10
    bl func_ov026_021ff830
    mov r0, r7, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r7, r0, lsl #0x1
    mov r1, r1, lsl #0x1
    mov r2, r6
    mov r0, #0x8000
    str r0, [r5, #0x44]
    ldr r3, L_02200fe4
    mov r0, r9
    ldrsh r8, [r3, r7]
    ldrsh r7, [r3, r1]
    mov ip, #0x0
    mov r6, r8, asr #0x1f
    mov r5, r7, asr #0x1f
    ldr r3, L_02200fe8
    umull r1, r10, r7, r3
    adds r1, r1, #0x800
    mov r1, r1, lsr #0xc
    mla r10, r7, ip, r10
    mla r10, r5, r3, r10
    adc r10, r10, #0x0
    orr r1, r1, r10, lsl #0x14
    umull r10, lr, r8, r3
    mla lr, r8, ip, lr
    mla lr, r6, r3, lr
    adds r3, r10, #0x800
    adc r10, lr, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r10, lsl #0x14
    bl Presentation_SetPosition
    add r0, r9, #0x6c
    ldr r1, L_02200fec
    bl PresentationScalar_SetImmediate
    mov r0, r9
    bl AlternateSpritePresentation_SyncTransform
    mov r1, #0x1
    str r1, [r9, #0x88]
    add r0, r9, #0xc
    mov r3, #0x0
    mov r2, #0xcd
    umull lr, ip, r7, r2
    mla ip, r7, r3, ip
    mla ip, r5, r2, ip
    adds r2, lr, #0x800
    adc r3, ip, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    bl PresentationScalar_TransitionBy
    add r0, r9, #0x2c
    mov r1, #0x1
    mov r3, #0x0
    mov r2, #0xcd
    umull r7, r5, r8, r2
    mla r5, r8, r3, r5
    mla r5, r6, r2, r5
    adds r2, r7, #0x800
    adc r3, r5, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    bl PresentationScalar_TransitionBy
    add r0, r9, #0x1c
    mov r1, #0x5
    sub r2, r1, #0x338
    bl PresentationScalar_TransitionBy
    add r0, r9, #0x6c
    mov r1, #0x3
    ldr r2, L_02200ff0
    bl PresentationScalar_TransitionTo
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x1e
    mov r2, #0x32
    bl func_0209189c
    mov r1, r0
    mov r0, r9
    bl func_ov026_021fe5c0
    mov r1, r9
    add r0, r4, #0x304
    bl PresentationList_Append
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_02200fdc: .word data_ov026_02204acc
L_02200fe0: .word gHeapContext
L_02200fe4: .word data_020c9670
L_02200fe8: .word 0x333
L_02200fec: .word 0x19a
L_02200ff0: .word 0x666
.size func_ov026_02200e0c, .-func_ov026_02200e0c

