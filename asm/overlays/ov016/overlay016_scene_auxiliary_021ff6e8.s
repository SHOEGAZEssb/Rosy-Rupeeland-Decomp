    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_auxiliary.c. */
.global Overlay016_SetAuxiliaryEntryFlags
Overlay016_SetAuxiliaryEntryFlags:
    ldr r2, [r0, #0xc]
    cmp r2, #0x0
    ldrne r0, [r2, #0x20]
    orrne r0, r0, r1
    strne r0, [r2, #0x20]
    bx lr
    .size Overlay016_SetAuxiliaryEntryFlags, . - Overlay016_SetAuxiliaryEntryFlags

