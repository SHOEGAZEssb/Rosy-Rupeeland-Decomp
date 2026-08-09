.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern data_ov056_0220f6a4

.global func_ov056_0220e6dc
func_ov056_0220e6dc:
    ldr r2, .L_0220e6f8
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
.L_0220e6f8: .word data_ov056_0220f6a4
.size func_ov056_0220e6dc, . - func_ov056_0220e6dc
