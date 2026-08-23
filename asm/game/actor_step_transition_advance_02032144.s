; Matching retail form; see src/game/actor_step_transition_advance.c.
.text
.extern gActorPositionTransitionHeightOffsets
.extern VecFx32Object_Assign

    .global Actor_UpdatePositionTransition
    .type Actor_UpdatePositionTransition, @function
Actor_UpdatePositionTransition: ; 0x02032144
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x320
    mov r4, r0
    ldrsh r1, [r4, #0xac]
    cmp r1, #0xff
    moveq r0, #0x0
    beq .L_020321fc
    ldrsh r1, [r4, #0xae]
    cmp r1, #0x0
    ble .L_020321e0
    sub r0, r1, #0x1
    strh r0, [r4, #0xae]
    ldr r1, [r4, #0x1c]
    ldr r0, [r4, #0xc0]
    ldr r5, .L_02032204
    add r0, r1, r0
    str r0, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xc4]
    add lr, sp, #0x0
    add r0, r1, r0
    str r0, [r4, #0x20]
    mov ip, #0x32
.L_020321a0:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_020321a0
    ldrsh r3, [r4, #0xac]
    ldrsh r1, [r4, #0xae]
    add r2, sp, #0x0
    mov r0, #0x64
    smlabb r0, r3, r0, r2
    rsb r1, r1, #0x18
    ldr r1, [r0, r1, lsl #0x2]
    ldr r2, [r4, #0xbc]
    mov r0, #0x1
    add r1, r2, r1
    str r1, [r4, #0x24]
    b .L_020321fc
.L_020321e0:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x40]
    blx r1
    add r0, r4, #0x18
    add r1, r4, #0xb0
    bl VecFx32Object_Assign
    mov r0, #0x2
.L_020321fc:
    add sp, sp, #0x320
    ldmia sp!, {r3, r4, r5, pc}
.L_02032204: .word gActorPositionTransitionHeightOffsets
    .size Actor_UpdatePositionTransition, . - Actor_UpdatePositionTransition

