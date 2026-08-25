.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern SpriteMotionController_SetAnimation


    .global func_ov025_02200534
func_ov025_02200534:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    add r5, r0, #0x2f4
    mov r4, #0xac
L_02200544:
    mla r0, r6, r4, r5
    mov r1, r6, lsl #0x1
    add r1, r1, #0x21
    bl SpriteMotionController_SetAnimation
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_02200544
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov025_02200534, .-func_ov025_02200534

