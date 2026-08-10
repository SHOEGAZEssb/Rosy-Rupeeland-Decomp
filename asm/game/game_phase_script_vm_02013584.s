; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02013584
func_02013584: ; 0x02013584
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, [r4, #0x84]
    str r0, [r1, #0x40]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013584, . - func_02013584

