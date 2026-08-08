.text

/* Exact fallback; see src/overlays/ov032/overlay032_unlock_effect.c for documented portable C. */
.extern func_ov032_0220147c

    .global func_ov032_022003e4
func_ov032_022003e4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    add r5, r0, #0x334
    mov r4, #0x30
L_022003f4:
    mla r0, r6, r4, r5
    bl func_ov032_0220147c
    add r6, r6, #0x1
    cmp r6, #0x28
    blt L_022003f4
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov032_022003e4, .-func_ov032_022003e4

