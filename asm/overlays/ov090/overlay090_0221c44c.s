.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_chain_accessors.c.

.global func_ov090_0221c44c
func_ov090_0221c44c:
    ldrsh r0, [r0, #0x8]
    bx lr
.size func_ov090_0221c44c, . - func_ov090_0221c44c
