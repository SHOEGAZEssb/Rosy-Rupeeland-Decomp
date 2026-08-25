.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern Actor_DebugDrawState

.global func_ov085_022142ec
func_ov085_022142ec:
    ldr ip, .L_022142f4
    bx ip
.L_022142f4: .word Actor_DebugDrawState
.size func_ov085_022142ec, . - func_ov085_022142ec
