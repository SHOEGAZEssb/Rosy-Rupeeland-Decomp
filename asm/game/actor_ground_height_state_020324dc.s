; Matching retail form; see src/game/actor_ground_height_state.c.
.text
.extern func_020adae4
.extern func_020be334

    .global Actor_ConvergeToTargetHeight
    .type Actor_ConvergeToTargetHeight, @function
Actor_ConvergeToTargetHeight: ; 0x020324dc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    ldr r5, [r4, #0x84]
    add r0, r0, r0, lsl #0x4
    add r0, r5, r0
    mov r1, #0x12
    bl func_020adae4
    str r0, [r4, #0x24]
    sub r0, r0, r5
    bl func_020be334
    cmp r0, #0x4000
    ldr r0, [r4, #0xd0]
    orrlt r0, r0, #0x20
    bicge r0, r0, #0x20
    str r0, [r4, #0xd0]
    ldmia sp!, {r3, r4, r5, pc}
    .size Actor_ConvergeToTargetHeight, . - Actor_ConvergeToTargetHeight
