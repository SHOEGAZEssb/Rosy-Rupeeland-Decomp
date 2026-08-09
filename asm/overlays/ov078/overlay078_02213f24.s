.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02213f24
func_ov078_02213f24:
    ldr r1, [r0, #0x260]
    mov r2, #0x0
    bic r1, r1, #0x3
    orr r1, r1, #0x8
    str r1, [r0, #0x260]
    strb r2, [r0, #0x24c]
    mov r1, #0x18
    strh r1, [r0, #0xd6]
    str r2, [r0, #0x44]
    str r2, [r0, #0x40]
    str r2, [r0, #0x3c]
    bx lr
.size func_ov078_02213f24, . - func_ov078_02213f24
