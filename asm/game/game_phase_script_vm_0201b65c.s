; Matching retail form; see src/game/game_phase_script_vm_multiply_divide_opcodes.c.
.text
.extern func_0201b278
.extern func_020befec
.extern func_0201b2b4
.global func_0201b65c
func_0201b65c: ; 0x0201b65c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x4]
    add r0, r1, #0x1
    str r0, [r6, #0x4]
    ldrb r5, [r1, #0x0]
    bl func_0201b278
    ldr r1, [r6, #0x4]
    add r4, r6, #0x2c
    add r1, r1, #0x4
    str r1, [r6, #0x4]
    mov r1, r0
    ldr r0, [r4, r5, lsl #0x2]
    bl func_020befec
    str r0, [r4, r5, lsl #0x2]
    mov r0, r6
    mov r1, r5
    bl func_0201b2b4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_0201b65c, . - func_0201b65c
