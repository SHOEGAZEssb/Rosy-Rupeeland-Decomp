; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeOwnedList_Append
.global ActorRuntimeCollection_QueueValue
ActorRuntimeCollection_QueueValue:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x144]
    cmp r2, #0x8
    ldmgtia sp!, {r3, pc}
    add r0, r0, #0x138
    bl ActorRuntimeOwnedList_Append
    ldmia sp!, {r3, pc}
.size ActorRuntimeCollection_QueueValue, . - ActorRuntimeCollection_QueueValue

