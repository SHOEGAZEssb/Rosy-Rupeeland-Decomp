.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */



    .global func_ov025_02200468
func_ov025_02200468:
    ldr r1, [r0, #0xb8]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x2
    strneh r0, [r1, #0x24]
    bx lr
.size func_ov025_02200468, .-func_ov025_02200468

