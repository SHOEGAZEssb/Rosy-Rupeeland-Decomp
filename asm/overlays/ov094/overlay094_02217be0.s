.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.

.global func_ov094_02217be0
func_ov094_02217be0:
    ldr ip, [r0, #0x10]
    ldr r1, [r0, #0x40]
    ldr r3, [r0, #0x20]
    ldr r2, [r0, #0x50]
    add ip, ip, r1
    mov r1, ip, asr #0xb
    add r3, r3, r2
    add r1, ip, r1, lsr #0x14
    mov r2, r3, asr #0xb
    mov r1, r1, lsl #0x4
    add r2, r3, r2, lsr #0x14
    mov r2, r2, lsl #0x4
    ldr r3, [r0, #0x9c]
    mov ip, r1, asr #0x10
    strh ip, [r3, #0x2c]
    mov r1, r2, asr #0x10
    strh r1, [r3, #0x2e]
    ldr r0, [r0, #0xa0]
    strh ip, [r0, #0x2c]
    strh r1, [r0, #0x2e]
    bx lr
.size func_ov094_02217be0, . - func_ov094_02217be0
