; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern func_020330fc

    .global func_02013a04
func_02013a04: ; 0x02013a04
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r5, #0x84]
    mov r2, r4
    bl func_020330fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02013a04, . - func_02013a04

