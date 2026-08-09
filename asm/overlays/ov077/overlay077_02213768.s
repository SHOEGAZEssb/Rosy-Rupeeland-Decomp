.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02213768
func_ov077_02213768:
    ldr r3, [r0, #0x4]
    ldrh r2, [r3, #0x24]
    orr r2, r2, r1
    strh r2, [r3, #0x24]
    ldr r2, [r0, #0x8]
    ldrh r0, [r2, #0x24]
    orr r0, r0, r1
    strh r0, [r2, #0x24]
    bx lr
.size func_ov077_02213768, . - func_ov077_02213768
