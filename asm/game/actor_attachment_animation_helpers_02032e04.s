; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern func_020344b8

    .global func_02032e04
    .type func_02032e04, @function
func_02032e04: ; 0x02032e04
    ldr ip, .L_02032e10
    add r0, r0, #0x18
    bx ip
.L_02032e10: .word func_020344b8
    .size func_02032e04, . - func_02032e04
