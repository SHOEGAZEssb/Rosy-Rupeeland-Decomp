.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */
.extern func_02074110


    .global func_ov023_021fd780
func_ov023_021fd780:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x50]
    bl func_02074110
    ldr r0, [r4, #0x4]
    bl func_02074110
    ldmia sp!, {r4, pc}
.size func_ov023_021fd780, .-func_ov023_021fd780

