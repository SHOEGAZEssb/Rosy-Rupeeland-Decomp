.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_virtuals.c.

.global func_ov090_0221b97c
func_ov090_0221b97c:
    ldr r3, [r0, #0x4]
    ldrh r2, [r3, #0x24]
    orr r2, r2, r1
    strh r2, [r3, #0x24]
    ldr r2, [r0, #0x8]
    ldrh r0, [r2, #0x24]
    orr r0, r0, r1
    strh r0, [r2, #0x24]
    bx lr
.size func_ov090_0221b97c, . - func_ov090_0221b97c
