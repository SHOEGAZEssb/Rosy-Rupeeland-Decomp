.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_panel_refresh.c.
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_ov046_0220bd14

.global func_ov046_0220c1a4
func_ov046_0220c1a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov046_0220bd14
    ldr r0, [r4, #0x10c]
    ldr r2, [r4, #0x110]
    ldr r1, [r4, #0x4]
    rsb r0, r0, #0x80
    str r0, [r1, #0x18]
    rsb r0, r2, #0x60
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
.size func_ov046_0220c1a4, . - func_ov046_0220c1a4
