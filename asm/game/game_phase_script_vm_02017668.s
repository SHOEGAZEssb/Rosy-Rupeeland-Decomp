; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseAreaScene_SetEnabled
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_SetAreaSceneEnabled
GamePhaseActorScriptVm_SetAreaSceneEnabled:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02017690
    mov r1, r0
    ldr r0, [r2]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02017690: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_SetAreaSceneEnabled, . - GamePhaseActorScriptVm_SetAreaSceneEnabled
