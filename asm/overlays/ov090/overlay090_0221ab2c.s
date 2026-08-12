.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_state_active_query.c.

.global func_ov090_0221ab2c
func_ov090_0221ab2c:
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0xb
    moveq r0, #0x1
    bxeq lr
    cmp r0, #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov090_0221ab2c, . - func_ov090_0221ab2c
