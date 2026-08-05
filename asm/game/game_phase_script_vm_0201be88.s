; Matching retail form; see src/game/game_phase_script_vm_external_storage_opcodes.c.
.text
.extern gGameWork
.global func_0201be88
func_0201be88: ; 0x0201be88
    ldr r2, [r0, #0x4]
    ldr r1, L_0201bec8
    add ip, r2, #0x1
    str ip, [r0, #0x4]
    ldrb r3, [r2, #0x0]
    add r2, ip, #0x1
    str r2, [r0, #0x4]
    and r2, r3, #0x7
    add r2, r0, r2, lsl #0x2
    ldrb r0, [ip, #0x0]
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0x2c]
    add r0, r1, r0, lsl #0x1
    strh r2, [r0, #0x4c]
    mov r0, #0x0
    bx lr
L_0201bec8: .word gGameWork
.size func_0201be88, . - func_0201be88
