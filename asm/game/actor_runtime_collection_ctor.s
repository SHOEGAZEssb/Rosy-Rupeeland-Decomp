; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0201b0f4
.extern ActorRuntimeOwnedList_Init
.global ActorRuntimeCollection_Init
ActorRuntimeCollection_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl func_0201b0f4
    add r0, r4, #0xa0
    bl func_0201b0f4
    mov r1, #0x0
    add r0, r4, #0x138
    str r1, [r4, #0x134]
    bl ActorRuntimeOwnedList_Init
    mov r0, r4
    ldmia sp!, {r4, pc}
.size ActorRuntimeCollection_Init, . - ActorRuntimeCollection_Init

