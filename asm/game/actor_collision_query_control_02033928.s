; Matching retail form; see src/game/actor_collision_query_control.c.
.text

    .global ActorCollisionQuery_NoOpHook
    .type ActorCollisionQuery_NoOpHook, @function
ActorCollisionQuery_NoOpHook: ; 0x02033928
    bx lr
    .size ActorCollisionQuery_NoOpHook, . - ActorCollisionQuery_NoOpHook

    .global Actor_SetInteractionFlag2000

