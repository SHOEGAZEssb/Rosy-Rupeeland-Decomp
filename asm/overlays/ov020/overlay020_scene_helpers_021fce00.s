    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */

.global func_ov020_021fce00
func_ov020_021fce00:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    strh r1, [r0, #0xa]
    strh r1, [r0, #0x8]
    bx lr
    .size func_ov020_021fce00, . - func_ov020_021fce00
