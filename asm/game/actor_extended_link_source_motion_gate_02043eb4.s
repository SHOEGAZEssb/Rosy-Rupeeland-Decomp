; Matching retail form; see src/game/actor_extended_link_source_motion_gate.c.
.text
.extern VecFx32Object_SetComponents
.extern Actor_IntegrateMotion
.global ActorExtendedLinkSource_UpdateMotion
.type ActorExtendedLinkSource_UpdateMotion, @function
ActorExtendedLinkSource_UpdateMotion: ; 0x02043eb4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x29c]
    tst r1, #0x1
    beq .L_02043f08
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl VecFx32Object_SetComponents
    ldmia sp!, {r4, pc}
.L_02043f08:
    bl Actor_IntegrateMotion
    ldmia sp!, {r4, pc}
.size ActorExtendedLinkSource_UpdateMotion, . - ActorExtendedLinkSource_UpdateMotion
