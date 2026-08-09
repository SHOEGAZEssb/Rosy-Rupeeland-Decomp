.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02213c08
func_ov077_02213c08:
    ldr r2, [r0, #0x4]
    mvn r3, r1
    ldrh r1, [r2, #0x24]
    and r1, r1, r3
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x8]
    ldrh r0, [r1, #0x24]
    and r0, r0, r3
    strh r0, [r1, #0x24]
    bx lr
.size func_ov077_02213c08, . - func_ov077_02213c08
