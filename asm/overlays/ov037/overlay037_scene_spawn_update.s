.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_spawn_update.c for documented portable C. */

    .extern func_02091c7c
    .extern TitleRandom_NextBounded
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern Heap_Alloc
    .extern AlternateSpritePresentation_Init
    .extern func_0209189c
    .extern Presentation_SetPosition
    .extern PresentationScalar_SetImmediate
    .extern PresentationScalar_TransitionTo
    .extern GraphicsAnimationInstance_GetSequenceDuration
    .extern func_ov037_021fdf50
    .extern PresentationList_Append
    .extern func_02091b98
    .extern GraphicsAnimationInstance_SetAnimation
    .extern PresentationScalar_TransitionBy
    .extern data_ov037_021feeb0
    .extern gHeapContext

    .global func_ov037_021fdd08
func_ov037_021fdd08:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    add r0, r6, #0x1a8
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fde34
    add r0, r6, #0xbc
    mov r1, #0x2
    bl TitleRandom_NextBounded
    cmp r0, #0x0
    ldr r0, [r6, #0x114]
    beq L_021fdd48
    add r1, r6, #0xec
    bl GraphicsAnimationInstanceManager_CreateInstance
    b L_021fdd50
L_021fdd48:
    add r1, r6, #0xf8
    bl GraphicsAnimationInstanceManager_CreateInstance
L_021fdd50:
    mov r7, r0
    ldrh r0, [r7, #0x50]
    ldr r1, L_021fdf48
    ldr r3, L_021fdf4c
    orr r4, r0, #0x40
    mov r0, #0xa0
    mov r2, #0x4
    strh r4, [r7, #0x50]
    bl Heap_Alloc
    movs r5, r0
    beq L_021fdd88
    mov r1, r7
    bl AlternateSpritePresentation_Init
    mov r5, r0
L_021fdd88:
    mov r1, #0x800
    add r0, r6, #0xbc
    rsb r1, r1, #0x0
    mov r2, #0x800
    bl func_0209189c
    mov r4, r0
    add r0, r6, #0xbc
    mov r1, #0x80
    mov r2, #0x100
    bl func_0209189c
    mov r3, r0
    mov r1, r4
    mov r0, r5
    mov r2, #0x1200
    bl Presentation_SetPosition
    add r0, r6, #0xbc
    mov r1, #0x1000
    mov r2, #0x2000
    bl func_0209189c
    mov r1, r0
    add r0, r5, #0x6c
    bl PresentationScalar_SetImmediate
    add r0, r6, #0xbc
    mov r1, #0x800
    mov r2, #0xc00
    bl func_0209189c
    mov r2, r0
    add r0, r5, #0x1c
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    mov r0, r7
    bl GraphicsAnimationInstance_GetSequenceDuration
    mov r1, r0
    mov r0, r5
    bl func_ov037_021fdf50
    mov r0, #0x1
    str r0, [r5, #0x88]
    mov r1, r5
    add r0, r6, #0x12c
    bl PresentationList_Append
    add r0, r6, #0x1a8
    mov r1, #0x2
    bl func_02091b98
L_021fde34:
    add r0, r6, #0x1c4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x114]
    add r1, r6, #0x104
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    add r0, r6, #0xbc
    mov r1, #0x5
    mov r2, #0xa
    bl func_0209189c
    mov r1, r0
    mov r0, r4
    and r1, r1, #0xff
    bl GraphicsAnimationInstance_SetAnimation
    mov r0, #0x6
    strb r0, [r4, #0x5a]
    mov r0, #0x18
    strb r0, [r4, #0x5b]
    ldrh r2, [r4, #0x50]
    ldr r1, L_021fdf48
    ldr r3, L_021fdf4c
    orr r2, r2, #0x40
    strh r2, [r4, #0x50]
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_021fdebc
    mov r1, r4
    bl AlternateSpritePresentation_Init
    mov r5, r0
L_021fdebc:
    mov r1, #0x200
    add r0, r6, #0xbc
    rsb r1, r1, #0x0
    mov r2, #0x200
    bl func_0209189c
    ldr r2, [r6, #0x118]
    mov r4, r0
    ldr r1, [r2, #0x10]
    ldr r3, [r2, #0x30]
    ldr r2, [r2, #0x20]
    mov r0, r5
    add r1, r4, r1
    add r3, r3, #0x10
    bl Presentation_SetPosition
    mov r2, r4
    add r0, r5, #0xc
    mov r1, #0x1
    bl PresentationScalar_TransitionBy
    add r0, r5, #0x1c
    mov r1, #0x1
    mov r2, #0x400
    bl PresentationScalar_TransitionBy
    mov r0, #0x3c
    str r0, [r5, #0x7c]
    mov r0, #0x0
    str r0, [r5, #0x80]
    mov r0, #0x1
    str r0, [r5, #0x88]
    mov r1, r5
    add r0, r6, #0x12c
    bl PresentationList_Append
    add r0, r6, #0x1c4
    mov r1, #0x8
    bl func_02091b98
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fdf48: .word data_ov037_021feeb0
L_021fdf4c: .word gHeapContext
    .size func_ov037_021fdd08, .-func_ov037_021fdd08
