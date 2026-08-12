.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_virtuals.c.

.global func_ov090_0221b958
func_ov090_0221b958:
    ldr r0, .L_0221b960
    bx lr
.L_0221b960: .word 0x309
.size func_ov090_0221b958, . - func_ov090_0221b958
