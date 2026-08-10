; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_SetAttachmentAnimation

    .global func_02012c14
func_02012c14: ; 0x02012c14
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r4, #0x84]
    bl Actor_SetAttachmentAnimation
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02012c14, . - func_02012c14
