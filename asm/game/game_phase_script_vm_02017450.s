; Matching retail form; see src/game/game_phase_script_vm_debug_hud_content_opcodes.c.
.text
.extern OS_Halt
.extern DebugHudState_SetTextRow
.extern DebugHud_GetTextTableEntry
.extern DebugHudState_GetGlobal
.extern GamePhaseScriptVm_Pop
.extern Actor_GetOwningCollection
.global GamePhaseActorScriptVm_SetDebugHudTextRowFromCollectionMode
GamePhaseActorScriptVm_SetDebugHudTextRowFromCollectionMode:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    ldr r0, [r7, #0x84]
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #1
    beq L_02017490
    cmp r0, #2
    beq L_020174a8
    b L_020174c0
L_02017490:
    bl DebugHudState_GetGlobal
    mov r2, r4
    mov r1, #0
    bl DebugHud_GetTextTableEntry
    mov r6, r0
    b L_020174c4
L_020174a8:
    bl DebugHudState_GetGlobal
    mov r2, r4
    mov r1, #1
    bl DebugHud_GetTextTableEntry
    mov r6, r0
    b L_020174c4
L_020174c0:
    bl OS_Halt
L_020174c4:
    bl DebugHudState_GetGlobal
    mov r1, r5
    mov r2, r6
    bl DebugHudState_SetTextRow
    mov r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size GamePhaseActorScriptVm_SetDebugHudTextRowFromCollectionMode, . - GamePhaseActorScriptVm_SetDebugHudTextRowFromCollectionMode
