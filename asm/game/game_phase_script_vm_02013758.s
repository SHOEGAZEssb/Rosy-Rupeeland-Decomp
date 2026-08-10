; Matching retail form; see src/game/game_phase_script_vm_actor_flag_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02013758
func_02013758: ; 0x02013758
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x0
    ldr r0, [r4, #0x84]
    ldrne r1, [r0, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x80
    ldreq r1, [r0, #0x54]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x80
    strh r0, [r1, #0x24]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013758, . - func_02013758

