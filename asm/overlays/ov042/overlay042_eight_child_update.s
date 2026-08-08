.text
.extern func_ov042_0220a914
    .global func_ov042_0220a9c4
func_ov042_0220a9c4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x8
    mov r5, r0
    sub r4, r1, #0x1
.L_0220a9d4:
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x4c]
    ldrh r0, [r1, #0x42]
    tst r0, #0x4
    bne .L_0220aa0c
    ldrh r0, [r1, #0x40]
    sub r0, r0, #0x1
    cmp r0, #0x0
    andgt r0, r0, #0xff
    strgth r0, [r1, #0x40]
    bgt .L_0220aa0c
    mov r0, r5
    mov r1, r4
    bl func_ov042_0220a914
.L_0220aa0c:
    subs r4, r4, #0x1
    bpl .L_0220a9d4
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov042_0220a9c4, . - func_ov042_0220a9c4
