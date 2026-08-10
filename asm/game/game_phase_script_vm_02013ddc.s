; Matching retail form; see src/game/game_phase_script_vm_actor_local_state_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern func_02013dfc

    .global func_02013ddc
func_02013ddc: ; 0x02013ddc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r4, #0x84]
    bl func_02013dfc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013ddc, . - func_02013ddc

