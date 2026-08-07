    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global func_ov021_021fd1b8
func_ov021_021fd1b8:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xc]
    and r0, r0, #0xf00
    mov r0, r0, lsr #0x8
    bx lr
    .size func_ov021_021fd1b8, . - func_ov021_021fd1b8

