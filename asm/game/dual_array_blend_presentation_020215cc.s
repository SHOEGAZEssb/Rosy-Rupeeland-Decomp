; Matching retail form; see src/game/dual_array_blend_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Free
.extern __construct_array
.extern __destroy_arr
.extern data_020c36c4
.extern data_020d63d0
.extern data_020d63e0
.extern gDualArrayBlendPresentationVtable
.extern data_021055dc
.extern TimedSpritePresentation_InitBase
.extern func_0201e28c
.extern BlendElement_DestroyNoOp
.extern ExtendedCallbackState_SetReferencesAndReset
.extern DualArrayBlendPresentation_RetargetMirrored
.extern BlendElement_StartDuration
.extern DualArrayBlendPresentation_RetargetSeparated
.extern DualArrayBlendPresentation_UpdateTransition
.extern DualArrayBlendPresentation_RetargetCompletedRandomly
.extern func_0209189c
.extern TitleRandom_NextBounded
.extern func_02092418
.extern PresentationScalar_TransitionTo
.extern Presentation_InitVariant
.extern Presentation_SetPosition
.extern Presentation_InterpolateScalar
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global DualArrayBlendPresentation_Init
    .type DualArrayBlendPresentation_Init, @function
DualArrayBlendPresentation_Init: ; 0x020215cc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r5, r1
    bl TimedSpritePresentation_InitBase
    ldr r0, .L_020216c8
    ldr r4, .L_020216cc
    str r0, [r10, #0x0]
    ldr r3, .L_020216d0
    add r0, r10, #0x20
    mov r1, #0x3
    mov r2, #0x9c
    str r4, [sp, #0x0]
    bl __construct_array
    mov r1, r4
    str r1, [sp, #0x0]
    ldr r3, .L_020216d0
    add r0, r10, #0x1f4
    mov r1, #0x3
    mov r2, #0x9c
    bl __construct_array
    mov r0, #0x0
    str r0, [r10, #0x3c8]
    bl genrand_int32
    str r0, [r10, #0x3c8]
    mov r7, #0x0
    str r5, [r10, #0x18]
    add r6, r10, #0x20
    add r5, r10, #0x1f4
    mov r11, r7
    mov r4, #0x9c
.L_02021644:
    mul r9, r7, r4
    rsb r0, r7, #0x2
    mov r8, r0, lsl #0xf
    mov r2, #0x0
    mov r3, r2
    add r0, r6, r9
    rsb r1, r8, #0x100000
    bl Presentation_SetPosition
    mov r1, r8
    mov r2, r11
    add r0, r5, r9
    mov r3, r11
    bl Presentation_SetPosition
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_02021644
    ldr r0, .L_020216d4
    ldr r1, .L_020216d8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x1
    str r0, [r10, #0x1c]
    ldr r0, [r10, #0x4]
    ldr r1, .L_020216dc
    orr r2, r0, #0x2
    bic r0, r2, #0x1
    orr r0, r0, #0x1
    str r0, [r10, #0x4]
    mov r0, r10
    ldmia r1, {r1, r2}
    bl ExtendedCallbackState_SetReferencesAndReset
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020216c8: .word gDualArrayBlendPresentationVtable
.L_020216cc: .word BlendElement_DestroyNoOp
.L_020216d0: .word Presentation_InitVariant
.L_020216d4: .word gGameWork
.L_020216d8: .word 0x3d2
.L_020216dc: .word data_020d63d0
    .size DualArrayBlendPresentation_Init, .-DualArrayBlendPresentation_Init
