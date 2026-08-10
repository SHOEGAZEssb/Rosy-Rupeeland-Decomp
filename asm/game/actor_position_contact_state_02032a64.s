; Matching retail form; see src/game/actor_position_contact_state.c.
.text
.extern func_020050a4

    .global Actor_SetPosition
    .type Actor_SetPosition, @function
Actor_SetPosition: ; 0x02032a64
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    add r0, r4, #0x28
    bic r2, r2, #0x80
    orr r2, r2, #0x200
    str r2, [r4, #0xd0]
    bl func_020050a4
    mov r1, r0
    add r0, r4, #0x18
    bl func_020050a4
    ldmia sp!, {r4, pc}
    .size Actor_SetPosition, . - Actor_SetPosition
