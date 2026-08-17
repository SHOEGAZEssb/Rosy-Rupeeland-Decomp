.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern GamePhaseProgress_GetOrCreateGlobal
.extern func_ov055_0220e860
.extern func_ov055_0220e8a0
.extern func_ov055_0220ebec

.global func_ov055_0220e96c
func_ov055_0220e96c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220ea5c
    mov ip, #0x4000000
    ldrh r2, [r1, #0x0]
    mov r4, r0
    ldr r0, .L_0220ea60
    and r2, r2, #0x43
    orr r2, r2, #0x204
    orr r2, r2, #0x9800
    strh r2, [r1, #0x0]
    ldr r3, [ip, #0x0]
    ldr r2, [ip, #0x0]
    and r3, r3, #0x1f00
    mov lr, r3, lsr #0x8
    bic r3, r2, #0x1f00
    orr r2, lr, #0x2
    orr r2, r3, r2, lsl #0x8
    str r2, [ip, #0x0]
    ldrh r2, [r1, #0x0]
    bic r2, r2, #0x3
    orr r2, r2, #0x2
    strh r2, [r1, #0x0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x2
    blt .L_0220ea20
    ldr ip, .L_0220ea64
    add r0, r0, #0x20c
    ldrh r2, [ip, #0x0]
    sub r3, ip, #0xc
    sub r1, ip, #0x2
    and r2, r2, #0x43
    orr r0, r2, r0
    strh r0, [ip, #0x0]
    ldr r2, [r3, #0x0]
    ldr r0, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r0, #0x1f00
    orr r0, ip, #0x4
    orr r0, r2, r0, lsl #0x8
    str r0, [r3, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x0]
.L_0220ea20:
    mov r0, r4
    bl func_ov055_0220ebec
    bl GamePhaseProgress_GetOrCreateGlobal
    ldr r0, [r4, #0x24]
    bl func_ov055_0220e8a0
    ldr r0, [r4, #0x24]
    bl func_ov055_0220e860
    ldr r0, [r4, #0x2c]
    cmp r0, #0x2
    ldrgt r0, [r4, #0x24]
    ldrgt r1, [r0, #0x34]
    ldrgth r0, [r1, #0x24]
    orrgt r0, r0, #0x4
    strgth r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_0220ea5c: .word 0x400000a
.L_0220ea60: .word 0x9a04
.L_0220ea64: .word 0x400100c
.size func_ov055_0220e96c, . - func_ov055_0220e96c
