.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.

.global func_ov073_0220ff28
func_ov073_0220ff28:
    strh r1, [r0, #0x3e]
    ldrsh r1, [r0, #0x3e]
    strh r1, [r0, #0x40]
    strh r2, [r0, #0x42]
    bx lr
.size func_ov073_0220ff28, . - func_ov073_0220ff28
