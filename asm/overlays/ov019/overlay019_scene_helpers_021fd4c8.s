    .text
/* Exact fallback; see src/overlays/ov019/overlay019_scene_helpers.c. */
    .extern func_ov019_021fd170

.global func_ov019_021fd4c8
func_ov019_021fd4c8:
    stmdb sp!, {r3, lr}
    bl func_ov019_021fd170
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size func_ov019_021fd4c8, . - func_ov019_021fd4c8
