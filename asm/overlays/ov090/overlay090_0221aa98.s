.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_state_classify.c.

.global func_ov090_0221aa98
func_ov090_0221aa98:
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x1a
    moveq r0, #0x1
    bxeq lr
    cmp r0, #0x20
    moveq r0, #0x3
    movne r0, #0x0
    bx lr
.size func_ov090_0221aa98, . - func_ov090_0221aa98
