; Matching retail form; see src/game/actor_runtime_object_lists_populate.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeAnimationResourceList_Clear
.extern Heap_Free
.extern gActorRuntimeAnimationResourceListVTable
.global ActorRuntimeAnimationResourceList_DestroyAndFree
ActorRuntimeAnimationResourceList_DestroyAndFree:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bf00
    mov r4, r0
    str r1, [r4, #0x0]
    bl ActorRuntimeAnimationResourceList_Clear
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bf00: .word gActorRuntimeAnimationResourceListVTable
.size ActorRuntimeAnimationResourceList_DestroyAndFree, . - ActorRuntimeAnimationResourceList_DestroyAndFree

