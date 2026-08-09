.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.

.global func_ov087_02218938
func_ov087_02218938:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov087_02218938, . - func_ov087_02218938
