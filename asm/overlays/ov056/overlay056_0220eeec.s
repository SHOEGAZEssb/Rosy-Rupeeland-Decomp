.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220eeec
func_ov056_0220eeec:
    ldr r3, [r0, #0x89c]
    ldr r2, [r0, #0x8a0]
    ldr r0, .L_0220ef2c
    ldr ip, [r1, #0x4]
    mov r3, r3, asr #0xc
    add ip, r3, ip, asr #0xc
    ldr r3, [r1, #0x8]
    mov r1, r2, asr #0xc
    add r2, r1, r3, asr #0xc
    mov r1, r0, lsl #0x10
    and r3, ip, r0
    and r1, r1, r2, lsl #0x10
    ldr r0, .L_0220ef30
    orr r1, r3, r1
    str r1, [r0, #0x0]
    bx lr
.L_0220ef2c: .word 0x1ff
.L_0220ef30: .word 0x400101c
.size func_ov056_0220eeec, . - func_ov056_0220eeec
