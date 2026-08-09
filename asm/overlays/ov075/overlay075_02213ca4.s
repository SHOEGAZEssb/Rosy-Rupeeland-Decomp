.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02213ca4
func_ov075_02213ca4:
    add r2, r0, #0x200
    ldrsh ip, [r2, #0xa8]
    add r3, ip, #0x1
    strh r3, [r2, #0xa8]
    ldr r0, [r0, #0x2a4]
    str r1, [r0, ip, lsl #0x2]
    bx lr
.size func_ov075_02213ca4, . - func_ov075_02213ca4
