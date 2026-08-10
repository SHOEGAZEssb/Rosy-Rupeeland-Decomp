; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeOwnedList_Clear
.extern data_020d4468
.global ActorRuntimeOwnedList_Destroy
ActorRuntimeOwnedList_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200ae0c
    mov r4, r0
    str r1, [r4, #0x0]
    bl ActorRuntimeOwnedList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200ae0c: .word data_020d4468
.size ActorRuntimeOwnedList_Destroy, . - ActorRuntimeOwnedList_Destroy

