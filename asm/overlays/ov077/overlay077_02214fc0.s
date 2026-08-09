.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02214fc0
func_ov077_02214fc0:
    add r2, r0, #0x200
    strh r1, [r2, #0xfe]
    add r0, r0, #0x300
    mov r1, #0x0
    strh r1, [r0, #0x0]
    ldrh r0, [r2, #0xf2]
    bic r0, r0, #0x30
    orr r0, r0, #0x10
    strh r0, [r2, #0xf2]
    bx lr
.size func_ov077_02214fc0, . - func_ov077_02214fc0
