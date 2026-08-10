; Matching retail form; see src/game/grid_effect_actor_interaction.c.
.extern Sound_Play
.extern data_021052fc
.extern data_021e9ac0
.extern gSoundContext
.extern VecFx32Object_Subtract
.extern ActorMotionAreaFollower_GetPosition
.extern ActorDerivedType1_TrySetStateVector
.extern Type7Actor_ClearGlobalRelationshipToActor
.extern GridEffectActorModeAllocator_Reserve
.extern func_02064a18
.text

    .global GridEffectActor_BeginDeparture
GridEffectActor_BeginDeparture: ; 0x0204f4d4
    stmdb sp!, {r4, lr}
    ldrb r1, [r1, #0x4d]
    mov r4, r0
    cmp r1, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0204f538
    ldr r0, .L_0204f600
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0204f538
    ldr r0, .L_0204f600
    add r1, r4, #0x18
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r3, #0x2
    bl ActorDerivedType1_TrySetStateVector
.L_0204f538:
    mov r0, r4
    bl Type7Actor_ClearGlobalRelationshipToActor
    add r0, r4, #0x100
    ldrh r3, [r0, #0xf0]
    mov r1, #0x0
    mov r2, #0x1
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [r0, #0xf0]
    strh r1, [r0, #0xf2]
    ldr r1, [r4, #0x54]
    ldr r0, .L_0204f600
    strb r2, [r1, #0x3a]
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r4, #0x14]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x14]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, r4, #0x18
    bl VecFx32Object_Subtract
    mov r1, #0x0
    ldr r3, [r4, #0x20]
    ldr r2, [r4, #0x24]
    sub r0, r1, #0x10000
    sub r2, r3, r2
    str r2, [r4, #0x20]
    str r1, [r4, #0x24]
    ldr r1, [r4, #0x5c]
    and r0, r1, r0
    orr r0, r0, #0xff00
    str r0, [r4, #0x5c]
    bl GridEffectActorModeAllocator_Reserve
    ldr r1, .L_0204f604
    strb r0, [r4, #0x21a]
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x11
    bl Sound_Play
    add r1, r4, #0x1f4
    ldr r0, .L_0204f608
    ldr r0, [r0, #0x0]
    bl func_02064a18
    ldmia sp!, {r4, pc}
.L_0204f600: .word data_021052fc
.L_0204f604: .word gSoundContext
.L_0204f608: .word data_021e9ac0
.size GridEffectActor_BeginDeparture, . - GridEffectActor_BeginDeparture

