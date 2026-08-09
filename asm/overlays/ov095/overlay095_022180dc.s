.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_022180dc
func_ov095_022180dc:
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xd6]
    strh r1, [r0, #0xd8]
    bx lr
.size func_ov095_022180dc, . - func_ov095_022180dc
