.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_helpers.c for documented portable C. */

    .global func_ov037_021fd758
func_ov037_021fd758:
    stmib r0, {r1, r2, r3}
    bx lr
    .size func_ov037_021fd758, .-func_ov037_021fd758

    .global func_ov037_021fd760
func_ov037_021fd760:
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r3, [r0, #0x18]
    bx lr
    .size func_ov037_021fd760, .-func_ov037_021fd760
