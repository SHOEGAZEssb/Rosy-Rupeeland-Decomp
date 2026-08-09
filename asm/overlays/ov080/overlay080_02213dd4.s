.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_02213dd4
func_ov080_02213dd4:
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
.size func_ov080_02213dd4, . - func_ov080_02213dd4
