    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global func_ov021_021fd6e8
func_ov021_021fd6e8:
    ldr r1, [r0, #0x58]
    ldr r2, [r0, #0x4c]
    ldr r1, [r1, #0x14]
    mov r0, #0xc
    mla r0, r1, r0, r2
    bx lr
    .size func_ov021_021fd6e8, . - func_ov021_021fd6e8

