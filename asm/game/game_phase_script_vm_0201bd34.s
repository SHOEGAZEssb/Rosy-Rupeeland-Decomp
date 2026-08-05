; Matching retail form; see src/game/game_phase_script_vm_comparison_opcodes.c.
.text
.extern func_0201b278
.global func_0201bd34
func_0201bd34: ; 0x0201bd34
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    ldrb r1, [r1, #0x0]
    and r5, r1, #0x7
    bl func_0201b278
    ldr r1, [r4, #0x4]
    add r2, r4, r5, lsl #0x2
    add r1, r1, #0x4
    str r1, [r4, #0x4]
    ldr r1, [r2, #0x2c]
    cmp r1, r0
    ldrb r1, [r4, #0x7d]
    movle r0, #0x1
    movgt r0, #0x0
    orrle r1, r1, #0x2
    bicgt r1, r1, #0x2
    strb r1, [r4, #0x7d]
    str r0, [r2, #0x2c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_0201bd34, . - func_0201bd34
