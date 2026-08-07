.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */
.extern data_020f4e18
.extern data_021f5128
.extern func_02071ee0
.extern func_02073e48
.extern func_02073ffc
.extern func_0207b464
.extern func_0207b490
.extern func_0207b4bc
.extern func_0207b4e8


    .global func_ov023_021fd634
func_ov023_021fd634:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r3, [r5, #0x3c]
    mov r4, #0x0
    cmp r3, #0x0
    beq L_021fd71c
    ldr r2, [r5, #0x44]
    ldr r0, [r5, #0x40]
    cmp r2, r0
    movge r0, r4
    bge L_021fd720
    str r1, [r3, r2, lsl #0x2]
    ldr r0, [r5, #0x14]
    add r4, r3, r2, lsl #0x2
    cmp r0, #0x0
    bne L_021fd710
    ldr r1, [r1, #0x4]
    ldr r0, L_021fd728
    ldr r1, [r1, #0xc]
    ldr r2, [r0, #0x0]
    and r0, r1, #0xff
    ldr r8, [r2, r0, lsl #0x2]
    add r0, r8, #0x660
    bl func_0207b464
    mov r7, r0
    add r0, r8, #0x660
    bl func_0207b490
    mov r6, r0
    add r0, r8, #0x660
    bl func_0207b4bc
    mov r2, r7
    mov r3, r6
    str r0, [sp, #0x0]
    add r0, r5, #0x8
    ldr r1, L_021fd72c
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r0, [r5, #0x4]
    add r1, r5, #0x8
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r5, #0x14]
    add r0, r8, #0x660
    bl func_0207b4e8
    mov r1, r0
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x14]
    mov r2, #0x2a
    mov r3, #0x30
    bl func_02073e48
L_021fd710:
    ldr r0, [r5, #0x44]
    add r0, r0, #0x1
    str r0, [r5, #0x44]
L_021fd71c:
    mov r0, r4
L_021fd720:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_021fd728: .word data_021f5128
L_021fd72c: .word data_020f4e18
.size func_ov023_021fd634, .-func_ov023_021fd634

