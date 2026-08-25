.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern Actor_DebugDrawState

.global func_ov087_0221896c
func_ov087_0221896c:
    ldr ip, .L_02218974
    bx ip
.L_02218974: .word Actor_DebugDrawState
.size func_ov087_0221896c, . - func_ov087_0221896c
