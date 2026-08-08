.text

/* Exact fallback; see src/overlays/ov036/overlay036_record_list.c for documented portable C. */

    .extern Heap_Free

    .global func_ov036_021fdc1c
func_ov036_021fdc1c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x0]
    b L_021fdc40
L_021fdc2c:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq L_021fdc3c
    bl Heap_Free
L_021fdc3c:
    mov r0, r4
L_021fdc40:
    cmp r0, #0x0
    bne L_021fdc2c
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x0]
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_021fdc1c, .-func_ov036_021fdc1c
