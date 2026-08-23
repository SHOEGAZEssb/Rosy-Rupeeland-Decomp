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

.global DualArrayBlendPresentation_Update
    .type DualArrayBlendPresentation_Update, @function
DualArrayBlendPresentation_Update: ; 0x02021bb4
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02021f34
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02021f38
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x1c]
    bne .L_02021f2c
    mov r1, #0x1
    str r1, [r4, #0x1c]
    ldr r0, [r4, #0x10]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_02021f28
.L_02021bf8: ; jump table
    b .L_02021c18 ; case 0
    b .L_02021cbc ; case 1
    b .L_02021cfc ; case 2
    b .L_02021d60 ; case 3
    b .L_02021da0 ; case 4
    b .L_02021df8 ; case 5
    b .L_02021e38 ; case 6
    b .L_02021ef0 ; case 7
.L_02021c18:
    ldr r0, [r4, #0x18]
    mov ip, #0x10
    cmp r0, #0x1
    mov r3, #0x0
    bne .L_02021c68
    ldr r0, .L_02021f3c
    mov r1, #0x3
    mov r2, #0x3c
    str ip, [sp, #0x0]
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
    b .L_02021ca0
.L_02021c68:
    ldr r0, .L_02021f40
    mov r1, #0xc
    mov r2, #0x33
    str ip, [sp, #0x0]
    bl func_020afd0c
    ldr r2, .L_02021f44
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0xc
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_02021ca0:
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetSeparated
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
.L_02021cbc:
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x20
    bl DualArrayBlendPresentation_UpdateTransition
    cmp r0, #0x0
    beq .L_02021f28
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021cfc:
    ldr r0, .L_02021f34
    rsb r1, r1, #0x3d0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02021d54
    ldr r0, .L_02021f34
    ldr r1, .L_02021f4c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetMirrored
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021d54:
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetCompletedRandomly
    b .L_02021f28
.L_02021d60:
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x0
    bl DualArrayBlendPresentation_UpdateTransition
    cmp r0, #0x0
    beq .L_02021f28
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021da0:
    ldr r0, .L_02021f34
    mov r1, #0x3d0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02021f28
    ldr r0, .L_02021f34
    mov r1, #0x3d0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetSeparated
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021df8:
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x20
    bl DualArrayBlendPresentation_UpdateTransition
    cmp r0, #0x0
    beq .L_02021f28
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021e38:
    ldr r0, .L_02021f34
    rsb r1, r1, #0x3d0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02021e8c
    ldr r0, .L_02021f34
    ldr r1, .L_02021f4c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetMirrored
    mov r0, #0x3
    str r0, [r4, #0x10]
    mov r0, #0x0
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021e8c:
    ldr r0, .L_02021f34
    ldr r1, .L_02021f50
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02021ee4
    ldr r0, .L_02021f34
    ldr r1, .L_02021f50
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetMirrored
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    b .L_02021f28
.L_02021ee4:
    mov r0, r4
    bl DualArrayBlendPresentation_RetargetCompletedRandomly
    b .L_02021f28
.L_02021ef0:
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x0
    bl DualArrayBlendPresentation_UpdateTransition
    cmp r0, #0x0
    beq .L_02021f28
    ldr r0, .L_02021f34
    ldr r1, .L_02021f48
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, .L_02021f54
    mov r0, r4
    ldmia r1, {r1, r2}
    bl ExtendedCallbackState_SetReferencesAndReset
.L_02021f28:
    mov r0, #0x0
.L_02021f2c:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02021f34: .word gGameWork
.L_02021f38: .word 0x38e
.L_02021f3c: .word 0x4000050
.L_02021f40: .word 0x4001050
.L_02021f44: .word 0x4001000
.L_02021f48: .word 0x3d2
.L_02021f4c: .word 0x3cf
.L_02021f50: .word 0x3d1
.L_02021f54: .word data_020d63e0
    .size DualArrayBlendPresentation_Update, .-DualArrayBlendPresentation_Update
