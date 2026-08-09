.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_ov077_022170d8

.global func_ov077_02212f18
func_ov077_02212f18:
    ldr r2, .L_02212f34
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.L_02212f34: .word data_ov077_022170d8
.size func_ov077_02212f18, . - func_ov077_02212f18
