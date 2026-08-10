; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern GamePhaseScriptVm_Push
.global func_0201c054
func_0201c054: ; 0x0201c054
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    add r1, r2, #0x1
    str r1, [r0, #0x4]
    ldrb r1, [r2, #0x0]
    ldr r2, [r0, #0x80]
    ldr r1, [r2, r1, lsl #0x2]
    bl GamePhaseScriptVm_Push
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_0201c054, . - func_0201c054
