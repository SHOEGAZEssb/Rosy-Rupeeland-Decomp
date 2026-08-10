; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeObjectLists_ClearSecond
.extern ActorRuntimeObjectLists_ClearThird
.extern ActorRuntimeObjectLists_ClearFirst
.extern ActorRuntimePayloadList_Clear
.extern data_020d44f0
.extern data_020d4500
.global ActorRuntimeObjectLists_Destroy
ActorRuntimeObjectLists_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bc44
    mov r4, r0
    str r1, [r4, #0x0]
    bl ActorRuntimeObjectLists_ClearSecond
    mov r0, r4
    bl ActorRuntimeObjectLists_ClearThird
    mov r0, r4
    bl ActorRuntimeObjectLists_ClearFirst
    ldr r1, L_0200bc48
    add r0, r4, #0x24
    str r1, [r4, #0x24]
    bl ActorRuntimePayloadList_Clear
    ldr r1, L_0200bc48
    add r0, r4, #0x14
    str r1, [r4, #0x14]
    bl ActorRuntimePayloadList_Clear
    ldr r1, L_0200bc48
    add r0, r4, #0x4
    str r1, [r4, #0x4]
    bl ActorRuntimePayloadList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bc44: .word data_020d4500
L_0200bc48: .word data_020d44f0
.size ActorRuntimeObjectLists_Destroy, . - ActorRuntimeObjectLists_Destroy

