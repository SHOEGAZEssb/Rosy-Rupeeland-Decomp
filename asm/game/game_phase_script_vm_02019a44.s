; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_020313b4
.global GamePhaseActorScriptVm_SetActorFlag1AndApplyStateMode2
GamePhaseActorScriptVm_SetActorFlag1AndApplyStateMode2:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x84]
    mov r2, #0x2
    ldr r3, [r0, #0x14]
    add r1, r0, #0x1ec
    orr r3, r3, #0x1
    str r3, [r0, #0x14]
    bl func_020313b4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GamePhaseActorScriptVm_SetActorFlag1AndApplyStateMode2, . - GamePhaseActorScriptVm_SetActorFlag1AndApplyStateMode2
