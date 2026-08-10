; Matching retail form; see src/game/tracked_resource_actor_interaction.c.
.extern ActorDerivedType1_DispatchInteractionAmount
.extern Type7Actor_NoopTrackedResourceInteraction
.text
    .global func_02050560
func_02050560:
    stmdb sp!, {r3, lr}
    mov r2, r0
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r1, #0x10]
    tst r0, #0x1000000
    ldmneia sp!, {r3, pc}
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x1
    moveq r3, #0x1
    movne r3, #0x0
    cmp r3, #0x0
    beq .L_020505a8
    ldr r3, [r2, #0x1fc]
    mov r0, r1
    ldrsh r1, [r3, #0xc]
    bl ActorDerivedType1_DispatchInteractionAmount
    ldmia sp!, {r3, pc}
.L_020505a8:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, [r2, #0x1fc]
    mov r0, r1
    ldrsh r1, [r2, #0xe]
    bl Type7Actor_NoopTrackedResourceInteraction
    ldmia sp!, {r3, pc}
.size func_02050560, . - func_02050560

