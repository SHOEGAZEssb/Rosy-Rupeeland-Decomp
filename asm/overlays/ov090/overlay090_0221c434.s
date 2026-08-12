.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_chain_accessors.c.

.global func_ov090_0221c434
func_ov090_0221c434:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
.size func_ov090_0221c434, . - func_ov090_0221c434
