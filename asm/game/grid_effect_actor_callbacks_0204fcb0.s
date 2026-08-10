; Matching retail form; see src/game/grid_effect_actor_callbacks.c.
.text
    .global GridEffectActor_ReturnFx100000
GridEffectActor_ReturnFx100000:
    mov r0, #0x100000
    bx lr
.size GridEffectActor_ReturnFx100000, . - GridEffectActor_ReturnFx100000

