    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */

.global func_ov021_021ff0c8
func_ov021_021ff0c8:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    .size func_ov021_021ff0c8, . - func_ov021_021ff0c8

