.text

/* Exact fallback; see src/overlays/ov029/overlay029_lifecycle_tail.c. */
.extern func_02092288
.extern func_ov029_021fd6fc
.extern func_ov029_021fd850
.extern gGameWork
.extern Heap_Free


    .global func_ov029_021feb08
func_ov029_021feb08:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021feb28
    cmp r1, #0x1
    beq L_021feb8c
    b L_021feb94
L_021feb28:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021feb94
    ldr r0, [r4, #0x58]
    cmp r0, #0x5
    mov r0, r4
    bne L_021feb50
    mov r1, #0x6d
    bl func_02092288
    b L_021feb58
L_021feb50:
    mov r1, #0x69
    bl func_02092288
L_021feb58:
    ldr r1, L_021feba4
    ldr r3, [r4, #0x6c]
    ldr r0, [r1, #0x0]
    mov r2, #0x0
    add r0, r0, #0x200
    strh r3, [r0, #0x4]
    ldr r3, [r4, #0xac]
    ldr r0, [r1, #0x0]
    str r3, [r0, #0x7cc]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r2}
    b L_021feb94
L_021feb8c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021feb94:
    mov r0, r4
    bl func_ov029_021fd6fc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021feba4: .word gGameWork
.size func_ov029_021feb08, .-func_ov029_021feb08
    .global func_ov029_021feba8
func_ov029_021feba8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov029_021feba8, .-func_ov029_021feba8
