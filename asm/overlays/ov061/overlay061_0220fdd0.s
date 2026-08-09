.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.

.global func_ov061_0220fdd0
func_ov061_0220fdd0:
    ldr r3, [r0, #0x0]
    add r3, r3, r1
    str r3, [r0, #0x0]
    ldr r3, [r0, #0x4]
    add r3, r3, r2
    str r3, [r0, #0x4]
    ldr r3, [r0, #0x8]
    add r1, r3, r1
    str r1, [r0, #0x8]
    ldr r1, [r0, #0xc]
    add r1, r1, r2
    str r1, [r0, #0xc]
    bx lr
.size func_ov061_0220fdd0, . - func_ov061_0220fdd0
