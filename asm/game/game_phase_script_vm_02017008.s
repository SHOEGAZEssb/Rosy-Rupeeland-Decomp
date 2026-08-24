; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern ActorMotion_SetOscillation
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_SetRuntimeMotion3044Oscillation
GamePhaseActorScriptVm_SetRuntimeMotion3044Oscillation:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r2, r4
    mov r3, r5
    mov r1, r0
    ldr r0, L_02017054
    ldr r0, [r0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_SetOscillation
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_02017054: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_SetRuntimeMotion3044Oscillation, . - GamePhaseActorScriptVm_SetRuntimeMotion3044Oscillation
