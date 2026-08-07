    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_auxiliary.c. */
.global func_ov016_021ff700
func_ov016_021ff700:
    ldr r3, [r0, #0xc]
    cmp r3, #0x0
    ldrne r2, [r3, #0x20]
    mvnne r0, r1
    andne r0, r2, r0
    strne r0, [r3, #0x20]
    bx lr
    .size func_ov016_021ff700, . - func_ov016_021ff700

