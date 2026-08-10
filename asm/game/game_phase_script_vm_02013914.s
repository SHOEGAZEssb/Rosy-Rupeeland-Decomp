; Matching retail form; see src/game/game_phase_script_vm_actor_target_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02013914
func_02013914: ; 0x02013914
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, [r4, #0x84]
    strb r0, [r1, #0xe6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013914, . - func_02013914

