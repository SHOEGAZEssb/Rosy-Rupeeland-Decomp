; Matching retail form; see src/game/actor_resource_attachment_state.c.
.text

    .global Actor_SetScriptSlot
    .type Actor_SetScriptSlot, @function
Actor_SetScriptSlot: ; 0x02032c08
    add r0, r0, r1, lsl #0x2
    str r2, [r0, #0x180]
    bx lr
    .size Actor_SetScriptSlot, . - Actor_SetScriptSlot
