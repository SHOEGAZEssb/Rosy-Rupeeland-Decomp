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

.global DualArrayBlendPresentation_DestroyAndFree
    .type DualArrayBlendPresentation_DestroyAndFree, @function
DualArrayBlendPresentation_DestroyAndFree: ; 0x020217ac
    stmdb sp!, {r4, lr}
    ldr r1, .L_02021870
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    cmp r0, #0x1
    bne .L_02021804
    ldr r0, .L_02021874
    mov r2, #0x4000000
    ldr r1, [r0, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x3
    orr r1, r1, r0, lsl #0x8
    ldr r0, .L_02021878
    str r1, [r2, #0x0]
    mov r1, #0x0
    strh r1, [r2, #0x50]
    bl func_02092418
    b .L_02021830
.L_02021804:
    ldr r3, .L_02021874
    mov r0, #0x0
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    strh r0, [r3, #0x50]
.L_02021830:
    ldr r3, .L_0202187c
    add r0, r4, #0x1f4
    mov r1, #0x3
    mov r2, #0x9c
    bl __destroy_arr
    ldr r3, .L_0202187c
    add r0, r4, #0x20
    mov r1, #0x3
    mov r2, #0x9c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02021870: .word gDualArrayBlendPresentationVtable
.L_02021874: .word 0x4001000
.L_02021878: .word data_021055dc
.L_0202187c: .word BlendElement_DestroyNoOp
    .size DualArrayBlendPresentation_DestroyAndFree, .-DualArrayBlendPresentation_DestroyAndFree
