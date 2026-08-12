.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_sound_fade.c.

.global func_ov090_0221b7e0
func_ov090_0221b7e0:
    strb r1, [r0, #0x0]
    strb r2, [r0, #0x1]
    ldr r1, [sp, #0x0]
    strb r3, [r0, #0x2]
    strb r1, [r0, #0x3]
    bx lr
.size func_ov090_0221b7e0, . - func_ov090_0221b7e0
