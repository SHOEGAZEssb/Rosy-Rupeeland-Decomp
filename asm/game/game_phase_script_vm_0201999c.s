; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern PackedTimerArray_Get
.extern PackedTimerArray_GetGlobal
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.global GamePhaseActorScriptVm_GetPackedTimerRepeatCount
GamePhaseActorScriptVm_GetPackedTimerRepeatCount:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl PackedTimerArray_GetGlobal
    mov r1, r4
    bl PackedTimerArray_Get
    ldrh r1, [r0, #0x6]
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseActorScriptVm_GetPackedTimerRepeatCount, . - GamePhaseActorScriptVm_GetPackedTimerRepeatCount
