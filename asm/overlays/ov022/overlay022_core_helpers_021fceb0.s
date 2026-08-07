    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */


.global func_ov022_021fceb0
func_ov022_021fceb0:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov022_021fceb0, . - func_ov022_021fceb0
