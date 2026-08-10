; Matching retail form; see src/game/game_phase_script_vm_debug_hud_content_opcodes.c.
.text
.extern DebugHudState_SetRectangle
.extern DebugHudState_GetGlobal
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_SetDebugHudRectangle
GamePhaseActorScriptVm_SetDebugHudRectangle:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    add r2, r0, r5
    add r1, r4, r6
    str r0, [sp]
    str r4, [sp, #4]
    str r2, [sp, #8]
    str r1, [sp, #0xc]
    bl DebugHudState_GetGlobal
    add r1, sp, #0
    bl DebugHudState_SetRectangle
    mov r0, #0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size GamePhaseActorScriptVm_SetDebugHudRectangle, . - GamePhaseActorScriptVm_SetDebugHudRectangle
