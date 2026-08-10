; Matching retail form; see src/game/actor_registered_subclass_state_helpers.c.
.text
.extern gActorRegisteredSubclassRegistry
.extern Actor_SetInteractionFlag2000
    .global ActorRegisteredSubclass_RegisterInteractionCandidate
    .type ActorRegisteredSubclass_RegisterInteractionCandidate, @function
ActorRegisteredSubclass_RegisterInteractionCandidate: ; 0x0203d3b4
    stmdb sp!, {r3, lr}
    ldrsh r2, [r0, #0xd6]
    cmp r2, #0x1
    bgt .L_0203d3ec
    mov ip, #0x0
    ldr r3, .L_0203d3f8
    b .L_0203d3e4
.L_0203d3d0:
    ldr r2, [r3, ip, lsl #0x2]
    cmp r2, #0x0
    streq r0, [r3, ip, lsl #0x2]
    beq .L_0203d3ec
    add ip, ip, #0x1
.L_0203d3e4:
    cmp ip, #0x4
    blt .L_0203d3d0
.L_0203d3ec:
    bl Actor_SetInteractionFlag2000
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_0203d3f8: .word gActorRegisteredSubclassRegistry
    .size ActorRegisteredSubclass_RegisterInteractionCandidate, . - ActorRegisteredSubclass_RegisterInteractionCandidate

