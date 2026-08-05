; Matching retail form; see src/game/game_phase_script_vm_branch_misc_opcodes.c.
.text
.extern func_0201b2b4
.global func_0201b8fc
func_0201b8fc: ; 0x0201b8fc
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    ldrb r1, [r2], #0x1
    str r2, [r0, #0x4]
    and r1, r1, #0x7
    add r3, r0, r1, lsl #0x2
    ldr r2, [r3, #0x2c]
    mvn r2, r2
    str r2, [r3, #0x2c]
    bl func_0201b2b4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_0201b8fc, . - func_0201b8fc
