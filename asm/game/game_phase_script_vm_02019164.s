; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern gGamePhaseTouchPromptTaskNode
.extern GamePhaseTouchPrompt_SetEnabled
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_SetTouchPromptEnabled
GamePhaseActorScriptVm_SetTouchPromptEnabled:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02019188
    mov r1, r0
    ldr r0, [r2, #0x0]
    ldr r0, [r0, #0x8]
    bl GamePhaseTouchPrompt_SetEnabled
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019188: .word gGamePhaseTouchPromptTaskNode
.size GamePhaseActorScriptVm_SetTouchPromptEnabled, . - GamePhaseActorScriptVm_SetTouchPromptEnabled
