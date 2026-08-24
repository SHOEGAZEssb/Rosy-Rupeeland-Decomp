; Matching retail form; see src/game/grid_effect_actor_eligibility.c.
.extern gGamePhaseRuntime
.extern gActorRuntimeCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.text
    .global GridEffectActor_CanBeginDeparture
GridEffectActor_CanBeginDeparture:
    stmdb sp!, {r3, lr}
    add r0, r0, #0x100
    ldrh r0, [r0, #0xf0]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_0204f4c4
    ldr r0, .L_0204f4cc
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0204f4c4
    ldr r0, .L_0204f4d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_0204f4c4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0204f4cc: .word gActorRuntimeCollection
.L_0204f4d0: .word gGamePhaseRuntime
.size GridEffectActor_CanBeginDeparture, . - GridEffectActor_CanBeginDeparture

