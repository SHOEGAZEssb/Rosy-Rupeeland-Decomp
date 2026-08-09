.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_022100c0
.extern func_ov059_022100dc
.extern func_ov059_022100f8

.global func_ov059_02210308
func_ov059_02210308:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x54]
    cmp r1, #0x1
    beq .L_0221032c
    cmp r1, #0x2
    beq .L_022103bc
    cmp r1, #0x3
    beq .L_0221044c
    ldmia sp!, {r3, pc}
.L_0221032c:
    ldr r1, [r0, #0x5c]
    ldr r3, .L_022104dc
    cmp r1, #0x0
    beq .L_02210360
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    b .L_02210380
.L_02210360:
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
.L_02210380:
    ldr r3, [r0, #0x68]
    mvn r1, #0x17
    sub lr, r1, r3
    ldr ip, [r0, #0x6c]
    sub r2, r1, #0x15
    sub r2, r2, ip
    ldr r3, .L_022104e0
    and ip, lr, r1, lsr #0x17
    and r2, r3, r2, lsl #0x10
    ldr r1, .L_022104e4
    orr r2, ip, r2
    str r2, [r1, #0x0]
    ldr r0, [r0, #0x58]
    bl func_ov059_022100c0
    ldmia sp!, {r3, pc}
.L_022103bc:
    ldr r1, [r0, #0x5c]
    ldr r3, .L_022104dc
    cmp r1, #0x0
    beq .L_022103f0
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    b .L_02210410
.L_022103f0:
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
.L_02210410:
    ldr r3, [r0, #0x68]
    mvn r1, #0x17
    sub lr, r1, r3
    ldr ip, [r0, #0x6c]
    sub r2, r1, #0x15
    sub r2, r2, ip
    ldr r3, .L_022104e0
    and ip, lr, r1, lsr #0x17
    and r2, r3, r2, lsl #0x10
    ldr r1, .L_022104e8
    orr r2, ip, r2
    str r2, [r1, #0x0]
    ldr r0, [r0, #0x58]
    bl func_ov059_022100dc
    ldmia sp!, {r3, pc}
.L_0221044c:
    ldr r1, [r0, #0x5c]
    ldr r3, .L_022104dc
    cmp r1, #0x0
    beq .L_02210480
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x8
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    b .L_022104a0
.L_02210480:
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x8
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
.L_022104a0:
    mvn r1, #0x17
    ldr r3, [r0, #0x68]
    ldr ip, [r0, #0x6c]
    sub r2, r1, #0x15
    sub lr, r1, r3
    ldr r3, .L_022104e0
    sub r2, r2, ip
    and ip, lr, r1, lsr #0x17
    and r2, r3, r2, lsl #0x10
    ldr r1, .L_022104ec
    orr r2, ip, r2
    str r2, [r1, #0x0]
    ldr r0, [r0, #0x58]
    bl func_ov059_022100f8
    ldmia sp!, {r3, pc}
.L_022104dc: .word 0x4001000
.L_022104e0: .word 0x1ff0000
.L_022104e4: .word 0x4001014
.L_022104e8: .word 0x4001018
.L_022104ec: .word 0x400101c
.size func_ov059_02210308, . - func_ov059_02210308
