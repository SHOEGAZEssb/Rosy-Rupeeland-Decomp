.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.

.global func_ov054_0220e52c
func_ov054_0220e52c:
    mov ip, r0, lsl #0x8
    mov r0, r1, lsl #0x8
    and ip, ip, #0xff00
    and r1, r2, #0xff
    ldr r2, .L_0220e55c
    orr ip, ip, r1
    and r1, r0, #0xff00
    and r0, r3, #0xff
    strh ip, [r2, #0x0]
    orr r0, r1, r0
    strh r0, [r2, #0x4]
    bx lr
.L_0220e55c: .word 0x4000040
.size func_ov054_0220e52c, . - func_ov054_0220e52c
