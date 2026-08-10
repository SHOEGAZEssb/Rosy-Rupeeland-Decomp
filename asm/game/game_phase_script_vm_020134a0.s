; Matching retail form; see src/game/game_phase_script_vm_movement_status_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult

    .global GamePhaseActorScriptVm_IsMovementActive
GamePhaseActorScriptVm_IsMovementActive: ; 0x020134a0
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x84]
    ldr r1, [r1, #0x10]
    tst r1, #0x40
    beq L_020134c0
    mov r1, #0x1
    bl GamePhaseScriptVm_SetResult
    b L_020134c8
L_020134c0:
    mov r1, #0x0
    bl GamePhaseScriptVm_SetResult
L_020134c8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size GamePhaseActorScriptVm_IsMovementActive, . - GamePhaseActorScriptVm_IsMovementActive

