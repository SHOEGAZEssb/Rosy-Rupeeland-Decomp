; Matching retail form; see src/game/actor_runtime_scene_teardown.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeScene_DeactivateNonType1Actors
.extern GamePhaseRuntime_GetActorCollection
.extern Actor_SetActive
.extern GameWork_TestFlag
.extern Type7Actor_LeaveSpecialPresentationState
.extern ActorDerivedType1_ResetToBaseState
.extern GameWork_ClearFlag
.extern Actor_GetOwningCollection
.extern ActorCollection_UnregisterAndDestroyActor
.extern ActorCollection_SetFlagBit1
.extern Scene_Destroy
.extern Heap_Free
.extern gActorRuntimeSceneVTable
.extern gGamePhaseRuntime
.extern gGameWork
.global ActorRuntimeScene_DestroyAndFree
ActorRuntimeScene_DestroyAndFree:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_0200b6b0
    mov r5, r0
    str r1, [r5, #0x0]
    bl ActorRuntimeScene_DeactivateNonType1Actors
    ldr r0, L_0200b6b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r4, [r0, #0xe7c]
    mov r1, #0x0
    mov r0, r4
    bl Actor_SetActive
    ldr r0, L_0200b6b8
    mov r1, #0x3ec
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r4, #0x230]
    orrne r0, r0, #0x4
    strne r0, [r4, #0x230]
    ldr r1, [r4, #0x10]
    ldr r0, L_0200b6b4
    bic r1, r1, #0x1000000
    bic r1, r1, #0x8
    str r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_0200b5f0
    bl Type7Actor_LeaveSpecialPresentationState
L_0200b5f0:
    ldr r0, L_0200b6b8
    ldr r1, L_0200b6bc
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b638
    ldr r0, L_0200b6b8
    ldr r1, L_0200b6c0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b638
    ldr r2, [r4, #0x54]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x20
    strh r1, [r2, #0x24]
    bl ActorDerivedType1_ResetToBaseState
L_0200b638:
    ldr r0, L_0200b6b8
    ldr r1, L_0200b6c0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200b6b8
    mov r1, #0x410
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r4, [r5, #0x24]
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x3
    ldreqh r0, [r4, #0x4e]
    cmpeq r0, #0x2
    bne L_0200b680
    mov r0, r4
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_UnregisterAndDestroyActor
L_0200b680:
    ldr r0, L_0200b6b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x1
    bl ActorCollection_SetFlagBit1
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0200b6b0: .word gActorRuntimeSceneVTable
L_0200b6b4: .word gGamePhaseRuntime
L_0200b6b8: .word gGameWork
L_0200b6bc: .word 0x3f3
L_0200b6c0: .word 0x403
.size ActorRuntimeScene_DestroyAndFree, . - ActorRuntimeScene_DestroyAndFree
