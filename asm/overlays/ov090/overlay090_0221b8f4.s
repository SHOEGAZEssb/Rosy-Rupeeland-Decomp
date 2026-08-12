.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_virtuals.c.

.global func_ov090_0221b8f4
func_ov090_0221b8f4:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov090_0221b8f4, . - func_ov090_0221b8f4
