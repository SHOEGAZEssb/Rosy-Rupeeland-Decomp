.text

/* Exact fallback; see src/overlays/ov036/overlay036_record_list.c for documented portable C. */

    .extern func_02091c7c
    .extern Heap_Free

    .global func_ov036_021fdcec
func_ov036_021fdcec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r5, [r7, #0x0]
    mov r4, #0x2
    b L_021fdd40
L_021fdd00:
    mov r1, r4
    add r0, r5, #0x18
    ldr r6, [r5, #0x0]
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fdd3c
    ldr r0, [r5, #0x0]
    cmp r5, #0x0
    str r0, [r7, #0x0]
    beq L_021fdd30
    mov r0, r5
    bl Heap_Free
L_021fdd30:
    ldr r0, [r7, #0x8]
    sub r0, r0, #0x1
    str r0, [r7, #0x8]
L_021fdd3c:
    mov r5, r6
L_021fdd40:
    cmp r5, #0x0
    bne L_021fdd00
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_ov036_021fdcec, .-func_ov036_021fdcec
