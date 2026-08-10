; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text

.global ActorRuntimeCollection_SetPendingValue
ActorRuntimeCollection_SetPendingValue:
    str r1, [r0, #0x134]
    bx lr
.size ActorRuntimeCollection_SetPendingValue, . - ActorRuntimeCollection_SetPendingValue

