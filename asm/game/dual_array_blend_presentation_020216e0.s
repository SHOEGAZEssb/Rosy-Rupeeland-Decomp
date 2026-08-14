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
.extern func_0201e250
.extern func_0201e28c
.extern BlendElement_DestroyNoOp
.extern ExtendedCallbackState_SetReferencesAndReset
.extern DualArrayBlendPresentation_RetargetMirrored
.extern BlendElement_StartDuration
.extern DualArrayBlendPresentation_RetargetSeparated
.extern DualArrayBlendPresentation_UpdateTransition
.extern DualArrayBlendPresentation_RetargetCompletedRandomly
.extern func_0209189c
.extern func_020918f4
.extern func_02092418
.extern func_020948e4
.extern func_02094ad4
.extern func_02094bbc
.extern func_02094d28
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global DualArrayBlendPresentation_Destroy
    .type DualArrayBlendPresentation_Destroy, @function
DualArrayBlendPresentation_Destroy: ; 0x020216e0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0202179c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    cmp r0, #0x1
    bne .L_02021738
    ldr r0, .L_020217a0
    mov r2, #0x4000000
    ldr r1, [r0, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x3
    orr r1, r1, r0, lsl #0x8
    ldr r0, .L_020217a4
    str r1, [r2, #0x0]
    mov r1, #0x0
    strh r1, [r2, #0x50]
    bl func_02092418
    b .L_02021764
.L_02021738:
    ldr r3, .L_020217a0
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
.L_02021764:
    ldr r3, .L_020217a8
    add r0, r4, #0x1f4
    mov r1, #0x3
    mov r2, #0x9c
    bl __destroy_arr
    ldr r3, .L_020217a8
    add r0, r4, #0x20
    mov r1, #0x3
    mov r2, #0x9c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202179c: .word gDualArrayBlendPresentationVtable
.L_020217a0: .word 0x4001000
.L_020217a4: .word data_021055dc
.L_020217a8: .word BlendElement_DestroyNoOp
    .size DualArrayBlendPresentation_Destroy, .-DualArrayBlendPresentation_Destroy
