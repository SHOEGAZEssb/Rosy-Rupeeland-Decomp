.text

/* Exact fallback; see src/overlays/ov030/overlay030_random_slots.c. */



    .global func_ov030_021fcf04
func_ov030_021fcf04:
    ldrh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    ldrh r1, [r1, #0x2]
    strh r1, [r0, #0x2]
    bx lr
.size func_ov030_021fcf04, .-func_ov030_021fcf04
    .global func_ov030_021fcf18
func_ov030_021fcf18:
    bx lr
.size func_ov030_021fcf18, .-func_ov030_021fcf18
    .global func_ov030_021fcf1c
func_ov030_021fcf1c:
    bx lr
.size func_ov030_021fcf1c, .-func_ov030_021fcf1c
