; Matching retail form; see src/game/game_phase_script_vm_actor_flag_opcodes.c.
.text
.extern func_02012704

    .global func_020136fc
func_020136fc: ; 0x020136fc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    cmp r0, #0x0
    ldr r0, [r1, #0x10]
    beq L_02013734
    orr r0, r0, #0x10
    str r0, [r1, #0x10]
    ldr r0, [r4, #0x84]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x40
    b L_0201374c
L_02013734:
    bic r0, r0, #0x10
    str r0, [r1, #0x10]
    ldr r0, [r4, #0x84]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x40
L_0201374c:
    strh r0, [r1, #0x24]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_020136fc, . - func_020136fc

