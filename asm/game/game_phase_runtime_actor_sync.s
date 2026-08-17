; Matching retail form; see src/game/game_phase_runtime_actor_sync.c for
; the documented portable implementation and recovered behavior.
.text
.extern DisplayController_GetSubScreenVerticalOffset
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern func_02008354
.extern func_02008378
.extern func_020083b0
.extern func_020086f8
.extern GamePhaseRuntime_BuildSecondaryTransform
.extern ActorMotionGameWork_Update
.extern ActorMotionAreaFollower_Update
.extern GamePhaseState_ApplyPlacementState
.extern GamePhaseAreaScene_ApplyPlacementState
.extern GamePhaseAreaScene_GetSubRendererLowCoordinate
.extern GamePhaseAreaScene_GetSubRendererHighCoordinate

    .global GamePhaseRuntime_SynchronizeActorPlacement
.type GamePhaseRuntime_SynchronizeActorPlacement, @function
GamePhaseRuntime_SynchronizeActorPlacement:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x74
    mov r4, r0
    cmp r1, #0x0
    beq L_02008168
    cmp r1, #0x1
    beq L_020081fc
    b L_02008348
L_02008168:
    add r0, r4, #0x3000
    ldrb r0, [r0, #0xcc]
    tst r0, #0x4
    movne r0, #0x0
    bne L_0200834c
    add r0, r4, #0x2000
    ldr r3, [r0, #0xed4]
    mov r1, #0x0
    ldr r2, [r3, #0x20]
    add r0, sp, #0x14
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x14
    mov r2, r2, asr #0x10
    str r2, [sp, #0x0]
    ldr r3, [r3, #0x20]
    mov r2, r1
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x14
    mov r3, r3, asr #0x10
    bl func_020083b0
    add r0, sp, #0x1c
    add r1, sp, #0x14
    bl func_02008354
    add r0, r4, #0x3bc
    add r1, sp, #0x1c
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_Update
    add r0, sp, #0x54
    mov r1, r4
    bl func_020086f8
    add r1, sp, #0x54
    add r0, r4, #0x24
    bl GamePhaseState_ApplyPlacementState
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
    b L_02008348
L_020081fc:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    bne L_0200827c
    bl DisplayController_GetSubScreenVerticalOffset
    mov r2, r0, lsl #0xc
    mov r1, #0x0
    add r0, sp, #0x64
    mov r3, r1
    rsb r2, r2, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x44
    mov r1, r4
    bl func_020086f8
    add r0, sp, #0x34
    add r1, sp, #0x44
    add r2, sp, #0x64
    bl func_02008378
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    add r1, sp, #0x34
    bl GamePhaseAreaScene_ApplyPlacementState
    add r0, sp, #0x34
    bl VecFx32Object_Destroy
    add r0, sp, #0x44
    bl VecFx32Object_Destroy
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    b L_02008348
L_0200827c:
    cmp r0, #0x0
    bne L_020082d4
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_GetSubRendererLowCoordinate
    add r1, r4, #0x2000
    mov r5, r0
    ldr r0, [r1, #0xfb8]
    bl GamePhaseAreaScene_GetSubRendererHighCoordinate
    mov r0, r0, lsl #0x10
    mov ip, r0, asr #0x10
    mov r3, r5, lsl #0x10
    mov r1, #0x0
    add r0, sp, #0xc
    mov r2, r1
    mov r3, r3, asr #0x10
    str ip, [sp, #0x0]
    bl func_020083b0
    add r0, sp, #0x1c
    add r1, sp, #0xc
    bl func_02008354
    b L_020082f8
L_020082d4:
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl func_020083b0
    add r0, sp, #0x1c
    add r1, sp, #0x4
    bl func_02008354
L_020082f8:
    add r0, r4, #0x44
    add r1, sp, #0x1c
    add r0, r0, #0x3000
    bl ActorMotionGameWork_Update
    add r0, r4, #0x3000
    ldr r0, [r0, #0xfc]
    cmp r0, #0x0
    addne r0, r4, #0x2000
    ldrne r0, [r0, #0xfb8]
    cmpne r0, #0x0
    beq L_02008348
    add r0, sp, #0x24
    mov r1, r4
    bl GamePhaseRuntime_BuildSecondaryTransform
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    add r1, sp, #0x24
    bl GamePhaseAreaScene_ApplyPlacementState
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
L_02008348:
    mov r0, #0x0
L_0200834c:
    add sp, sp, #0x74
    ldmia sp!, {r4, r5, pc}
    .size GamePhaseRuntime_SynchronizeActorPlacement, .-GamePhaseRuntime_SynchronizeActorPlacement

