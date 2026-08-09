.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern func_ov058_0220f308

.global func_ov058_0220eca4
func_ov058_0220eca4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, .L_0220ed5c
    ldr r1, .L_0220ed60
    ldrh r5, [r3, #0x0]
    mov r4, #0x4000000
    add r2, r3, #0x1000
    and r5, r5, #0x43
    orr r5, r5, #0xa10
    orr r5, r5, #0x9000
    strh r5, [r3, #0x0]
    ldr lr, [r4, #0x0]
    ldr ip, [r4, #0x0]
    and lr, lr, #0x1f00
    mov r5, lr, lsr #0x8
    bic lr, ip, #0x1f00
    orr ip, r5, #0x2
    orr ip, lr, ip, lsl #0x8
    str ip, [r4, #0x0]
    ldrh lr, [r3, #0x0]
    sub ip, r1, #0xc
    bic lr, lr, #0x3
    orr lr, lr, #0x2
    strh lr, [r3, #0x0]
    ldrh r3, [r2, #0x0]
    and r3, r3, #0x43
    orr r3, r3, #0xa10
    orr r3, r3, #0x9000
    strh r3, [r2, #0x0]
    ldrh r3, [r1, #0x0]
    and r3, r3, #0x43
    orr r3, r3, #0x1e80
    strh r3, [r1, #0x0]
    ldr r3, [ip, #0x0]
    bic r3, r3, #0x1f00
    orr r3, r3, #0x1600
    str r3, [ip, #0x0]
    ldrh r3, [r2, #0x0]
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [r2, #0x0]
    ldrh r2, [r1, #0x0]
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r1, #0x0]
    bl func_ov058_0220f308
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ed5c: .word 0x400000a
.L_0220ed60: .word 0x400100c
.size func_ov058_0220eca4, . - func_ov058_0220eca4
