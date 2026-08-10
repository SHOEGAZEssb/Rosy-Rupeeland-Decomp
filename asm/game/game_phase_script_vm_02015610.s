; Matching retail form; see src/game/game_phase_script_vm_debug_ui_opcodes.c.
.text
.extern DebugHudState_Open
.extern DebugHudState_RefreshRectangle
.extern DebugHudState_GetGlobal
.extern GamePhaseScriptVm_Pop
.extern func_0201d9e4
.extern func_0201da20
.extern func_0201da34
.extern Actor_GetCollection

    .global GamePhaseActorScriptVm_OpenDebugHudFromCollectionMode
GamePhaseActorScriptVm_OpenDebugHudFromCollectionMode: ; 0x02015610
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl func_0201da34
    ldr r0, [r5, #0x84]
    bl Actor_GetCollection
    mov r1, r4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    bl func_0201da20
    mov r5, r0
    mov r0, r6
    bl func_0201d9e4
    mov r4, r0
    bl DebugHudState_GetGlobal
    bl DebugHudState_RefreshRectangle
    bl DebugHudState_GetGlobal
    mov r1, r4
    mov r2, r5
    mov r3, #0x1
    bl DebugHudState_Open
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_OpenDebugHudFromCollectionMode, . - GamePhaseActorScriptVm_OpenDebugHudFromCollectionMode

