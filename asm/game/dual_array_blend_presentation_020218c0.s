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
.extern func_02092418
.extern PresentationScalar_TransitionTo
.extern Presentation_InitVariant
.extern Presentation_SetPosition
.extern Presentation_InterpolateScalar
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global DualArrayBlendPresentation_RetargetMirrored
    .type DualArrayBlendPresentation_RetargetMirrored, @function
DualArrayBlendPresentation_RetargetMirrored: ; 0x020218c0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r7, #0x0
    add r6, r0, #0x20
    add r5, r0, #0x1f4
    mov r11, #0x2
    mov r4, #0x9c
.L_020218d8:
    mul r9, r7, r4
    rsb r0, r7, #0x2
    mov r8, r0, lsl #0xf
    add r10, r6, r9
    mov r1, r11
    add r0, r10, #0xc
    rsb r2, r8, #0x100000
    bl PresentationScalar_TransitionTo
    mov r0, r10
    mov r1, #0x78
    bl BlendElement_StartDuration
    add r9, r5, r9
    mov r2, r8
    add r0, r9, #0xc
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    mov r0, r9
    mov r1, #0x78
    bl BlendElement_StartDuration
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_020218d8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size DualArrayBlendPresentation_RetargetMirrored, .-DualArrayBlendPresentation_RetargetMirrored
