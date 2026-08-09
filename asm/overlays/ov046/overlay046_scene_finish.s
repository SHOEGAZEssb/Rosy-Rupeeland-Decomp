.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_scene_state.c.
.extern func_ov046_0220cb4c

.global func_ov046_0220ccc0
func_ov046_0220ccc0:
    stmdb sp!, {r3, lr}
    bl func_ov046_0220cb4c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov046_0220ccc0, . - func_ov046_0220ccc0
