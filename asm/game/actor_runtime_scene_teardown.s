; Matching retail form; see src/game/actor_runtime_scene_teardown.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200b8cc
.extern GamePhaseRuntime_GetActorCollection
.extern Actor_SetActive
.extern GameWork_TestFlag
.extern Type7Actor_LeaveSpecialPresentationState
.extern ActorDerivedType1_ResetToBaseState
.extern GameWork_ClearFlag
.extern Actor_GetCollection
.extern ActorCollection_UnregisterAndDestroyActor
.extern func_02030b58
.extern Scene_Destroy
.extern data_020d448c
.extern data_021052fc
.extern gGameWork
.global func_0200b41c
func_0200b41c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_0200b558
    mov r5, r0
    str r1, [r5, #0x0]
    bl func_0200b8cc
    ldr r0, L_0200b55c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r4, [r0, #0xe7c]
    mov r1, #0x0
    mov r0, r4
    bl Actor_SetActive
    ldr r0, L_0200b560
    mov r1, #0x3ec
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r4, #0x230]
    orrne r0, r0, #0x4
    strne r0, [r4, #0x230]
    ldr r1, [r4, #0x10]
    ldr r0, L_0200b55c
    bic r1, r1, #0x1000000
    bic r1, r1, #0x8
    str r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_0200b4a0
    bl Type7Actor_LeaveSpecialPresentationState
L_0200b4a0:
    ldr r0, L_0200b560
    ldr r1, L_0200b564
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b4e8
    ldr r0, L_0200b560
    ldr r1, L_0200b568
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b4e8
    ldr r2, [r4, #0x54]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x20
    strh r1, [r2, #0x24]
    bl ActorDerivedType1_ResetToBaseState
L_0200b4e8:
    ldr r0, L_0200b560
    ldr r1, L_0200b568
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200b560
    mov r1, #0x410
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r4, [r5, #0x24]
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x3
    ldreqh r0, [r4, #0x4e]
    cmpeq r0, #0x2
    bne L_0200b530
    mov r0, r4
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_UnregisterAndDestroyActor
L_0200b530:
    ldr r0, L_0200b55c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x1
    bl func_02030b58
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0200b558: .word data_020d448c
L_0200b55c: .word data_021052fc
L_0200b560: .word gGameWork
L_0200b564: .word 0x3f3
L_0200b568: .word 0x403
.size func_0200b41c, . - func_0200b41c
