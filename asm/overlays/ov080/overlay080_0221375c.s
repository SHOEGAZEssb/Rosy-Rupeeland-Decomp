.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.

.global func_ov080_0221375c
func_ov080_0221375c:
    cmp r1, #0x0
    ldr r1, [r0, #0x10]
    orreq r1, r1, #0x20000
    bicne r1, r1, #0x20000
    str r1, [r0, #0x10]
    bx lr
.size func_ov080_0221375c, . - func_ov080_0221375c
