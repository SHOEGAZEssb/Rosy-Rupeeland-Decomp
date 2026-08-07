    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */
    .extern func_ov020_021fde6c

.global func_ov020_021fe3e4
func_ov020_021fe3e4:
    stmdb sp!, {r3, lr}
    bl func_ov020_021fde6c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size func_ov020_021fe3e4, . - func_ov020_021fe3e4
