; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeOwnedList_Clear
.extern GamePhaseActorScriptVm_Destroy
.extern data_020d4468
.global ActorRuntimeCollection_Destroy
ActorRuntimeCollection_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x138
    bl ActorRuntimeOwnedList_Clear
    ldr r1, L_0200ae48
    add r0, r4, #0x138
    str r1, [r4, #0x138]
    bl ActorRuntimeOwnedList_Clear
    add r0, r4, #0xa0
    bl GamePhaseActorScriptVm_Destroy
    add r0, r4, #0x8
    bl GamePhaseActorScriptVm_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200ae48: .word data_020d4468
.size ActorRuntimeCollection_Destroy, . - ActorRuntimeCollection_Destroy

