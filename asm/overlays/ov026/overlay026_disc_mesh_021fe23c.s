.text

/* Exact fallback; see src/overlays/ov026/overlay026_disc_mesh.c. */
.extern data_ov026_022048c8
.extern func_02002728
.extern func_02077d08
.extern Heap_Free


    .global func_ov026_021fe23c
func_ov026_021fe23c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe280
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r0, [r5, #0x1c]
    bl func_02002728
    ldr r4, [r5, #0x4]
    cmp r4, #0x0
    beq L_021fe270
    mov r0, r4
    bl func_02077d08
    mov r0, r4
    bl Heap_Free
L_021fe270:
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe280: .word data_ov026_022048c8
.size func_ov026_021fe23c, .-func_ov026_021fe23c

