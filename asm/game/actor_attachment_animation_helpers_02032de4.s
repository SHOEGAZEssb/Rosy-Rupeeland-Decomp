; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern ActorBounds_Translate

    .global func_02032de4
    .type func_02032de4, @function
func_02032de4: ; 0x02032de4
    ldr ip, .L_02032df0
    add r0, r0, #0x8
    bx ip
.L_02032df0: .word ActorBounds_Translate
    .size func_02032de4, . - func_02032de4
