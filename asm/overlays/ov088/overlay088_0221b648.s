.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Actor_DebugDrawState

.global func_ov088_0221b648
func_ov088_0221b648:
    ldr ip, .L_0221b650
    bx ip
.L_0221b650: .word Actor_DebugDrawState
.size func_ov088_0221b648, . - func_ov088_0221b648
