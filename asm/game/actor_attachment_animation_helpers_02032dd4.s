; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern func_020050a4

    .global func_02032dd4
    .type func_02032dd4, @function
func_02032dd4: ; 0x02032dd4
    ldr ip, .L_02032de0
    add r0, r0, #0x38
    bx ip
.L_02032de0: .word func_020050a4
    .size func_02032dd4, . - func_02032dd4
