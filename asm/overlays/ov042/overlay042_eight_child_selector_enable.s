.text
.extern func_0209a2ac
    .global func_ov042_0220aa18
func_ov042_0220aa18:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r7, r0
    bl func_0209a2ac
    mov r0, #0x8
    sub r5, r0, #0x1
    mov r4, #0x1
.L_0220aa3c:
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, r6
    mov r2, r4
    bl func_0209a2ac
    subs r5, r5, #0x1
    bpl .L_0220aa3c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_ov042_0220aa18, . - func_ov042_0220aa18
