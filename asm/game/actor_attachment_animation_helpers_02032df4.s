; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern ActorBounds_Translate

    .global func_02032df4
    .type func_02032df4, @function
func_02032df4: ; 0x02032df4
    ldr ip, .L_02032e00
    add r0, r0, #0x4
    bx ip
.L_02032e00: .word ActorBounds_Translate
    .size func_02032df4, . - func_02032df4
