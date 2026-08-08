.text

/* Exact fallback; see src/overlays/ov026/overlay026_particle_renderer.c. */



    .global func_ov026_021fe8fc
func_ov026_021fe8fc:
    strh r1, [r0, #0xbc]
    str r2, [r0, #0xb8]
    ldr r2, [sp, #0x0]
    str r3, [r0, #0x9c]
    ldr r1, [sp, #0x4]
    str r2, [r0, #0xa0]
    ldr r2, [sp, #0x8]
    str r1, [r0, #0xa4]
    ldr r1, [sp, #0xc]
    str r2, [r0, #0xa8]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov026_021fe8fc, .-func_ov026_021fe8fc

