; Matching retail form; see src/game/game_phase_script_vm_runtime_control_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_ApplyScreenMode
.global GamePhaseActorScriptVm_SelectRuntimeScreenMode0
GamePhaseActorScriptVm_SelectRuntimeScreenMode0:
    stmdb sp!, {r3, lr}
    ldr r0, L_0201770c
    mov r1, #0
    ldr r0, [r0]
    mov r2, #1
    bl GamePhaseRuntime_ApplyScreenMode
    mov r0, #0
    ldmia sp!, {r3, pc}
L_0201770c: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_SelectRuntimeScreenMode0, . - GamePhaseActorScriptVm_SelectRuntimeScreenMode0
