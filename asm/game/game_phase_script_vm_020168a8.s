; Matching retail form; see src/game/game_phase_script_vm_runtime_misc_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern Type7AuxiliaryPresentation_BeginShutdown
.global GamePhaseActorScriptVm_BeginRuntimeActorAuxiliaryShutdown
GamePhaseActorScriptVm_BeginRuntimeActorAuxiliaryShutdown:
    stmdb sp!, {r3, lr}
    ldr r0, L_020168cc
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x270]
    bl Type7AuxiliaryPresentation_BeginShutdown
    mov r0, #0
    ldmia sp!, {r3, pc}
L_020168cc: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_BeginRuntimeActorAuxiliaryShutdown, . - GamePhaseActorScriptVm_BeginRuntimeActorAuxiliaryShutdown
