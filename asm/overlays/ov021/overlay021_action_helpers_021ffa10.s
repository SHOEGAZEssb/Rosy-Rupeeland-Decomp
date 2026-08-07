    .text
/* Exact fallback; see src/overlays/ov021/overlay021_action_helpers.c. */

.global func_ov021_021ffa10
func_ov021_021ffa10:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xc]
    tst r0, #0x20000000
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size func_ov021_021ffa10, . - func_ov021_021ffa10

