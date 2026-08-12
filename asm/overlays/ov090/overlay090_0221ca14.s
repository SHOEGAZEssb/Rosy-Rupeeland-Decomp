.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_effect_small_helpers.c.
.extern data_ov090_0221cc88

.global func_ov090_0221ca14
func_ov090_0221ca14:
    ldr r2, .L_0221ca30
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.L_0221ca30: .word data_ov090_0221cc88
.size func_ov090_0221ca14, . - func_ov090_0221ca14
