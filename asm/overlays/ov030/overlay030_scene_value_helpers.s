.text

/* Exact fallback; see src/overlays/ov030/overlay030_scene_value_helpers.c for documented portable C. */



    .global func_ov030_021fd9fc
func_ov030_021fd9fc:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov030_021fd9fc, .-func_ov030_021fd9fc
    .global func_ov030_021fda14
func_ov030_021fda14:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
.size func_ov030_021fda14, .-func_ov030_021fda14
