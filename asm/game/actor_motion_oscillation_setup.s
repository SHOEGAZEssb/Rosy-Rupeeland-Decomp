; Matching retail form; see src/game/actor_motion_oscillation_setup.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200500c
.extern func_02005058
.extern ActorMotionTriple_Assign
.extern func_020befec
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
    bl func_0200500c
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
    bl func_02005058
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}

    .size ActorMotion_SetOscillation, .-ActorMotion_SetOscillation

    .global ActorMotionOscillation_InitInterval
ActorMotionOscillation_InitInterval: ; 0x0200964c
    stmdb sp!, {r4, lr}
    mov r4, r0
    sub r0, r1, r2
    cmp r1, r2
    movle ip, r1
    add r0, r0, r0, lsr #0x1f
    movgt ip, r2
    movs r0, r0, asr #0x1
    str r0, [r4, #0x0]
    rsbmi r0, r0, #0x0
    add r2, ip, r0
    mov r1, r3
    mov r0, #0x10000
    str r2, [r4, #0x4]
    bl func_020befec
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ActorMotionOscillation_InitInterval, .-ActorMotionOscillation_InitInterval
