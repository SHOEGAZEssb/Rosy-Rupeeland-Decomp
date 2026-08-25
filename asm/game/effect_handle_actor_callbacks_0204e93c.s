; Matching retail form; see src/game/effect_handle_actor_callbacks.c.
.text
    .global EffectHandleActor_GetGravityAcceleration
EffectHandleActor_GetGravityAcceleration:
    mov r0, #0x100000
    bx lr
.size EffectHandleActor_GetGravityAcceleration, . - EffectHandleActor_GetGravityAcceleration

