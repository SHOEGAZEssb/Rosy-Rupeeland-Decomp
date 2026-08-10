; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern PackedTimer_MarkComplete
.extern PackedTimerArray_Get
.extern PackedTimerArray_GetGlobal
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_MarkPackedTimerComplete
GamePhaseActorScriptVm_MarkPackedTimerComplete:
    stmdb sp!, {r4, lr}
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl PackedTimerArray_GetGlobal
    mov r1, r4
    bl PackedTimerArray_Get
    bl PackedTimer_MarkComplete
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_MarkPackedTimerComplete, . - GamePhaseActorScriptVm_MarkPackedTimerComplete
