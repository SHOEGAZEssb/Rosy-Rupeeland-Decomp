; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern SignedAbsoluteValueVariant
.global GamePhaseActorScriptVm_GetAbsoluteValue
GamePhaseActorScriptVm_GetAbsoluteValue:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    bl SignedAbsoluteValueVariant
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_GetAbsoluteValue, . - GamePhaseActorScriptVm_GetAbsoluteValue
