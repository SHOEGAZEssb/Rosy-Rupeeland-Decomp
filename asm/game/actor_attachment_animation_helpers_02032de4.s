; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern ActorBounds_Translate

    .global Actor_TranslateSecondaryBounds
    .type Actor_TranslateSecondaryBounds, @function
Actor_TranslateSecondaryBounds: ; 0x02032de4
    ldr ip, .L_02032df0
    add r0, r0, #0x8
    bx ip
.L_02032df0: .word ActorBounds_Translate
    .size Actor_TranslateSecondaryBounds, . - Actor_TranslateSecondaryBounds
