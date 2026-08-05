; Matching retail form; see src/game/game_phase_script_vm_register_transfer_opcodes.c.
.text
.extern func_0201b278
.global func_0201b424
func_0201b424: ; 0x0201b424
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    add r0, r1, #0x1
    str r0, [r5, #0x4]
    ldrb r4, [r1, #0x0]
    bl func_0201b278
    ldr r2, [r5, #0x4]
    add r1, r5, r4, lsl #0x2
    add r2, r2, #0x4
    str r2, [r5, #0x4]
    str r0, [r1, #0x2c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_0201b424, . - func_0201b424
