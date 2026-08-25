.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Actor_DebugDrawState

.global func_ov089_022195c8
func_ov089_022195c8:
    ldr ip, .L_022195d0
    bx ip
.L_022195d0: .word Actor_DebugDrawState
.size func_ov089_022195c8, . - func_ov089_022195c8
