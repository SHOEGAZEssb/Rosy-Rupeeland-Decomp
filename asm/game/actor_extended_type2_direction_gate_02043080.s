; Matching retail predicate; see src/game/actor_extended_type2_direction_gate.c.
.text
.extern func_020ae024
.global ActorExtendedType2_IsDirectionDisplacementAccepted
.type ActorExtendedType2_IsDirectionDisplacementAccepted, @function
ActorExtendedType2_IsDirectionDisplacementAccepted: ; 0x02043080
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    cmp r2, #0x0
    cmpeq r3, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x2
    bne .L_020430e0
    mov r0, r3
    mov r1, r2
    bl func_020ae024
    ldr r1, [r4, #0xc8]
    cmp r0, r1
    addlt r0, r0, #0x10000
    sub r1, r0, r1
    cmp r1, #0x8000
    ldr r0, .L_020430e8
    rsbgt r1, r1, #0x10000
    cmp r1, r0
    movlt r0, #0x1
    ldmltia sp!, {r4, pc}
.L_020430e0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_020430e8: .word 0x2ee0
.size ActorExtendedType2_IsDirectionDisplacementAccepted, . - ActorExtendedType2_IsDirectionDisplacementAccepted
