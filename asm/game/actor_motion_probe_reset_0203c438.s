; Matching retail form; see src/game/actor_motion_probe_reset.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
    .global ActorMotionProbe_ResetMotion
    .type ActorMotionProbe_ResetMotion, @function
ActorMotionProbe_ResetMotion: ; 0x0203c438
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r1, #0x0
    mov r4, r0
    str r1, [r4, #0x244]
    str r1, [r4, #0x248]
    mov r0, #0x1
    str r0, [r4, #0x24c]
    str r1, [r4, #0x250]
    str r1, [r4, #0x254]
    add r0, sp, #0x20
    mov r2, r1
    mov r3, r1
    str r1, [r4, #0x240]
    bl VecFx32Object_InitComponents
    add r1, sp, #0x20
    add r0, r4, #0x220
    bl VecFx32Object_Assign
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, sp, #0x10
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, r4, #0x210
    add r1, sp, #0x10
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, r4, #0x230
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}

    .size ActorMotionProbe_ResetMotion, . - ActorMotionProbe_ResetMotion

