; Matching retail form; see src/game/game_phase_script_vm_sound_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GameWork_SelectWeightedValueFromTable
.global GamePhaseActorScriptVm_SelectWeightedGameWorkValue
GamePhaseActorScriptVm_SelectWeightedGameWorkValue:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    bl GameWork_SelectWeightedValueFromTable
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GamePhaseActorScriptVm_SelectWeightedGameWorkValue, . - GamePhaseActorScriptVm_SelectWeightedGameWorkValue
