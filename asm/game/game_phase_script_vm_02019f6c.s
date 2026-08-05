; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern data_021f5f18
.extern func_02012704
.extern func_020983c0
.global func_02019f6c
func_02019f6c:
    stmdb sp!, {r3, lr}
    bl func_02012704
    mov r1, r0
    ldr r0, L_02019f88
    bl func_020983c0
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019f88: .word data_021f5f18
.size func_02019f6c, . - func_02019f6c
