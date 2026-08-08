.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_display.c. */



    .global func_ov026_0220035c
func_ov026_0220035c:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x794]
    str r1, [r0, #0x798]
    mov r1, #0x0
    str r1, [r0, #0x79c]
    ldr r1, [r0, #0x160]
    ldr r0, [sp, #0x10]
    str r3, [r1, #0x134]
    str r0, [r1, #0x138]
    add sp, sp, #0x10
    bx lr
.size func_ov026_0220035c, .-func_ov026_0220035c

