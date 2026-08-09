.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219918

.global func_ov089_02217890
func_ov089_02217890:
    ldr r2, .L_022178a8
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_022178a8: .word data_ov089_02219918
.size func_ov089_02217890, . - func_ov089_02217890
