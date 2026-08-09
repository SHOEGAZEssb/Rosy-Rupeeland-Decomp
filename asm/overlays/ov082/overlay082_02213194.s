.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_02213194
func_ov082_02213194:
    ldrsh r1, [r0, #0xd8]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
.size func_ov082_02213194, . - func_ov082_02213194
