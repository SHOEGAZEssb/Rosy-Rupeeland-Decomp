    .text
/* Exact fallback; see src/overlays/ov021/overlay021_controller_helpers.c. */

.global func_ov021_021fd794
func_ov021_021fd794:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr
    .size func_ov021_021fd794, . - func_ov021_021fd794

