.text

/* Exact fallback; see src/overlays/ov026/overlay026_tube_mesh.c. */
.extern data_ov026_022048e8
.extern Heap_FreeCore
.extern Heap_Free


    .global func_ov026_021fdcfc
func_ov026_021fdcfc:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fdd24
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x28]
    bl Heap_FreeCore
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdd24: .word data_ov026_022048e8
.size func_ov026_021fdcfc, .-func_ov026_021fdcfc

