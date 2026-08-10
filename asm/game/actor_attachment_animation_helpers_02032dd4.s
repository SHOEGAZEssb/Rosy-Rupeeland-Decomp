; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern func_020050a4

    .global Actor_SetVelocity
    .type Actor_SetVelocity, @function
Actor_SetVelocity: ; 0x02032dd4
    ldr ip, .L_02032de0
    add r0, r0, #0x38
    bx ip
.L_02032de0: .word func_020050a4
    .size Actor_SetVelocity, . - Actor_SetVelocity
