; Matching retail form; see src/game/type7_actor_constructor.c.
.text
.extern data_020e1740
.extern data_020e1c38
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Assign
.extern ActorDerivedRuntime_Init
.extern Type7Actor_ResetBaseTransformAndMotion
.extern Type7Actor_SetCallbackPair
.extern Type7MarkerPresentation_Init
.global Type7Actor_Init
.type Type7Actor_Init, @function
Type7Actor_Init: ; 0x020455bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_Init
    ldr r1, .L_02045718
    add r0, r4, #0x214
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    mvn r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x224
    bl VecFx32Object_InitComponents
    mov r3, #0x0
    ldr r0, .L_0204571c
    str r3, [r4, #0x234]
    mov r1, #0x47
    str r0, [r4, #0x238]
    add r0, r0, #0x800
    str r0, [r4, #0x23c]
    str r3, [r4, #0x240]
    add r0, r4, #0x200
    strh r3, [r0, #0x46]
    strh r3, [r0, #0x4e]
    sub r2, r3, #0x1e
    strh r2, [r0, #0x50]
    strh r1, [r0, #0x52]
    sub r1, r1, #0x48
    strh r3, [r0, #0x54]
    strh r3, [r0, #0x56]
    strh r1, [r0, #0x58]
    strh r3, [r0, #0x5a]
    mov r1, #0x30000
    str r1, [r4, #0x25c]
    mov r1, #0x50000
    str r1, [r4, #0x260]
    strh r3, [r0, #0x64]
    strh r3, [r0, #0x66]
    add r0, r4, #0x26c
    str r3, [r4, #0x268]
    bl VecFx32Object_Init
    mov r2, #0x0
    add r0, r4, #0x200
    strh r2, [r0, #0x7c]
    sub r1, r2, #0x1
    strh r1, [r0, #0x7e]
    str r2, [r4, #0x280]
    add r0, r4, #0x284
    bl VecFx32Object_Init
    mov r1, #0x0
    str r1, [r4, #0x294]
    str r1, [r4, #0x298]
    str r1, [r4, #0x29c]
    add r0, r4, #0x200
    strh r1, [r0, #0xa0]
    strh r1, [r0, #0xa2]
    strh r1, [r0, #0xa4]
    strh r1, [r0, #0xa6]
    add r0, r4, #0x2a8
    mov r1, r4
    bl Type7MarkerPresentation_Init
    add r0, r4, #0x214
    add r1, r4, #0x18
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r4, #0x26c
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x14]
    ldr r1, .L_02045720
    tst r0, #0x400
    ldrne r0, [r4, #0xd0]
    mov r3, #0x78
    orrne r0, r0, #0x4
    strne r0, [r4, #0xd0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x210]
    bl Type7Actor_ResetBaseTransformAndMotion
    mov r0, #0x10000
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r1, r1, r0
    mov r0, r4
    str r1, [r4, #0x5c]
    ldmia sp!, {r4, pc}
.L_02045718: .word data_020e1c38
.L_0204571c: .word 0xccd
.L_02045720: .word data_020e1740
.size Type7Actor_Init, . - Type7Actor_Init
