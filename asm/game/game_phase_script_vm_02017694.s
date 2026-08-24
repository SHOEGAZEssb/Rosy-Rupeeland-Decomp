; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_DispatchRuntimeObjectSlot9
GamePhaseActorScriptVm_DispatchRuntimeObjectSlot9:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_020176c4
    mov r1, r0
    ldr r0, [r2]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r2, [r0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0
    ldmia sp!, {r3, pc}
L_020176c4: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_DispatchRuntimeObjectSlot9, . - GamePhaseActorScriptVm_DispatchRuntimeObjectSlot9
