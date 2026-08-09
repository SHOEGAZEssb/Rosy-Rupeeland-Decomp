.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.

.global func_ov084_02213ef0
func_ov084_02213ef0:
    add r0, r0, #0x200
    ldrh r1, [r0, #0x9a]
    bic r1, r1, #0x1
    strh r1, [r0, #0x9a]
    bx lr
.size func_ov084_02213ef0, . - func_ov084_02213ef0
