.text
.extern func_ov042_02200950
.global func_ov042_022008f8
func_ov042_022008f8:
    stmdb sp!, {r3, lr}
    mov ip, #0x0
    mov r1, #0x2
    str ip, [r0, #0x1bc]
    str r1, [r0, #0x1b4]
    str ip, [r0, #0xbc]
    str ip, [r0, #0xc0]
    str ip, [r0, #0xc4]
    str ip, [r0, #0x1f0]
    str ip, [r0, #0x150]
    add r1, r1, #0x580
    str r1, [r0, #0xe0]
    mov r3, #0x1
    str r3, [r0, #0x1b0]
    ldr r2, [r0, #0x48]
    ldr r1, .L_0220094c
    str r3, [r2, #0x1e8]
    str ip, [r0, #0xa8]
    str r1, [r0, #0xac]
    bl func_ov042_02200950
    ldmia sp!, {r3, pc}
.L_0220094c: .word 0xffd12000
.size func_ov042_022008f8, . - func_ov042_022008f8
