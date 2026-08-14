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

.global DualArrayBlendPresentation_RetargetCompletedRandomly
    .type DualArrayBlendPresentation_RetargetCompletedRandomly, @function
DualArrayBlendPresentation_RetargetCompletedRandomly: ; 0x02021ad8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r7, #0x0
    add r6, r10, #0x20
    add r5, r10, #0x1f4
    mov r11, #0x10
    mov r4, #0x9c
.L_02021af4:
    mul r9, r7, r4
    add r0, r6, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_02021b4c
    add r0, r10, #0x3c8
    mov r1, r11
    bl func_020918f4
    add r8, r6, r9
    mov r2, r0, lsl #0xc
    add r0, r8, #0xc
    mov r1, #0x2
    bl func_020948e4
    add r0, r10, #0x3c8
    mov r1, #0x3c
    mov r2, #0x78
    bl func_0209189c
    mov r1, r0
    mov r0, r8
    bl BlendElement_StartDuration
.L_02021b4c:
    add r0, r5, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_02021ba4
    add r0, r10, #0x3c8
    mov r1, #0x10
    bl func_020918f4
    rsb r0, r0, #0x100
    add r8, r5, r9
    mov r2, r0, lsl #0xc
    add r0, r8, #0xc
    mov r1, #0x2
    bl func_020948e4
    add r0, r10, #0x3c8
    mov r1, #0x3c
    mov r2, #0x78
    bl func_0209189c
    mov r1, r0
    mov r0, r8
    bl BlendElement_StartDuration
.L_02021ba4:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_02021af4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size DualArrayBlendPresentation_RetargetCompletedRandomly, .-DualArrayBlendPresentation_RetargetCompletedRandomly
