.text
.extern func_ov044_0220c880

    .global func_ov044_0220d20c
func_ov044_0220d20c:
    stmdb sp!, {r3, lr}
    bl func_ov044_0220c880
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov044_0220d20c, . - func_ov044_0220d20c

    .global func_ov044_0220d21c
func_ov044_0220d21c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq .L_0220d280
    ldr r0, [r4, #0x23c]
    cmp r0, #0x0
    beq .L_0220d250
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    b .L_0220d268
.L_0220d250:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_0220d268:
    ldr r2, .L_0220d288
    ldr r0, [r4, #0x4c]
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
.L_0220d280:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220d288: .word 0x4001000
.size func_ov044_0220d21c, . - func_ov044_0220d21c
