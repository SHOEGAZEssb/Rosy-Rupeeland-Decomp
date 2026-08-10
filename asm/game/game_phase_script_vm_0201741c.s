; Matching retail form; see src/game/game_phase_script_vm_debug_hud_content_opcodes.c.
.text
.extern DebugHudState_SetNumberRow
.extern DebugHudState_GetGlobal
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_SetDebugHudNumberRow
GamePhaseActorScriptVm_SetDebugHudNumberRow:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl DebugHudState_GetGlobal
    mov r1, r4
    mov r2, r5
    bl DebugHudState_SetNumberRow
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_SetDebugHudNumberRow, . - GamePhaseActorScriptVm_SetDebugHudNumberRow
