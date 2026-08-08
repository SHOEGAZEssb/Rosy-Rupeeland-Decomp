.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */



    .global func_ov025_02200480
func_ov025_02200480:
    ldr r0, [r0, #0xb8]
    cmp r0, #0x0
    ldrneh r0, [r0, #0x24]
    andne r0, r0, #0x1
    moveq r0, #0x1
    bx lr
.size func_ov025_02200480, .-func_ov025_02200480

