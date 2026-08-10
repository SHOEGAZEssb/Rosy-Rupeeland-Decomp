; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimePayloadList_Init
.extern data_020d4500
.global ActorRuntimeObjectLists_Init
ActorRuntimeObjectLists_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_0200bb64
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl ActorRuntimePayloadList_Init
    add r0, r4, #0x14
    bl ActorRuntimePayloadList_Init
    add r0, r4, #0x24
    bl ActorRuntimePayloadList_Init
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bb64: .word data_020d4500
.size ActorRuntimeObjectLists_Init, . - ActorRuntimeObjectLists_Init

