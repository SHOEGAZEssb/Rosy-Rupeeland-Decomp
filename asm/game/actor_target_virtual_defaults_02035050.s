; Matching retail form; see src/game/actor_target_virtual_defaults.c.
.text

    .global Actor_GetTargetSelectionPosition
    .type Actor_GetTargetSelectionPosition, @function
Actor_GetTargetSelectionPosition: ; 0x02035050
    add r0, r0, #0x18
    bx lr
    .size Actor_GetTargetSelectionPosition, . - Actor_GetTargetSelectionPosition

    .global Actor_GetTargetSelectionDistanceThreshold
