.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88

.global func_ov078_02213f54
func_ov078_02213f54:
    ldr r2, [r0, #0x260]
    mov r1, #0x8
    bic r2, r2, #0xb
    str r2, [r0, #0x260]
    strb r1, [r0, #0x24c]
    mov r1, #0x17
    strh r1, [r0, #0xd6]
    add r1, r0, #0x200
    ldrsh r2, [r1, #0x98]
    add r2, r2, #0x1
    strh r2, [r1, #0x98]
    ldrsh r2, [r1, #0x98]
    cmp r2, #0x96
    bxle lr
    ldr r2, .L_02213fb8
    mov r3, #0x0
    ldr ip, [r2, #0x8]
    ldr r2, [r2, #0xc]
    str ip, [r0, #0x2a4]
    str r2, [r0, #0x2a8]
    strh r3, [r1, #0x98]
    ldr r1, [r0, #0x260]
    bic r1, r1, #0x40
    str r1, [r0, #0x260]
    bx lr
.L_02213fb8: .word data_ov078_02215c88
.size func_ov078_02213f54, . - func_ov078_02213f54
