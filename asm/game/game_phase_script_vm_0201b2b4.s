; Matching retail form; see src/game/game_phase_script_vm_control_flow_opcodes.c.
.text
.global func_0201b2b4
func_0201b2b4: ; 0x0201b2b4
    add r1, r0, r1, lsl #0x2
    ldr r1, [r1, #0x2c]
    cmp r1, #0x0
    ldrb r1, [r0, #0x7d]
    bicne r1, r1, #0x2
    orreq r1, r1, #0x2
    strb r1, [r0, #0x7d]
    bx lr
.size func_0201b2b4, . - func_0201b2b4
