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
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern BlendElement_DestroyNoOp
.extern ExtendedCallbackState_SetReferencesAndReset
.extern DualArrayBlendPresentation_RetargetMirrored
.extern BlendElement_StartDuration
.extern DualArrayBlendPresentation_RetargetSeparated
.extern DualArrayBlendPresentation_UpdateTransition
.extern DualArrayBlendPresentation_RetargetCompletedRandomly
.extern func_0209189c
.extern TitleRandom_NextBounded
.extern GraphicsBankStateSnapshot_Restore
.extern PresentationScalar_TransitionTo
.extern Presentation_InitVariant
.extern Presentation_SetPosition
.extern Presentation_InterpolateScalar
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global DualArrayBlendPresentation_UpdateTransition
    .type DualArrayBlendPresentation_UpdateTransition, @function
DualArrayBlendPresentation_UpdateTransition: ; 0x020219bc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r6, #0x0
    add r5, r10, #0x20
    add r4, r10, #0x1f4
    mov r11, #0x9c
.L_020219dc:
    mul r7, r6, r11
    add r0, r5, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_020219dc
    mov r2, r9
    mov r3, r8
    add r0, r10, #0x20
    mov r1, #0x1
    bl Presentation_InterpolateScalar
    mov r3, r0
    cmp r3, #0x10
    ldr r0, [r10, #0x18]
    movgt r3, #0x10
    cmp r0, #0x1
    bne .L_02021a78
    ldr r0, .L_02021acc
    rsb r4, r3, #0x10
    mov r1, #0x3
    mov r2, #0x3c
    str r4, [sp, #0x0]
    bl func_020afd0c
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b .L_02021ab4
.L_02021a78:
    ldr r0, .L_02021ad0
    rsb r4, r3, #0x10
    mov r1, #0xc
    mov r2, #0x33
    str r4, [sp, #0x0]
    bl func_020afd0c
    ldr r2, .L_02021ad4
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0xc
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_02021ab4:
    ldr r1, [r10, #0xa0]
    ldr r0, [r10, #0x9c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02021acc: .word 0x4000050
.L_02021ad0: .word 0x4001050
.L_02021ad4: .word 0x4001000
    .size DualArrayBlendPresentation_UpdateTransition, .-DualArrayBlendPresentation_UpdateTransition
