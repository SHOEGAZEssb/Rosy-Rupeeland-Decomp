.text
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.

.global func_0209d758
func_0209d758:
    ldr r2, .L_0209d770
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
.L_0209d770: .word 0x4000304
.size func_0209d758, . - func_0209d758
