; Matching retail form; see src/game/game_phase_script_vm_final_runtime_opcodes.c.
.text
.extern func_020127f8
.extern func_0204fc6c
.global func_0201b0d4
func_0201b0d4: ; 0x0201b0d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fc6c
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201b0d4, . - func_0201b0d4
