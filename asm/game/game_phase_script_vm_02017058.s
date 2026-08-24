; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern ActorMotion_ClearOscillation
.global GamePhaseActorScriptVm_ClearRuntimeMotion3044Oscillation
GamePhaseActorScriptVm_ClearRuntimeMotion3044Oscillation:
    stmdb sp!, {r3, lr}
    ldr r0, L_02017078
    ldr r0, [r0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_ClearOscillation
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02017078: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_ClearRuntimeMotion3044Oscillation, . - GamePhaseActorScriptVm_ClearRuntimeMotion3044Oscillation
