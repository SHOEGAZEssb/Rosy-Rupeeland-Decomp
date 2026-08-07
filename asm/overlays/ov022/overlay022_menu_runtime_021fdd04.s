    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_runtime.c. */


.global func_ov022_021fdd04
func_ov022_021fdd04:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov022_021fdd04, . - func_ov022_021fdd04
