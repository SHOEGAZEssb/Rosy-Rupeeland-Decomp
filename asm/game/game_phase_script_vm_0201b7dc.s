; Matching retail form; see src/game/game_phase_script_vm_bitwise_opcodes.c.
.text
.extern func_0201b2b4
.global func_0201b7dc
func_0201b7dc: ; 0x0201b7dc
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x4]
    add ip, r0, #0x2c
    ldrb lr, [r1, #0x0]
    add r3, r1, #0x1
    mov r1, lr, asr #0x4
    and r2, r1, #0x7
    and r1, lr, #0x7
    str r3, [r0, #0x4]
    add r2, r0, r2, lsl #0x2
    ldr r3, [ip, r1, lsl #0x2]
    ldr r2, [r2, #0x2c]
    orr r2, r3, r2
    str r2, [ip, r1, lsl #0x2]
    bl func_0201b2b4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_0201b7dc, . - func_0201b7dc
