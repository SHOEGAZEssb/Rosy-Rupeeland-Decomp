; Matching retail form; see src/game/actor_runtime_object_lists_cleanup.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorInteractionRuntime_Shutdown
.extern ActorRuntimeAnimationResourceList_Clear
.global ActorRuntimeAnimationResourceLists_ClearCategory1
ActorRuntimeAnimationResourceLists_ClearCategory1:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl ActorInteractionRuntime_Shutdown
    ldr r0, [r5, #0x20]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r4, [r5, #0x18]
    b L_0200bd58
L_0200bd3c:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200bd54
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200bd54:
    ldr r4, [r4, #0x0]
L_0200bd58:
    cmp r4, #0x0
    bne L_0200bd3c
    add r0, r5, #0x14
    bl ActorRuntimeAnimationResourceList_Clear
    ldmia sp!, {r3, r4, r5, pc}
.size ActorRuntimeAnimationResourceLists_ClearCategory1, . - ActorRuntimeAnimationResourceLists_ClearCategory1

