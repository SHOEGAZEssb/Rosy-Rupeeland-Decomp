.text
.extern data_020d431c
.extern data_021052fc
.extern FrameTaskList_DestroyNode
.extern OverlaySlot_Destroy
.extern GamePhaseRuntime_DestroyFieldLoader
.extern ActorMotionGameWork_Destroy
.extern ActorMotionAreaFollower_Destroy
.extern GamePhaseState_Destroy
.extern GamePhaseState_UnloadPhase
.extern GamePhaseState_ResetRuntime
.extern DebugHudState_Destroy
.extern DebugHudState_GetGlobal
.extern Sound_StopAllManagedPlayers
.extern func_020ae90c
.extern func_020ae9a4
.extern func_ov056_0220e79c
.extern gSoundContext
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy

    .global GamePhaseRuntime_DestroyAndFree
.type GamePhaseRuntime_DestroyAndFree, @function
GamePhaseRuntime_DestroyAndFree:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_020072d0
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    bl func_020ae9a4
    bl func_020ae90c
    add r0, r4, #0x3000
    ldr r0, [r0, #0xe8]
    cmp r0, #0x0
    beq L_020071e4
    beq L_020071d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_020071d8:
    add r0, r4, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xe8]
L_020071e4:
    add r0, r4, #0x24
    bl GamePhaseState_ResetRuntime
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq L_02007208
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02007208:
    add r0, r4, #0x3000
    ldr r5, [r0, #0xec]
    cmp r5, #0x0
    beq L_02007238
    beq L_0200722c
    mov r0, r5
    bl func_ov056_0220e79c
    mov r0, r5
    bl Heap_Free
L_0200722c:
    add r0, r4, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xec]
L_02007238:
    add r0, r4, #0x24
    bl GamePhaseState_UnloadPhase
    mov r0, r4
    bl GamePhaseRuntime_DestroyFieldLoader
    bl DebugHudState_GetGlobal
    bl DebugHudState_Destroy
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    ldr r0, L_020072d4
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    ldr r0, [r0, #0x4]
    bl FrameTaskList_DestroyNode
    ldr r0, L_020072d8
    ldr r0, [r0, #0x0]
    bl Sound_StopAllManagedPlayers
    add r0, r4, #0x30c0
    bl OverlaySlot_Destroy
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl ActorMotionGameWork_Destroy
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_Destroy
    add r0, r4, #0x24
    bl GamePhaseState_Destroy
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_020072d0: .word data_020d431c
L_020072d4: .word data_021052fc
L_020072d8: .word gSoundContext
    .size GamePhaseRuntime_DestroyAndFree, .-GamePhaseRuntime_DestroyAndFree

