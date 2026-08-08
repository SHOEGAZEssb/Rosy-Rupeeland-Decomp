.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */

    .global func_ov039_02204168
func_ov039_02204168:
    cmp r1, r0
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x4]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x8]
    bx lr
    .size func_ov039_02204168, .-func_ov039_02204168

