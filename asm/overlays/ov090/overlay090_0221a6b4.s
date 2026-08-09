.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221a6b4
func_ov090_0221a6b4:
    add r0, r0, #0x200
    ldrsh r2, [r0, #0x20]
    sub r1, r2, r1
    strh r1, [r0, #0x20]
    ldrsh r1, [r0, #0x20]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x20]
    bx lr
.size func_ov090_0221a6b4, . - func_ov090_0221a6b4
