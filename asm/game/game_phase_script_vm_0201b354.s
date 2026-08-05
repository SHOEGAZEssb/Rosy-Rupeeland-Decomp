; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.global func_0201b354
func_0201b354: ; 0x0201b354
    ldr r1, [r0, #0x4]
    add r2, r1, #0x1
    str r2, [r0, #0x4]
    ldrb ip, [r1, #0x0]
    add r1, r2, #0x1
    str r1, [r0, #0x4]
    ldrsb r2, [r2, #0x0]
    ldr r3, [r0, #0x80]
    and r1, ip, #0x7
    ldr r2, [r3, r2, lsl #0x2]
    add r1, r0, r1, lsl #0x2
    mov r0, #0x0
    str r2, [r1, #0x2c]
    bx lr
.size func_0201b354, . - func_0201b354
