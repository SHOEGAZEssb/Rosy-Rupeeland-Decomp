.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02214588
func_ov075_02214588:
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x5
    cmpne r1, #0x6
    movne r0, #0x0
    bx lr
.size func_ov075_02214588, . - func_ov075_02214588
