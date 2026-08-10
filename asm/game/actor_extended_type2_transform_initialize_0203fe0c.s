; Matching retail form; see src/game/actor_extended_type2_transform_initialize.c.
.text
.extern func_020050a4
.extern func_0200b2c0
.global ActorExtendedType2_InitializeTransformAndMotion
.type ActorExtendedType2_InitializeTransformAndMotion, @function
ActorExtendedType2_InitializeTransformAndMotion: ; 0x0203fe0c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x28
    mov r4, r2
    bl func_020050a4
    mov r1, r0
    add r0, r5, #0x18
    bl func_020050a4
    mov r1, r0
    add r0, r5, #0x22c
    bl func_020050a4
    add r0, r5, #0x38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    add r0, r5, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    add r0, r5, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldr r1, [r4, #0x4]
    mov r0, r5
    str r1, [r5, #0x8c]
    ldr r1, [r4, #0x8]
    str r1, [r5, #0x90]
    ldr r1, [r4, #0xc]
    str r1, [r5, #0x44]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x114]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.size ActorExtendedType2_InitializeTransformAndMotion, . - ActorExtendedType2_InitializeTransformAndMotion

