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

.global DualArrayBlendPresentation_RetargetSeparated
    .type DualArrayBlendPresentation_RetargetSeparated, @function
DualArrayBlendPresentation_RetargetSeparated: ; 0x0202194c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r8, #0x0
    add r7, r0, #0x20
    add r5, r0, #0x1f4
    mov r6, #0x2
    mov r11, r8
    mov r4, #0x9c
.L_02021968:
    mul r9, r8, r4
    add r10, r7, r9
    mov r1, r6
    mov r2, r11
    add r0, r10, #0xc
    bl PresentationScalar_TransitionTo
    mov r0, r10
    mov r1, #0x78
    bl BlendElement_StartDuration
    add r9, r5, r9
    add r0, r9, #0xc
    mov r1, #0x2
    mov r2, #0x100000
    bl PresentationScalar_TransitionTo
    mov r0, r9
    mov r1, #0x78
    bl BlendElement_StartDuration
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_02021968
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size DualArrayBlendPresentation_RetargetSeparated, .-DualArrayBlendPresentation_RetargetSeparated
