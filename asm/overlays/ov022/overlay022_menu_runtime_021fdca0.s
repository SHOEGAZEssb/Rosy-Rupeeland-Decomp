    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_runtime.c. */


.global func_ov022_021fdca0
func_ov022_021fdca0:
    ldr r1, [r0, #0x30]
    ldr r2, [r0, #0x24]
    ldr r0, [r1, #0x14]
    add r0, r2, r0, lsl #0x3
    bx lr
.size func_ov022_021fdca0, . - func_ov022_021fdca0
