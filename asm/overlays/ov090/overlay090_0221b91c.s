.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_virtuals.c.

.global func_ov090_0221b91c
func_ov090_0221b91c:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov090_0221b91c, . - func_ov090_0221b91c
