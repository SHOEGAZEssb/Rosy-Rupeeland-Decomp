; Matching retail form; see src/game/game_phase_script_vm_external_storage_opcodes.c.
.text
.extern gGameWork
.global func_0201bf3c
func_0201bf3c: ; 0x0201bf3c
    ldr r2, [r0, #0x4]
    ldr r1, L_0201bf7c
    add ip, r2, #0x1
    str ip, [r0, #0x4]
    ldrb r3, [r2, #0x0]
    add r2, ip, #0x1
    str r2, [r0, #0x4]
    ldrb r2, [ip, #0x0]
    ldr r1, [r1, #0x0]
    and r3, r3, #0x7
    add r1, r1, r2, lsl #0x1
    ldrsh r1, [r1, #0x4c]
    add r0, r0, r3, lsl #0x2
    str r1, [r0, #0x2c]
    mov r0, #0x0
    bx lr
L_0201bf7c: .word gGameWork
.size func_0201bf3c, . - func_0201bf3c
