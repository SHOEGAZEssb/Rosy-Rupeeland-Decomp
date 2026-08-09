.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.

.global func_ov055_0220e860
func_ov055_0220e860:
    ldr r3, [r0, #0x2c]
    mov r1, #0x2
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r3, [r0, #0x30]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r0, #0x44]
    ldr r3, [r2, #0x0]
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    str r1, [r0, #0x38]
    bx lr
.size func_ov055_0220e860, . - func_ov055_0220e860
