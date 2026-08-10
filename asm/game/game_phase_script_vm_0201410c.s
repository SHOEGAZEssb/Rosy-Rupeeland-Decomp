; Matching retail form; see src/game/game_phase_script_vm_actor_position_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_TranslateSecondaryBounds

    .global GamePhaseActorScriptVm_TranslateSecondaryBounds
GamePhaseActorScriptVm_TranslateSecondaryBounds: ; 0x0201410c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r5, #0x84]
    mov r2, r4
    bl Actor_TranslateSecondaryBounds
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_TranslateSecondaryBounds, . - GamePhaseActorScriptVm_TranslateSecondaryBounds
