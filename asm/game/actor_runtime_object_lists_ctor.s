; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeAnimationResourceList_Init
.extern gActorRuntimeAnimationResourceListsVTable
.global ActorRuntimeAnimationResourceLists_Init
ActorRuntimeAnimationResourceLists_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_0200bb64
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl ActorRuntimeAnimationResourceList_Init
    add r0, r4, #0x14
    bl ActorRuntimeAnimationResourceList_Init
    add r0, r4, #0x24
    bl ActorRuntimeAnimationResourceList_Init
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bb64: .word gActorRuntimeAnimationResourceListsVTable
.size ActorRuntimeAnimationResourceLists_Init, . - ActorRuntimeAnimationResourceLists_Init

