.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_renderer.c. */
.extern PresentationScalar_SetImmediate


    .global func_ov026_021fec34
func_ov026_021fec34:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r1, r2
    add r0, r6, #0x1c
    mov r4, r3
    bl PresentationScalar_SetImmediate
    str r5, [r6, #0xa0]
    ldr r1, [sp, #0x10]
    str r4, [r6, #0xa4]
    ldr r0, [sp, #0x14]
    strh r1, [r6, #0xa8]
    strh r0, [r6, #0xaa]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov026_021fec34, .-func_ov026_021fec34

