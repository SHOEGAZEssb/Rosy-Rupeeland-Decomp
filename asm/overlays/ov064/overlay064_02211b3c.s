.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.

.global Overlay064VecFx32_Set
Overlay064VecFx32_Set:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size Overlay064VecFx32_Set, . - Overlay064VecFx32_Set
