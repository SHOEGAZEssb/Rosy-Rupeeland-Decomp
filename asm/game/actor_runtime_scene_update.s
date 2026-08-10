; Matching retail form; see src/game/actor_runtime_scene_update.c for
; the documented portable implementation and recovered behavior.
.text
.extern GamePhaseRuntime_ProcessPendingPresentationRefreshes
.extern GamePhaseRuntime_DispatchActorQueryRequest
.extern GamePhaseRuntime_PrepareActorCollections
.extern func_0200866c
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern GamePhaseRuntime_FinalizeActorCollections
.extern func_0201dcec
.extern func_02008b50
.extern func_02010e68
.extern data_021052fc
.extern gLupyContext
.global func_0200b6c4
func_0200b6c4:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200b7ac
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GamePhaseRuntime_ProcessPendingPresentationRefreshes
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200b6f0
    cmp r0, #0x1
    beq L_0200b754
    b L_0200b774
L_0200b6f0:
    ldr r0, L_0200b7ac
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_DispatchActorQueryRequest
    ldr r0, L_0200b7ac
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl GamePhaseRuntime_PrepareActorCollections
    ldr r0, L_0200b7ac
    ldr r0, [r0, #0x0]
    bl func_0200866c
    ldr r0, L_0200b7ac
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, L_0200b7ac
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r1, [r4, #0x4]
    ldr r0, L_0200b7ac
    mov r2, #0x3
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_FinalizeActorCollections
    b L_0200b774
L_0200b754:
    cmp r4, #0x0
    beq L_0200b76c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200b76c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0200b774:
    ldr r0, L_0200b7ac
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201dcec
    ldr r0, L_0200b7ac
    ldr r0, [r0, #0x0]
    bl func_02008b50
    ldr r0, L_0200b7b0
    ldr r0, [r0, #0x0]
    bl func_02010e68
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200b7ac: .word data_021052fc
L_0200b7b0: .word gLupyContext
.size func_0200b6c4, . - func_0200b6c4
