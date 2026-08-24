; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeAnimationResourceList_Clear
.extern gActorRuntimeAnimationResourceListVTable
.global ActorRuntimeAnimationResourceList_Destroy
ActorRuntimeAnimationResourceList_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bba4
    mov r4, r0
    str r1, [r4, #0x0]
    bl ActorRuntimeAnimationResourceList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bba4: .word gActorRuntimeAnimationResourceListVTable
.size ActorRuntimeAnimationResourceList_Destroy, . - ActorRuntimeAnimationResourceList_Destroy

