; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern data_021052fc
.extern ActorMotion_ClearOscillation
.global GamePhaseActorScriptVm_ClearRuntimeMotion2fbcOscillation
GamePhaseActorScriptVm_ClearRuntimeMotion2fbcOscillation:
    stmdb sp!, {r3, lr}
    ldr r0, L_020170ec
    ldr r0, [r0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_ClearOscillation
    mov r0, #0
    ldmia sp!, {r3, pc}
L_020170ec: .word data_021052fc
    .size GamePhaseActorScriptVm_ClearRuntimeMotion2fbcOscillation, . - GamePhaseActorScriptVm_ClearRuntimeMotion2fbcOscillation
