.text

/* Exact fallback; see src/overlays/ov026/overlay026_radial_fan.c. */
.extern data_ov026_022048f8
.extern Heap_FreeCore
.extern Heap_Free


    .global func_ov026_021fe540
func_ov026_021fe540:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe568
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    bl Heap_FreeCore
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe568: .word data_ov026_022048f8
.size func_ov026_021fe540, .-func_ov026_021fe540

