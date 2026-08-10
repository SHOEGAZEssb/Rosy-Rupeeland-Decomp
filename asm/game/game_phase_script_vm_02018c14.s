; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_control_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_GetAuxiliaryCollisionResource
.extern func_020573fc
.global GamePhaseActorScriptVm_DispatchActorAuxiliaryCollisionCommand
GamePhaseActorScriptVm_DispatchActorAuxiliaryCollisionCommand:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r5, #0x84]
    bl Actor_GetAuxiliaryCollisionResource
    mov r1, r4
    bl func_020573fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseActorScriptVm_DispatchActorAuxiliaryCollisionCommand, . - GamePhaseActorScriptVm_DispatchActorAuxiliaryCollisionCommand
