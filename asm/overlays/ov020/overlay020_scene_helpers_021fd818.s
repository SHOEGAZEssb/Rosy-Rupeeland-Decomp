    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */

.global Overlay020_SceneCallback_NoOp
.global func_ov020_021fd81c
Overlay020_SceneCallback_NoOp:
    bx lr
    .size Overlay020_SceneCallback_NoOp, . - Overlay020_SceneCallback_NoOp
func_ov020_021fd81c:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
    .size func_ov020_021fd81c, . - func_ov020_021fd81c
