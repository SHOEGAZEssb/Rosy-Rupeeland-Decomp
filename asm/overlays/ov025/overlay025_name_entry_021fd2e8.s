.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern GraphicsSpriteState_SetAnimationIndex


    .global func_ov025_021fd2e8
func_ov025_021fd2e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x30]
    mov r1, #0x3
    str r0, [r4, #0x174]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x174]
    mov r1, #0x0
    strh r1, [r0, #0x28]
    ldmia sp!, {r4, pc}
.size func_ov025_021fd2e8, .-func_ov025_021fd2e8

