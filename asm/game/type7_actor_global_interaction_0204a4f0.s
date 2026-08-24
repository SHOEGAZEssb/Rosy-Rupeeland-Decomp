; Matching retail form; see src/game/type7_actor_global_interaction.c.
.extern gGamePhaseRuntime
.extern ActorDerivedType1_TrySetStateVector
.extern Type7Actor_HandleObjectInteraction
.extern Type7Actor_GetStateCode
.extern Type7Actor_IsInteractionSceneActive
.text
    .global Type7Actor_ProcessGlobalInteractionTrigger
.type Type7Actor_ProcessGlobalInteractionTrigger, @function
Type7Actor_ProcessGlobalInteractionTrigger: ; 0x0204a4f0
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl Type7Actor_IsInteractionSceneActive
    cmp r0, #0x0
    ldrne r0, .L_0204a560
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r5, [r0, #0xea8]
    cmpne r5, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0xea4]
    add r1, r5, #0x18
    mov r2, #0x14
    mov r3, #0x0
    bl ActorDerivedType1_TrySetStateVector
    ldr r0, [r5, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl Type7Actor_GetStateCode
    cmp r0, #0x1
    ldmhiia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl Type7Actor_HandleObjectInteraction
    ldmia sp!, {r3, r4, r5, pc}
.L_0204a560: .word gGamePhaseRuntime
.size Type7Actor_ProcessGlobalInteractionTrigger, . - Type7Actor_ProcessGlobalInteractionTrigger

