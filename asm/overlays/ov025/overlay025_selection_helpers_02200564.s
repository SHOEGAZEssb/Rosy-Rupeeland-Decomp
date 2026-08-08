.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern func_02095940


    .global func_ov025_02200564
func_ov025_02200564:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    add r5, r0, #0x2f4
    mov r4, #0xac
L_02200574:
    mla r0, r6, r4, r5
    bl func_02095940
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_02200574
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov025_02200564, .-func_ov025_02200564

