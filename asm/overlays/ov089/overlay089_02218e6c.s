.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219918

.global func_ov089_02218e6c
func_ov089_02218e6c:
    ldr r3, .L_02218e7c
    str r3, [r0, #0x0]
    stmib r0, {r1, r2}
    bx lr
.L_02218e7c: .word data_ov089_02219918
.size func_ov089_02218e6c, . - func_ov089_02218e6c
