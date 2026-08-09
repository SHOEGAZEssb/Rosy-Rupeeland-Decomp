.text
.extern func_0209189c
.extern func_020918f4
.extern func_02072b68
.extern func_ov045_0220c068

.global func_ov045_0220c1ac
func_ov045_0220c1ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x28]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_mode1
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_mode5
.L_mode1:
    add r0, r4, #0x34
    mov r1, #0x1e
    mov r2, #0xf0
    bl func_0209189c
    str r0, [r4, #0x2c]
    mov r0, #0x5
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
.L_mode5:
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_wait_complete
    subs r0, r1, #0x1
    str r0, [r4, #0x2c]
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x34
    mov r1, #0x3
    bl func_020918f4
    cmp r0, #0x0
    ldr r0, [r4, #0x20]
    beq .L_animation5
    mov r1, #0x4
    bl func_02072b68
    b .L_clear_flags
.L_animation5:
    mov r1, #0x5
    bl func_02072b68
.L_clear_flags:
    ldr r1, [r4, #0x20]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_wait_complete:
    ldr r1, [r4, #0x20]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldmeqia sp!, {r4, pc}
    bl func_ov045_0220c068
    ldmia sp!, {r4, pc}
.size func_ov045_0220c1ac, . - func_ov045_0220c1ac
