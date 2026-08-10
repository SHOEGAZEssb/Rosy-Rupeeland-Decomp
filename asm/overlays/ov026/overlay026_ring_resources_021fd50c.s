.text

/* Exact fallback; see src/overlays/ov026/overlay026_ring_resources.c. */
.extern data_ov026_022049ec
.extern Heap_FreeCore
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_021fd50c
func_ov026_021fd50c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd53c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xb0]
    bl Heap_FreeCore
    mov r0, r4
    bl func_ov026_021fce50
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd53c: .word data_ov026_022049ec
.size func_ov026_021fd50c, .-func_ov026_021fd50c

