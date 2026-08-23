; Matching retail form; see src/game/actor_target_virtual_defaults.c.
.text

    .global Actor_GetTargetSelectionDistanceThreshold
    .type Actor_GetTargetSelectionDistanceThreshold, @function
Actor_GetTargetSelectionDistanceThreshold: ; 0x02035058
    mov r0, #0xc0000
    bx lr
    .size Actor_GetTargetSelectionDistanceThreshold, . - Actor_GetTargetSelectionDistanceThreshold

    .global ActorDerivedType1_Init
