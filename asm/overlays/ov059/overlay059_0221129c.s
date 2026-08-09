.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_021052fc
.extern func_0200e9e0
.extern func_ov059_02210bc4

.global func_ov059_0221129c
func_ov059_0221129c:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_02211308
    mov r1, #0x0
    str r1, [r0, #0x38]
    ldr r1, [r0, #0x34]
    ldr r3, .L_02211328
    cmp r1, #0x0
    beq .L_022112e8
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x1
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    b .L_02211308
.L_022112e8:
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x1
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
.L_02211308:
    ldr r0, [r0, #0x3c]
    bl func_ov059_02210bc4
    ldr r0, .L_0221132c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200e9e0
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02211328: .word 0x4001000
.L_0221132c: .word data_021052fc
.size func_ov059_0221129c, . - func_ov059_0221129c
