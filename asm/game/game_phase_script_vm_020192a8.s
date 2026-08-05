; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern func_020127f8
.extern gGameWork
.global func_020192a8
func_020192a8:
    stmdb sp!, {r3, lr}
    ldr r1, L_020192c8
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x48]
    rsb r1, r1, #0x0
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020192c8: .word gGameWork
.size func_020192a8, . - func_020192a8
