.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.

.global func_ov079_02213a30
func_ov079_02213a30:
    ldrsh r0, [r0, #0xd6]
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov079_02213a30, . - func_ov079_02213a30
