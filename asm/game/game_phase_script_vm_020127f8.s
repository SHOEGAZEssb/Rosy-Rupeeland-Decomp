; Matching retail form; see src/game/game_phase_script_vm_runtime.c.
.text

    .global GamePhaseScriptVm_StoreResultAndUpdateCondition
GamePhaseScriptVm_StoreResultAndUpdateCondition: ; 0x020127f8
    str r1, [r0, #0x48]
    cmp r1, #0x0
    ldrb r1, [r0, #0x7d]
    biceq r1, r1, #0x2
    orrne r1, r1, #0x2
    strb r1, [r0, #0x7d]
    bx lr
    .size GamePhaseScriptVm_StoreResultAndUpdateCondition, . - GamePhaseScriptVm_StoreResultAndUpdateCondition

