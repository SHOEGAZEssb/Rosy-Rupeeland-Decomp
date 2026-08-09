.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_scene_sync.c.
.extern func_020740a4
.extern func_ov046_0220c1a4

.global func_ov046_0220cb4c
func_ov046_0220cb4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x70]
    bl func_ov046_0220c1a4
    ldr r2, [r4, #0x70]
    ldr r1, [r4, #0x60]
    ldr r0, [r2, #0x10c]
    ldr r2, [r2, #0x110]
    rsb r0, r0, #0x80
    str r0, [r1, #0x18]
    rsb r0, r2, #0x60
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x60]
    bl func_020740a4
    ldmia sp!, {r4, pc}
.size func_ov046_0220cb4c, . - func_ov046_0220cb4c
