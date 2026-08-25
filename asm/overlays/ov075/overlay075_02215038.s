.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern Actor_DebugDrawState

.global func_ov075_02215038
func_ov075_02215038:
    ldr ip, .L_02215040
    bx ip
.L_02215040: .word Actor_DebugDrawState
.size func_ov075_02215038, . - func_ov075_02215038
