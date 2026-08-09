.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_scene_sync.c.
.extern func_ov046_0220c1d8

.global func_ov046_0220cb28
func_ov046_0220cb28:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq .L_0220cb44
    ldr r0, [r0, #0x70]
    bl func_ov046_0220c1d8
.L_0220cb44:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov046_0220cb28, . - func_ov046_0220cb28
