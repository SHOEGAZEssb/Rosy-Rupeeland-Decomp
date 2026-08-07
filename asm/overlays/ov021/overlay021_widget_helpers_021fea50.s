    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */

.global func_ov021_021fea50
func_ov021_021fea50:
    ldr r2, [r0, #0xc]
    cmp r2, #0x0
    ldrne r0, [r2, #0x20]
    orrne r0, r0, r1
    strne r0, [r2, #0x20]
    bx lr
    .size func_ov021_021fea50, . - func_ov021_021fea50

