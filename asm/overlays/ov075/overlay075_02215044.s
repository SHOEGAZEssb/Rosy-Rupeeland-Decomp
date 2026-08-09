.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02215044
func_ov075_02215044:
    ldrsh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    ldrsh r2, [r1, #0x2]
    strh r2, [r0, #0x2]
    ldrsh r2, [r1, #0x4]
    strh r2, [r0, #0x4]
    ldrsh r1, [r1, #0x6]
    strh r1, [r0, #0x6]
    bx lr
.size func_ov075_02215044, . - func_ov075_02215044
