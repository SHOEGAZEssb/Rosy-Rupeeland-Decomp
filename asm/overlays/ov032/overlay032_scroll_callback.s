.text

/* Exact fallback; see src/overlays/ov032/overlay032_runtime_setup.c for documented portable C. */
.extern func_ov032_021fd938

    .global func_ov032_021fd920
func_ov032_021fd920:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0xf2c]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov032_021fd938
    ldmia sp!, {r3, pc}
.size func_ov032_021fd920, .-func_ov032_021fd920

