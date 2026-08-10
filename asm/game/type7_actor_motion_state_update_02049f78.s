; Matching retail form; see src/game/type7_actor_motion_state_update.c.
.extern gGameWork
.extern GameWork_TestFlag
.extern Actor_SetPosition
.extern Type7Actor_UpdateMotionTowardTransform
.extern Type7Actor_ClearTarget
.extern Type7Actor_InitializeStationaryMotionState
.extern Type7Actor_InitializeActiveMotionState
.text
    .global Type7Actor_UpdateMotionState
.type Type7Actor_UpdateMotionState, @function
Type7Actor_UpdateMotionState: ; 0x02049f78
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r2
    bl Actor_SetPosition
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    ble .L_02049ff4
    ldr r0, .L_0204a00c
    ldr r1, .L_0204a010
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r5, #0x1
    mov r0, r4
    mov r1, r5
    bl Type7Actor_InitializeActiveMotionState
    mov r0, r4
    add r1, r4, #0x18
    bl Type7Actor_UpdateMotionTowardTransform
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x58]
    cmp r1, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
    ldrsh r0, [r0, #0x58]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl Type7Actor_ClearTarget
    ldmia sp!, {r3, r4, r5, pc}
.L_02049ff4:
    ldr r1, [r4, #0x10]
    mov r0, r4
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    bl Type7Actor_InitializeStationaryMotionState
    ldmia sp!, {r3, r4, r5, pc}
.L_0204a00c: .word gGameWork
.L_0204a010: .word 0x44b
.size Type7Actor_UpdateMotionState, . - Type7Actor_UpdateMotionState
