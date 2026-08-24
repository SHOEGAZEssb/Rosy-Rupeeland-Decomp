; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern gActorRuntimeAnimationResourceListVTable
.global ActorRuntimeAnimationResourceList_Init
ActorRuntimeAnimationResourceList_Init:
    ldr r2, L_0200bb84
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
L_0200bb84: .word gActorRuntimeAnimationResourceListVTable
.size ActorRuntimeAnimationResourceList_Init, . - ActorRuntimeAnimationResourceList_Init

