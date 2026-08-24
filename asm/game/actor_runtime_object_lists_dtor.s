; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeAnimationResourceLists_ClearCategory1
.extern ActorRuntimeAnimationResourceLists_ClearOtherCategory
.extern ActorRuntimeAnimationResourceLists_ClearCategory0
.extern ActorRuntimeAnimationResourceList_Clear
.extern gActorRuntimeAnimationResourceListVTable
.extern gActorRuntimeAnimationResourceListsVTable
.global ActorRuntimeAnimationResourceLists_Destroy
ActorRuntimeAnimationResourceLists_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bc44
    mov r4, r0
    str r1, [r4, #0x0]
    bl ActorRuntimeAnimationResourceLists_ClearCategory1
    mov r0, r4
    bl ActorRuntimeAnimationResourceLists_ClearOtherCategory
    mov r0, r4
    bl ActorRuntimeAnimationResourceLists_ClearCategory0
    ldr r1, L_0200bc48
    add r0, r4, #0x24
    str r1, [r4, #0x24]
    bl ActorRuntimeAnimationResourceList_Clear
    ldr r1, L_0200bc48
    add r0, r4, #0x14
    str r1, [r4, #0x14]
    bl ActorRuntimeAnimationResourceList_Clear
    ldr r1, L_0200bc48
    add r0, r4, #0x4
    str r1, [r4, #0x4]
    bl ActorRuntimeAnimationResourceList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bc44: .word gActorRuntimeAnimationResourceListsVTable
L_0200bc48: .word gActorRuntimeAnimationResourceListVTable
.size ActorRuntimeAnimationResourceLists_Destroy, . - ActorRuntimeAnimationResourceLists_Destroy

