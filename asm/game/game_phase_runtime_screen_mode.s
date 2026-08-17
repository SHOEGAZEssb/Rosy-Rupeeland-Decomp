; Matching retail form; see src/game/game_phase_runtime_screen_mode.c for
; the documented portable implementation and recovered behavior.
.text
.extern GamePhaseRuntime_SetPlacementMode
.extern GamePhaseRuntime_RefreshAreaAuxiliaryObject
.extern GamePhaseState_ConfigureMainDisplay
.extern GamePhaseAreaScene_RestoreSubDisplay
.extern func_0201dff0
.extern GameWork_SetFlag
.extern gGameWork

    .global GamePhaseRuntime_ApplyScreenMode
.type GamePhaseRuntime_ApplyScreenMode, @function
GamePhaseRuntime_ApplyScreenMode:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    cmp r4, #0x2
    mov r5, r0
    cmpne r4, #0x0
    bne L_020085b8
    mov r3, #0x4000000
    ldr r0, [r3, #0x0]
    mov r1, r2
    bic r0, r0, #0x1f00
    orr r2, r0, #0x1000
    add r0, r5, #0x24
    str r2, [r3, #0x0]
    bl GamePhaseState_ConfigureMainDisplay
    ldr r0, L_0200865c
    ldr r1, L_02008660
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
L_020085b8:
    sub r0, r4, #0x1
    cmp r0, #0x1
    bhi L_02008638
    ldr r2, L_02008664
    add r0, r5, #0x2000
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_RestoreSubDisplay
    add r0, r5, #0x3000
    ldr r1, [r0, #0xbc]
    mov r0, r5
    mov r2, #0x1
    bl GamePhaseRuntime_RefreshAreaAuxiliaryObject
    add r0, r5, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r5
    mov r1, #0x1
    mov r2, #0x0
    bl GamePhaseRuntime_SetPlacementMode
    mov r2, #0x0
    ldr r1, L_02008668
    ldr r0, L_0200865c
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x39c
    bl GameWork_SetFlag
L_02008638:
    add r0, r5, #0x37c
    mov r1, r4
    add r0, r0, #0x2c00
    bl func_0201dff0
    ldr r0, L_0200865c
    mov r1, #0x3f4
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldmia sp!, {r3, r4, r5, pc}
L_0200865c: .word gGameWork
L_02008660: .word 0x395
L_02008664: .word 0x4001000
L_02008668: .word 0x5000400
    .size GamePhaseRuntime_ApplyScreenMode, .-GamePhaseRuntime_ApplyScreenMode

