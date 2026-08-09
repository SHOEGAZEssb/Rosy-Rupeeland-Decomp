.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.

.global func_ov084_02213804
func_ov084_02213804:
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
.size func_ov084_02213804, . - func_ov084_02213804
