; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_020020ec
.extern func_020021c4
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.global func_0201999c
func_0201999c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl func_020021c4
    mov r1, r4
    bl func_020020ec
    ldrh r1, [r0, #0x6]
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_0201999c, . - func_0201999c
