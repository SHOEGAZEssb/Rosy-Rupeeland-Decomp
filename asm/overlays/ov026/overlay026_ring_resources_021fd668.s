.text

/* Exact fallback; see src/overlays/ov026/overlay026_ring_resources.c. */
.extern data_ov026_02204998
.extern Graphics3DResourceBinding_Destroy
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_021fd668
func_ov026_021fd668:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd6ac
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fd694
    mov r0, r4
    bl Graphics3DResourceBinding_Destroy
    mov r0, r4
    bl Heap_Free
L_021fd694:
    mov r0, r5
    bl func_ov026_021fce50
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd6ac: .word data_ov026_02204998
.size func_ov026_021fd668, .-func_ov026_021fd668

