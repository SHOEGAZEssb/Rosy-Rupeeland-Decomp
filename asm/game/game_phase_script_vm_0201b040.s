; Matching retail form; see src/game/game_phase_script_vm_global_state_query_opcodes.c.
.text
.extern func_020127f8
.extern func_0206522c
.extern data_021e9ac0
.global func_0201b040
func_0201b040: ; 0x0201b040
    stmdb sp!, {r4, lr}
    ldr r1, L_0201b06c
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x34
    bl func_0206522c
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201b06c: .word data_021e9ac0
.size func_0201b040, . - func_0201b040
