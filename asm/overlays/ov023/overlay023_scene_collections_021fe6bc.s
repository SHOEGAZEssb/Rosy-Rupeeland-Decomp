.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_collections.c. */
.extern func_02092910


    .global func_ov023_021fe6bc
func_ov023_021fe6bc:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x398]
    cmp r1, #0x1
    movle r0, #0x0
    ldmleia sp!, {r3, pc}
    ldr r2, [r0, #0x384]
    add r1, r0, #0x30
    ldr r0, [r2, #0x9c]
    bl func_02092910
    ldmia sp!, {r3, pc}
.size func_ov023_021fe6bc, .-func_ov023_021fe6bc

