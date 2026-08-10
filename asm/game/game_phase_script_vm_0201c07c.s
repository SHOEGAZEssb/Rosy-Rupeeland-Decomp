; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern GamePhaseScriptVm_Push
.global func_0201c07c
func_0201c07c: ; 0x0201c07c
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    add r1, r2, #0x1
    str r1, [r0, #0x4]
    ldrb r1, [r2, #0x0]
    add r1, r0, r1, lsl #0x2
    ldr r1, [r1, #0xc]
    bl GamePhaseScriptVm_Push
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_0201c07c, . - func_0201c07c
