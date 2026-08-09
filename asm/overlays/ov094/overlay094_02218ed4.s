.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.

.global func_ov094_02218ed4
func_ov094_02218ed4:
    ldr r1, [r0, #0x9c]
    ldr r2, [r0, #0xb4]
    ldrsh r3, [r1, #0x2e]
    ldrsh r1, [r1, #0x2c]
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    ldr r1, [r0, #0x70]
    ldr r2, [r0, #0x9c]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    ldr r0, [r0, #0xb4]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    bx lr
.size func_ov094_02218ed4, . - func_ov094_02218ed4
