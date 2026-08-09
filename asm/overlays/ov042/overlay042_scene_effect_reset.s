.text
.extern func_020a1794
.extern func_ov042_02200950
.extern func_020a1ec0
.global func_ov042_02205cb8
func_ov042_02205cb8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x1
    mov r3, #0x0
    str r1, [r4, #0x1b4]
    ldr r0, .L_02205d6c
    str r3, [r4, #0xc4]
    str r0, [r4, #0xe0]
    str r3, [r4, #0x150]
    str r3, [r4, #0x1bc]
    str r3, [r4, #0x1c4]
    str r3, [r4, #0xbc]
    str r3, [r4, #0xc0]
    str r3, [r4, #0x1f0]
    sub r0, r3, #0x1
    str r3, [r4, #0x20c]
    str r0, [r4, #0x228]
    str r0, [r4, #0x224]
    str r3, [r4, #0x230]
    str r3, [r4, #0x22c]
    str r3, [r4, #0x238]
    str r3, [r4, #0x234]
    str r3, [r4, #0x1ec]
    str r1, [r4, #0x1b0]
    str r3, [r4, #0xa8]
    sub r0, r3, #0x82000
    str r0, [r4, #0xac]
    ldr r2, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    add r1, r4, #0xa4
    add r2, r2, #0x2c
    bl func_020a1794
    ldr r2, [r4, #0x4c]
    mov r1, #0x10
    strh r1, [r2, #0x3c]
    mov r0, r4
    strh r1, [r2, #0x3e]
    bl func_ov042_02200950
    ldr r0, [r4, #0x48]
    ldr r1, .L_02205d70
    bl func_020a1ec0
    ldr r0, [r4, #0x48]
    mov r1, #0x4
    str r1, [r0, #0x1c8]
    ldmia sp!, {r4, pc}
.L_02205d6c: .word 0xbb8
.L_02205d70: .word 0xb481
.size func_ov042_02205cb8, . - func_ov042_02205cb8
