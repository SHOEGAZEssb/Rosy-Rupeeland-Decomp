.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect_update.c for documented portable C. */

    .extern Presentation_AdvanceTransitions
    .extern func_0209189c
    .extern PresentationScalar_SetImmediate
    .extern Heap_Alloc
    .extern func_ov036_021fd2a4
    .extern Presentation_SetPosition
    .extern TitleRandom_NextBounded
    .extern PresentationList_Append
    .extern func_ov036_021fe978
    .extern Presentation_InterpolateScalar
    .extern func_ov036_021fe968
    .extern Sound_Play
    .extern PresentationScalar_TransitionBy
    .extern PresentationList_UpdateAndDeleteCompleted
    .extern data_ov036_02206148
    .extern gHeapContext
    .extern gFx32CosSinTable
    .extern gSoundContext

    .global func_ov036_021fe3c0
func_ov036_021fe3c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r9, r0
    ldr r1, [r9, #0xac]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b L_021fe93c
L_021fe3dc: ; jump table
    b L_021fe3f8 ; case 0
    b L_021fe400 ; case 1
    b L_021fe55c ; case 2
    b L_021fe588 ; case 3
    b L_021fe800 ; case 4
    b L_021fe8c4 ; case 5
    b L_021fe934 ; case 6
L_021fe3f8:
    add r0, r1, #0x1
    str r0, [r9, #0xac]
L_021fe400:
    mov r0, r9
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_021fe430
    mov r0, #0x1e
    str r0, [r9, #0x7c]
    mov r0, #0x0
    str r0, [r9, #0x80]
    ldr r0, [r9, #0xac]
    add r0, r0, #0x1
    str r0, [r9, #0xac]
    b L_021fe93c
L_021fe430:
    ldr r0, [r9, #0x80]
    tst r0, #0x1
    beq L_021fe93c
    add r0, r9, #0xc8
    ldr r4, [r9, #0x10]
    mvn r1, #0xf
    mov r2, #0x10
    bl func_0209189c
    mov r1, r0
    add r0, r9, #0xc
    add r1, r4, r1
    bl PresentationScalar_SetImmediate
    add r0, r9, #0xc8
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r4, r0
    add r0, r9, #0xc8
    mov r1, #0x0
    mov r2, r4
    bl func_0209189c
    add r1, r4, r4, lsr #0x1f
    mov r1, r1, asr #0x1
    orr r1, r4, r1, lsl #0x5
    orr r0, r1, r0, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    ldr r1, L_021fe950
    ldr r3, L_021fe954
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_021fe4d8
    str r4, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r3, r4
    mov r2, #0x14
    str r1, [sp, #0x8]
    bl func_ov036_021fd2a4
    mov r5, r0
L_021fe4d8:
    add r0, r9, #0xc8
    ldr r4, [r9, #0x10]
    mvn r1, #0xf
    mov r2, #0x10
    bl func_0209189c
    mov r1, r0
    ldr r2, [r9, #0x20]
    mov r0, r5
    add r1, r4, r1
    mov r3, #0x0
    bl Presentation_SetPosition
    mov r1, #0x1000
    add r0, r9, #0xc8
    rsb r1, r1, #0x0
    mov r2, #0x0
    bl func_0209189c
    mov r1, #0x0
    str r1, [r5, #0xa4]
    str r0, [r5, #0xa8]
    add r0, r9, #0xc8
    str r1, [r5, #0xac]
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    mov r1, r0, lsl #0x4
    add r0, r5, #0x5c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    ldr r1, L_021fe958
    bl PresentationScalar_SetImmediate
    mov r1, r5
    add r0, r9, #0x9c
    bl PresentationList_Append
    b L_021fe93c
L_021fe55c:
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_021fe93c
    mov r0, #0x4
    str r0, [r9, #0x7c]
    mov r0, #0x0
    str r0, [r9, #0x80]
    ldr r0, [r9, #0xac]
    add r0, r0, #0x1
    str r0, [r9, #0xac]
    b L_021fe93c
L_021fe588:
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_021fe5f0
    ldr r0, [r9, #0xcc]
    cmp r0, #0x0
    beq L_021fe5d0
    ldr r1, [r9, #0x10]
    ldr r2, [r9, #0x20]
    ldr r3, [r9, #0x30]
    bl func_ov036_021fe978
    ldr r2, [r9, #0xcc]
    mov r0, #0x0
    ldrh r1, [r2, #0x50]
    bic r1, r1, #0x4
    strh r1, [r2, #0x50]
    ldr r1, [r9, #0xcc]
    str r0, [r1, #0x38]
    str r0, [r1, #0x34]
L_021fe5d0:
    mov r0, #0x1e
    str r0, [r9, #0x7c]
    mov r0, #0x0
    str r0, [r9, #0x80]
    ldr r0, [r9, #0xac]
    add r0, r0, #0x1
    str r0, [r9, #0xac]
    b L_021fe93c
L_021fe5f0:
    add r0, r9, #0xc8
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    mov r0, r9
    mov r1, #0x1
    mov r2, #0xc000
    mov r3, #0x2000
    bl Presentation_InterpolateScalar
    mov r8, r0
    mov r0, r9
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x1e
    bl Presentation_InterpolateScalar
    str r0, [sp, #0x18]
    ldr r2, [r9, #0xb0]
    ldr r3, [r9, #0xbc]
    mov r0, r9
    mov r1, #0x1
    bl Presentation_InterpolateScalar
    mov r6, r0
    ldr r2, [r9, #0xb4]
    ldr r3, [r9, #0xc0]
    mov r0, r9
    mov r1, #0x1
    bl Presentation_InterpolateScalar
    mov r5, r0
    ldr r2, [r9, #0xb8]
    ldr r3, [r9, #0xc4]
    mov r0, r9
    mov r1, #0x1
    bl Presentation_InterpolateScalar
    mov r4, r0
    mov r0, r9
    mov r1, #0x1
    mov r2, #0x1800
    mov r3, #0x1000
    bl Presentation_InterpolateScalar
    str r0, [sp, #0x14]
    orr r0, r6, r5, lsl #0x5
    orr r0, r0, r4, lsl #0xa
    add r1, r4, r4, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r3, r5, r5, lsr #0x1f
    str r0, [sp, #0x10]
    mov r0, r3, asr #0x1
    add r2, r6, r6, lsr #0x1f
    mov r0, r0, lsl #0x5
    mov r1, r1, asr #0x1
    orr r0, r0, r2, asr #0x1
    orr r0, r0, r1, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0xc]
    mov r4, #0x0
    mov r7, r8, asr #0x1f
L_021fe6d4:
    ldr r1, L_021fe950
    ldr r3, L_021fe954
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq L_021fe72c
    ldr r1, [sp, #0xc]
    mov r2, r4, lsl #0x1f
    str r1, [sp, #0x0]
    ldr r1, [sp, #0x18]
    add r1, r1, r2, lsr #0x1d
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [sp, #0x4]
    ldr r1, L_021fe95c
    mov r2, #0x19
    str r1, [sp, #0x8]
    ldr r3, [sp, #0x10]
    mov r1, #0x2
    bl func_ov036_021fd2a4
    mov r6, r0
L_021fe72c:
    mov r1, r4, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r5, r0, lsr #0x10
    ldr r1, [r9, #0x10]
    ldr r2, [r9, #0x20]
    mov r0, r6
    mov r3, #0x0
    bl Presentation_SetPosition
    mov r0, r5, asr #0x4
    mov r3, r0, lsl #0x1
    ldr r1, L_021fe960
    mov r2, r3, lsl #0x1
    ldrsh ip, [r1, r2]
    add r1, r1, r3, lsl #0x1
    ldrsh r2, [r1, #0x2]
    mov r1, ip, asr #0x1f
    umull r10, lr, r8, ip
    mla lr, r8, r1, lr
    adds r1, r10, #0x800
    mov r3, #0x0
    mla lr, r7, ip, lr
    mov r10, r3
    mov r11, r2, asr #0x1f
    adc r10, lr, r10
    mov r1, r1, lsr #0xc
    orr r1, r1, r10, lsl #0x14
    umull ip, r10, r8, r2
    mla r10, r8, r11, r10
    mla r10, r7, r2, r10
    adds r11, ip, #0x800
    mov r2, r3
    adc r10, r10, r2
    mov r2, r11, lsr #0xc
    mov r0, r6
    orr r2, r2, r10, lsl #0x14
    bl func_ov036_021fe968
    rsb r0, r5, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    add r0, r6, #0x5c
    bl PresentationScalar_SetImmediate
    ldr r1, [sp, #0x14]
    add r0, r6, #0x6c
    bl PresentationScalar_SetImmediate
    mov r1, r6
    add r0, r9, #0x9c
    bl PresentationList_Append
    add r4, r4, #0x1
    cmp r4, #0x10
    blt L_021fe6d4
    b L_021fe93c
L_021fe800:
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_021fe88c
    ldr r0, [r9, #0xd0]
    mov r1, #0x1cc
    cmp r0, #0x0
    bne L_021fe830
    ldr r0, L_021fe964
    mov r2, #0x2
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_021fe85c
L_021fe830:
    cmp r0, #0x1
    bne L_021fe84c
    ldr r0, L_021fe964
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_021fe85c
L_021fe84c:
    ldr r0, L_021fe964
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_Play
L_021fe85c:
    add r0, r9, #0x1c
    mov r1, #0x5
    mvn r2, #0xff
    bl PresentationScalar_TransitionBy
    mov r0, #0x10
    str r0, [r9, #0x7c]
    mov r0, #0x0
    str r0, [r9, #0x80]
    ldr r0, [r9, #0xac]
    add r0, r0, #0x1
    str r0, [r9, #0xac]
    b L_021fe93c
L_021fe88c:
    ldr r2, [r9, #0xcc]
    cmp r2, #0x0
    beq L_021fe93c
    ldr r1, [r9, #0x20]
    mov r0, r9
    str r1, [r2, #0x24]
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x1800
    bl Presentation_InterpolateScalar
    ldr r1, [r9, #0xcc]
    str r0, [r1, #0x38]
    str r0, [r1, #0x34]
    b L_021fe93c
L_021fe8c4:
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq L_021fe900
    ldr r0, [r9, #0xa8]
    cmp r0, #0x0
    bne L_021fe900
    ldr r1, [r9, #0xcc]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x50]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x50]
    ldr r0, [r9, #0xac]
    add r0, r0, #0x1
    str r0, [r9, #0xac]
    b L_021fe93c
L_021fe900:
    ldr r4, [r9, #0xcc]
    cmp r4, #0x0
    beq L_021fe93c
    ldr r2, [r9, #0x20]
    mov r1, #0x1
    mov r0, r9
    mov r3, r1
    str r2, [r4, #0x24]
    mov r2, #0x1f
    bl Presentation_InterpolateScalar
    ldr r1, [r9, #0xcc]
    strb r0, [r1, #0x5b]
    b L_021fe93c
L_021fe934:
    mov r0, #0x1
    b L_021fe948
L_021fe93c:
    add r0, r9, #0x9c
    bl PresentationList_UpdateAndDeleteCompleted
    mov r0, #0x0
L_021fe948:
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe950: .word data_ov036_02206148
L_021fe954: .word gHeapContext
L_021fe958: .word 0x333
L_021fe95c: .word 0xfffffe66
L_021fe960: .word gFx32CosSinTable
L_021fe964: .word gSoundContext
    .size func_ov036_021fe3c0, .-func_ov036_021fe3c0

