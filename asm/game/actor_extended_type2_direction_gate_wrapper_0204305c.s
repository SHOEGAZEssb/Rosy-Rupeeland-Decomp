; Matching retail wrapper; see src/game/actor_extended_type2_direction_gate.c.
.text
.extern ActorExtendedType2_IsDirectionDisplacementAccepted
.global ActorExtendedType2_IsDirectionToActorAccepted
.type ActorExtendedType2_IsDirectionToActorAccepted, @function
ActorExtendedType2_IsDirectionToActorAccepted: ; 0x0204305c
    stmdb sp!, {r4, lr}
    ldr r4, [r2, #0x1c]
    ldr lr, [r0, #0x1c]
    ldr ip, [r2, #0x20]
    ldr r3, [r0, #0x20]
    sub r2, r4, lr
    sub r3, ip, r3
    bl ActorExtendedType2_IsDirectionDisplacementAccepted
    ldmia sp!, {r4, pc}
.size ActorExtendedType2_IsDirectionToActorAccepted, . - ActorExtendedType2_IsDirectionToActorAccepted
