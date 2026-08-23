; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text
.extern ActorRuntimeTriple_Assign
.extern Fx32Vector2_LimitMagnitude

    .global Actor_ApplyMotionImpulse
    .type Actor_ApplyMotionImpulse, @function
Actor_ApplyMotionImpulse: ; 0x02033f7c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    ldr r1, [r6, #0x8c]
    ldr r0, [r5, #0x4]
    mov r4, r2
    add r0, r1, r0
    str r0, [r6, #0x8c]
    ldr r2, [r6, #0x90]
    ldr r1, [r5, #0x8]
    add r0, r6, #0x8c
    add r1, r2, r1
    str r1, [r6, #0x90]
    add r1, r6, #0x90
    mov r2, #0x6000
    bl Fx32Vector2_LimitMagnitude
    mov r1, #0x0
    ldr r3, [r5, #0xc]
    mov r2, r1
    add r0, r6, #0x38
    bl ActorRuntimeTriple_Assign
    cmp r4, #0x0
    ldrne r0, [r6, #0xd0]
    orrne r0, r0, #0x4000
    strne r0, [r6, #0xd0]
    ldmia sp!, {r4, r5, r6, pc}
    .size Actor_ApplyMotionImpulse, . - Actor_ApplyMotionImpulse

    .global Actor_TryDispatchActivationMode2

