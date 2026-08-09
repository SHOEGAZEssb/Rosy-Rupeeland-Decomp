.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_panel_position.c.
.extern func_ov046_0220c3bc
.extern func_ov046_0220c410

.global func_ov046_0220c478
func_ov046_0220c478:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov046_0220c3bc
    str r0, [r5, #0x10c]
    mov r0, r5
    mov r1, r4
    bl func_ov046_0220c410
    str r0, [r5, #0x110]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov046_0220c478, . - func_ov046_0220c478
