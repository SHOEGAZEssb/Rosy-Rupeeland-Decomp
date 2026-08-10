; Matching retail form; see src/game/actor_attachment_slot_resource.c.
.text
    .global Actor_GetStatusFlag80
    .type Actor_GetStatusFlag80, @function
Actor_GetStatusFlag80: ; 0x02039714
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
    .size Actor_GetStatusFlag80, . - Actor_GetStatusFlag80
