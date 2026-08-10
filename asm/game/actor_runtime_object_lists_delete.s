; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeObjectLists_ClearSecond
.extern ActorRuntimeObjectLists_ClearThird
.extern ActorRuntimeObjectLists_ClearFirst
.extern ActorRuntimePayloadList_Clear
.extern Heap_Free
.extern data_020d44f0
.extern data_020d4500
.global ActorRuntimeObjectLists_DestroyAndFree
ActorRuntimeObjectLists_DestroyAndFree:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bcb0
    mov r4, r0
    str r1, [r4, #0x0]
    bl ActorRuntimeObjectLists_ClearSecond
    mov r0, r4
    bl ActorRuntimeObjectLists_ClearThird
    mov r0, r4
    bl ActorRuntimeObjectLists_ClearFirst
    ldr r1, L_0200bcb4
    add r0, r4, #0x24
    str r1, [r4, #0x24]
    bl ActorRuntimePayloadList_Clear
    ldr r1, L_0200bcb4
    add r0, r4, #0x14
    str r1, [r4, #0x14]
    bl ActorRuntimePayloadList_Clear
    ldr r1, L_0200bcb4
    add r0, r4, #0x4
    str r1, [r4, #0x4]
    bl ActorRuntimePayloadList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bcb0: .word data_020d4500
L_0200bcb4: .word data_020d44f0
.size ActorRuntimeObjectLists_DestroyAndFree, . - ActorRuntimeObjectLists_DestroyAndFree

