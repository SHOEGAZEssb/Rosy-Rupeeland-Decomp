    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global func_ov021_021fce00
func_ov021_021fce00:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    strh r1, [r0, #0xa]
    strh r1, [r0, #0x8]
    bx lr
    .size func_ov021_021fce00, . - func_ov021_021fce00

