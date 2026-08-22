; Matching retail form; see src/game/actor_motion_oscillation_setup.c for
; the documented portable implementation and recovered behavior.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern ActorMotionTriple_Assign
.extern ActorMotionOscillation_InitInterval
.global ActorMotion_SetOscillation
ActorMotion_SetOscillation: ; 0x020095cc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, [r5, #0x30]
    mov r4, r3
    orr r3, r0, #0x2
    str r3, [r5, #0x30]
    add r0, sp, #0x18
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    ldr r2, [sp, #0x1c]
    add r0, sp, #0x0
    mov r3, r4
    rsb r1, r2, #0x0
    bl ActorMotionOscillation_InitInterval
    add r0, r5, #0x44
    add r1, sp, #0x0
    bl ActorMotionTriple_Assign
    ldr r2, [sp, #0x20]
    mov r3, r4
    add r0, sp, #0xc
    rsb r1, r2, #0x0
    bl ActorMotionOscillation_InitInterval
    add r0, r5, #0x50
    add r1, sp, #0xc
    bl ActorMotionTriple_Assign
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}

    .size ActorMotion_SetOscillation, .-ActorMotion_SetOscillation
