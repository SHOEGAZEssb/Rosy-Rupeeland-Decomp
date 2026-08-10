; Matching retail form; see src/game/game_phase_script_vm_actor_runtime_display_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.global func_0201853c
func_0201853c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, [r4, #0x84]
    cmp r0, #0x0
    ldrne r0, [r1, #0x14]
    orrne r0, r0, #0x10
    ldreq r0, [r1, #0x14]
    biceq r0, r0, #0x10
    str r0, [r1, #0x14]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201853c, . - func_0201853c
