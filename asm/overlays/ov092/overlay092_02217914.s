.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_02217914
func_ov092_02217914:
    ldrsh r1, [r0, #0x0]
    ldr r0, [r0, #0x4]
    add r0, r0, r1, lsl #0x3
    ldrsh r0, [r0, #0x6]
    bx lr
.size func_ov092_02217914, . - func_ov092_02217914
