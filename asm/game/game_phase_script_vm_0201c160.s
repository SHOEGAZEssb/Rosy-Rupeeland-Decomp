; Matching retail form; see src/game/game_phase_script_vm_stack_storage_opcodes.c.
.text
.extern func_02012720
.global func_0201c160
func_0201c160: ; 0x0201c160
    stmdb sp!, {r3, lr}
    mov r1, #0x0
    bl func_02012720
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_0201c160, . - func_0201c160
