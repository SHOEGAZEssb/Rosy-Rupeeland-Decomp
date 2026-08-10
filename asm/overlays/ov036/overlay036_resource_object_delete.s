.text

/* Exact fallback; see src/overlays/ov036/overlay036_resource_object.c for documented portable C. */

    .extern Graphics3DResourceBinding_Destroy
    .extern Heap_Free
    .extern func_ov036_021fcf30
    .extern data_ov036_02205ff0

    .global func_ov036_021fdfe0
func_ov036_021fdfe0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe024
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fe00c
    mov r0, r4
    bl Graphics3DResourceBinding_Destroy
    mov r0, r4
    bl Heap_Free
L_021fe00c:
    mov r0, r5
    bl func_ov036_021fcf30
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe024: .word data_ov036_02205ff0
    .size func_ov036_021fdfe0, .-func_ov036_021fdfe0
