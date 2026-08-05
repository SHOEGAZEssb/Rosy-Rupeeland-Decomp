; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.global func_0201b320
func_0201b320: ; 0x0201b320
    ldr r1, [r0, #0x4]
    ldrb ip, [r1, #0x0]
    add r3, r1, #0x1
    mov r1, ip, asr #0x4
    and r2, r1, #0x7
    str r3, [r0, #0x4]
    add r2, r0, r2, lsl #0x2
    and r1, ip, #0x7
    add r1, r0, r1, lsl #0x2
    ldr r2, [r2, #0x2c]
    mov r0, #0x0
    str r2, [r1, #0x2c]
    bx lr
.size func_0201b320, . - func_0201b320
