; Matching retail form; see src/game/game_phase_script_vm_branch_misc_opcodes.c.
.text
.extern func_0201b278
.global func_0201b958
func_0201b958: ; 0x0201b958
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x7d]
    tst r0, #0x2
    ldr r0, [r4, #0x4]
    addne r0, r0, #0x4
    bne L_0201b978
    bl func_0201b278
L_0201b978:
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201b958, . - func_0201b958
