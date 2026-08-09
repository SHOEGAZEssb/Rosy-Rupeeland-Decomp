.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_022102ac
func_ov059_022102ac:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov ip, #0x0
    ldr lr, [sp, #0x18]
    add r5, r0, r1, lsl #0x2
    mov r6, ip
    b .L_022102fc
.L_022102c4:
    add r0, r2, ip
    mov r0, r0, lsl #0x2
    mov r7, r6
    add r4, r5, r0, lsl #0x2
    b .L_022102f0
.L_022102d8:
    add r0, r4, r7, lsl #0x2
    ldr r1, [r0, #0x4]
    add r7, r7, #0x1
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_022102f0:
    cmp r7, r3
    blt .L_022102d8
    add ip, ip, #0x1
.L_022102fc:
    cmp ip, lr
    blt .L_022102c4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov059_022102ac, . - func_ov059_022102ac
