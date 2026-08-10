; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern ActorBounds_Translate

    .global Actor_TranslateCollisionBounds
    .type Actor_TranslateCollisionBounds, @function
Actor_TranslateCollisionBounds: ; 0x02032df4
    ldr ip, .L_02032e00
    add r0, r0, #0x4
    bx ip
.L_02032e00: .word ActorBounds_Translate
    .size Actor_TranslateCollisionBounds, . - Actor_TranslateCollisionBounds
