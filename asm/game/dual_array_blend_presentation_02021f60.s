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

.global DualArrayBlendPresentation_ApplyFrameOffsets
    .type DualArrayBlendPresentation_ApplyFrameOffsets, @function
DualArrayBlendPresentation_ApplyFrameOffsets: ; 0x02021f60
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    bxeq lr
    ldr r1, [r0, #0x18]
    ldr r3, [r0, #0x30]
    cmp r1, #0x1
    ldr r2, .L_02022034
    bne .L_02021fdc
    mov r1, r3, asr #0xb
    add r1, r3, r1, lsr #0x14
    ldr ip, .L_02022038
    and r1, r2, r1, asr #0xc
    orr r1, r1, #0x100000
    str r1, [ip, #0x0]
    ldr r1, [r0, #0x204]
    sub r3, ip, #0x8
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    and r0, r2, r0, asr #0xc
    orr r0, r0, #0x1f00000
    str r0, [ip, #0x4]
    ldrh r0, [r3, #0x0]
    sub r1, ip, #0x6
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r3, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    bx lr
.L_02021fdc:
    mov r1, r3, asr #0xb
    add r1, r3, r1, lsr #0x14
    ldr ip, .L_0202203c
    and r1, r2, r1, asr #0xc
    orr r1, r1, #0x100000
    str r1, [ip, #0x0]
    ldr r1, [r0, #0x204]
    sub r3, ip, #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    and r0, r2, r0, asr #0xc
    orr r0, r0, #0x1f00000
    str r0, [ip, #0x4]
    ldrh r0, [r3, #0x0]
    sub r1, ip, #0xa
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r3, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    strh r0, [r1, #0x0]
    bx lr
.L_02022034: .word 0x1ff
.L_02022038: .word 0x4000010
.L_0202203c: .word 0x4001018
    .size DualArrayBlendPresentation_ApplyFrameOffsets, .-DualArrayBlendPresentation_ApplyFrameOffsets
