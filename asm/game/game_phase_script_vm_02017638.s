; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseScriptVm_Pop
.extern ActorCollection_SetEnabled
.global GamePhaseActorScriptVm_SetRuntimeCollection2Enabled
GamePhaseActorScriptVm_SetRuntimeCollection2Enabled:
    stmdb sp!, {r4, lr}
    bl GamePhaseScriptVm_Pop
    ldr r1, L_02017664
    mov r4, r0
    ldr r0, [r1]
    mov r1, #2
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r4
    bl ActorCollection_SetEnabled
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02017664: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_SetRuntimeCollection2Enabled, . - GamePhaseActorScriptVm_SetRuntimeCollection2Enabled
