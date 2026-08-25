.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Actor_DebugDrawState

.global func_ov088_0221b63c
func_ov088_0221b63c:
    ldr ip, .L_0221b644
    bx ip
.L_0221b644: .word Actor_DebugDrawState
.size func_ov088_0221b63c, . - func_ov088_0221b63c
