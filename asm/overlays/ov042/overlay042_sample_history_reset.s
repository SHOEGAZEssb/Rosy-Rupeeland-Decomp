.text
.global func_ov042_02200950
func_ov042_02200950:
    mov r2, #0x0
    mov r1, #0x18
    str r2, [r0, #0xe8]
    mov r2, #0x40
    str r2, [r0, #0xec]
    sub r3, r1, #0x1
.L_02200968:
    add r1, r0, r3, lsl #0x2
    str r2, [r1, #0xf0]
    subs r3, r3, #0x1
    bpl .L_02200968
    mov r1, #0x3
    sub r3, r1, #0x1
.L_02200980:
    add r1, r0, r3, lsl #0x2
    ldr r2, [r1, #0x5c]
    subs r3, r3, #0x1
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    bpl .L_02200980
    bx lr
.size func_ov042_02200950, . - func_ov042_02200950
