; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern func_02030d3c

    .global func_02032df4
    .type func_02032df4, @function
func_02032df4: ; 0x02032df4
    ldr ip, .L_02032e00
    add r0, r0, #0x4
    bx ip
.L_02032e00: .word func_02030d3c
    .size func_02032df4, . - func_02032df4
