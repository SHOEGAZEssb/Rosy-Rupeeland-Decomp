; Matching retail form; see src/game/game_phase_script_vm_runtime_motion_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern ActorMotion_SetOscillation
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_SetAreaFollowerMotionOscillation
GamePhaseActorScriptVm_SetAreaFollowerMotionOscillation:
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
    ldr r0, L_020170c8
    ldr r0, [r0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetOscillation
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_020170c8: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_SetAreaFollowerMotionOscillation, . - GamePhaseActorScriptVm_SetAreaFollowerMotionOscillation
