.text
.extern func_ov042_0220ab98
    .global func_ov042_0220abc0
func_ov042_0220abc0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x28
    mov r5, r0
    sub r4, r1, #0x1
.L_0220abd0:
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x4c]
    ldrh r0, [r1, #0x42]
    tst r0, #0x4
    bne .L_0220ac08
    ldr r0, [r1, #0xc]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0220ac08
    mov r0, r5
    mov r1, r4
    bl func_ov042_0220ab98
.L_0220ac08:
    subs r4, r4, #0x1
    bpl .L_0220abd0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov042_0220abc0, . - func_ov042_0220abc0
