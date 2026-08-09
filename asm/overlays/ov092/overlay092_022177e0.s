.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_022177e0
func_ov092_022177e0:
    str r1, [r0, #0x4]
    strh r2, [r0, #0x8]
    strh r3, [r0, #0x0]
    ldr r1, [r0, #0x4]
    ldr r2, [sp, #0x0]
    add r1, r1, r3, lsl #0x3
    ldrsh r3, [r1, #0x4]
    mov r1, #0x0
    strh r3, [r0, #0x2]
    strb r2, [r0, #0xa]
    strb r1, [r0, #0xb]
    bx lr
.size func_ov092_022177e0, . - func_ov092_022177e0
