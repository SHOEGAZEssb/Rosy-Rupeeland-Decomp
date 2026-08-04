; Matching retail form; see src/game/game_phase_script_vm_actor_target_opcodes.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_02006818
.extern func_0200b2c0
.extern func_02032dd4
.extern func_02039db8

    .global func_020137ec
func_020137ec: ; 0x020137ec
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r4, [r0, #0x84]
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_0200b2c0
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_02013854
    mov r0, r4
    bl func_02039db8
L_02013854:
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    add r1, sp, #0x0
    mov r0, r4
    bl func_02032dd4
    add r0, sp, #0x0
    bl func_02005058
    ldr r1, [r4, #0x10]
    add r0, r4, #0x198
    bic r1, r1, #0x40
    str r1, [r4, #0x10]
    bl func_02006818
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_020137ec, . - func_020137ec

