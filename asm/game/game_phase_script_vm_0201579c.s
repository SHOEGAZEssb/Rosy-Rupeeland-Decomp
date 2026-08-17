; Matching retail form; see src/game/game_phase_script_vm_debug_object_opcodes.c.
.text
.extern data_021f3ecc
.extern DebugHudState_Open
.extern DebugHudState_RefreshRectangle
.extern DebugHudState_GetGlobal
.extern GamePhaseScriptVm_Pop
.extern DisplayRouting_MatchesRequest
.extern func_0201da34
.extern func_020791e0

    .global GamePhaseActorScriptVm_OpenDebugHudFromLookupTables
GamePhaseActorScriptVm_OpenDebugHudFromLookupTables: ; 0x0201579c
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
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, L_02015814
    bl func_020791e0
    mov r5, r0
    mov r0, r6
    bl DisplayRouting_MatchesRequest
    mov r4, r0
    bl DebugHudState_GetGlobal
    bl DebugHudState_RefreshRectangle
    bl DebugHudState_GetGlobal
    mov r1, r4
    mov r2, r5
    mov r3, #0x1
    bl DebugHudState_Open
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02015814: .word data_021f3ecc
    .size GamePhaseActorScriptVm_OpenDebugHudFromLookupTables, . - GamePhaseActorScriptVm_OpenDebugHudFromLookupTables

