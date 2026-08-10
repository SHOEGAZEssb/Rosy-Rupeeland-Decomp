; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern GraphicsSpriteGroup_ReleaseState
.global GamePhaseActorScriptVm_DestroySecondaryPresentationAndClearFlag1
GamePhaseActorScriptVm_DestroySecondaryPresentationAndClearFlag1:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x84]
    ldr r1, [r0, #0x58]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r1, [r4, #0x84]
    mov r0, #0x0
    str r0, [r1, #0x58]
    ldr r2, [r4, #0x84]
    ldr r1, [r2, #0x14]
    bic r1, r1, #0x1
    str r1, [r2, #0x14]
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_DestroySecondaryPresentationAndClearFlag1, . - GamePhaseActorScriptVm_DestroySecondaryPresentationAndClearFlag1
