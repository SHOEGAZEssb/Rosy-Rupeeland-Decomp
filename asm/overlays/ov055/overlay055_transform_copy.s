.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.

.global func_ov055_0220eefc
func_ov055_0220eefc:
    ldr r3, [r1, #0x4]
    ldr r2, .L_0220ef60
    ldr r0, [r1, #0x8]
    mov r3, r3, asr #0xc
    sub ip, r3, #0x20
    mov r3, r0, asr #0xc
    mov r0, r2, lsl #0x10
    and ip, ip, r2
    and r3, r0, r3, lsl #0x10
    ldr r0, .L_0220ef64
    orr r3, ip, r3
    str r3, [r0, #0x0]
    ldr r3, [r1, #0x4]
    ldr r0, [r1, #0x8]
    mov r1, r3, asr #0xc
    mov r0, r0, asr #0xc
    sub r3, r1, #0x20
    sub r1, r0, #0x42
    mov r0, r2, lsl #0x10
    and r2, r3, r2
    and r1, r0, r1, lsl #0x10
    ldr r0, .L_0220ef68
    orr r1, r2, r1
    str r1, [r0, #0x0]
    bx lr
.L_0220ef60: .word 0x1ff
.L_0220ef64: .word 0x4000014
.L_0220ef68: .word 0x4001018
.size func_ov055_0220eefc, . - func_ov055_0220eefc
