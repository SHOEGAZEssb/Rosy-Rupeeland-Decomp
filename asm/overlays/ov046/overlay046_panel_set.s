.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_panel_position.c.

.global func_ov046_0220c46c
func_ov046_0220c46c:
    str r1, [r0, #0x10c]
    str r2, [r0, #0x110]
    bx lr
.size func_ov046_0220c46c, . - func_ov046_0220c46c
