.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88

.global func_ov078_02213a3c
func_ov078_02213a3c:
    ldr r2, .L_02213a70
    add r1, r0, #0x200
    ldr ip, [r2, #0x30]
    ldr r3, [r2, #0x34]
    mov r2, #0x0
    str ip, [r0, #0x2a4]
    str r3, [r0, #0x2a8]
    strh r2, [r1, #0x98]
    ldrh r0, [r1, #0x9c]
    add r0, r0, #0x1
    strh r0, [r1, #0x9c]
    strh r2, [r1, #0x9e]
    bx lr
.L_02213a70: .word data_ov078_02215c88
.size func_ov078_02213a3c, . - func_ov078_02213a3c
