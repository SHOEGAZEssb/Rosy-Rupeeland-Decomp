; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_02001f40
.extern func_020020ec
.extern func_020021c4
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_TriggerManagerEntrySecondOperation
GamePhaseActorScriptVm_TriggerManagerEntrySecondOperation:
    stmdb sp!, {r4, lr}
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl func_020021c4
    mov r1, r4
    bl func_020020ec
    bl func_02001f40
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_TriggerManagerEntrySecondOperation, . - GamePhaseActorScriptVm_TriggerManagerEntrySecondOperation
