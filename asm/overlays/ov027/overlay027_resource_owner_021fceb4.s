.text

/* Exact fallback; see src/overlays/ov027/overlay027_resource_owner.c. */
.extern data_ov027_021feed0
.extern Graphics3DResourceBinding_Destroy
.extern func_ov027_021fce00
.extern Heap_Free


    .global func_ov027_021fceb4
func_ov027_021fceb4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fcef8
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fcee0
    mov r0, r4
    bl Graphics3DResourceBinding_Destroy
    mov r0, r4
    bl Heap_Free
L_021fcee0:
    mov r0, r5
    bl func_ov027_021fce00
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fcef8: .word data_ov027_021feed0
.size func_ov027_021fceb4, .-func_ov027_021fceb4

