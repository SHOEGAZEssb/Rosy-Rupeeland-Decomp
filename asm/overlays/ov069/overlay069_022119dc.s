.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_022119dc
func_ov069_022119dc:
    ldr r1, [r0, #0x60]
    cmp r1, #0x5
    ldreq r0, [r0, #0x64]
    cmpeq r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov069_022119dc, . - func_ov069_022119dc
