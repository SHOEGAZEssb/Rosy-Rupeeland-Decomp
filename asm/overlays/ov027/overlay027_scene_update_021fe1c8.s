.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_update.c. */
.extern data_ov027_021fe950
.extern data_ov027_021fef44
.extern func_020773a8
.extern func_0209189c
.extern func_020918f4
.extern func_020948d4
.extern func_02095274
.extern func_02095360
.extern func_ov027_021fd718
.extern func_ov027_021fe0f8
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov027_021fe1c8
func_ov027_021fe1c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, r0
    add r0, r4, #0x120
    bl func_02095360
    add r0, r4, #0x140
    bl func_02095360
    add r0, r4, #0x150
    bl func_02095360
    ldr r7, [r4, #0x134]
    b L_021fe310
L_021fe1f0:
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r7, #0xac]
    mov r8, #0x0
    str r8, [r7, #0xac]
    cmp r0, #0x0
    beq L_021fe30c
    add r5, r4, #0x1bc
    mvn r6, #0xff
    mov r11, #0x10
L_021fe220:
    ldr r1, L_021fe470
    ldr r3, L_021fe474
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_021fe244
    bl func_ov027_021fd718
    mov r9, r0
L_021fe244:
    ldr r10, [r7, #0x10]
    add r0, r5, #0x400
    mov r1, r6
    mov r2, #0x100
    bl func_0209189c
    add r1, r10, r0
    add r0, r9, #0xc
    bl func_020948d4
    ldr r10, [r7, #0x20]
    add r0, r5, #0x400
    mov r1, #0x80
    mov r2, #0x180
    bl func_0209189c
    add r1, r10, r0
    add r0, r9, #0x1c
    bl func_020948d4
    add r0, r9, #0x2c
    mov r1, #0x100
    bl func_020948d4
    add r0, r5, #0x400
    add r1, r6, #0xc0
    mov r2, #0x40
    bl func_0209189c
    str r0, [r9, #0x9c]
    add r0, r5, #0x400
    mov r1, #0x80
    mov r2, #0x100
    bl func_0209189c
    str r0, [r9, #0xa0]
    str r11, [r9, #0xa4]
    mov r0, #0x1e
    str r0, [r9, #0xac]
    add r0, r5, #0x400
    mov r1, #0x1e
    bl func_020918f4
    str r0, [r9, #0xa8]
    tst r8, #0x1
    beq L_021fe2f4
    ldr r0, [r7, #0xa0]
    ldr r0, [r0, #0x0]
    mov r1, r0, lsl #0x1
    ldr r0, L_021fe478
    ldrh r0, [r0, r1]
    strh r0, [r9, #0xb4]
L_021fe2f4:
    mov r1, r9
    add r0, r4, #0x150
    bl func_02095274
    add r8, r8, #0x1
    cmp r8, #0x4
    blt L_021fe220
L_021fe30c:
    ldr r7, [r7, #0x8]
L_021fe310:
    cmp r7, #0x0
    bne L_021fe1f0
    ldr r8, [r4, #0x144]
    add r5, r4, #0x1bc
    mov r11, #0xb8
    mvn r7, #0xff
    mov r6, #0x80
    b L_021fe41c
L_021fe330:
    ldrh r0, [r8, #0x98]
    tst r0, #0x1
    beq L_021fe418
    bic r0, r0, #0x1
    strh r0, [r8, #0x98]
    ldr r1, L_021fe470
    ldr r3, L_021fe474
    mov r0, r11
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_021fe368
    bl func_ov027_021fd718
    mov r9, r0
L_021fe368:
    ldr r10, [r8, #0x10]
    add r0, r5, #0x400
    mov r1, r7
    mov r2, #0x100
    bl func_0209189c
    add r1, r10, r0
    add r0, r9, #0xc
    bl func_020948d4
    ldr r10, [r8, #0x20]
    add r0, r5, #0x400
    add r1, r7, #0x80
    mov r2, #0x80
    bl func_0209189c
    add r1, r10, r0
    add r0, r9, #0x1c
    bl func_020948d4
    add r0, r9, #0x2c
    mov r1, #0x100
    bl func_020948d4
    add r0, r5, #0x400
    add r1, r7, #0xc0
    mov r2, #0x40
    bl func_0209189c
    str r0, [r9, #0x9c]
    add r0, r5, #0x400
    mov r1, #0x80
    mov r2, #0x100
    bl func_0209189c
    str r0, [r9, #0xa0]
    str r6, [r9, #0xa4]
    mov r0, #0x10
    str r0, [r9, #0xac]
    mov r0, #0x0
    str r0, [r9, #0xa8]
    add r0, r5, #0x400
    mov r1, #0x0
    mov r2, #0x10
    bl func_0209189c
    mov r0, r0, lsl #0xa
    orr r0, r0, r7, lsr #0x16
    strh r0, [r9, #0xb4]
    mov r1, r9
    add r0, r4, #0x150
    bl func_02095274
L_021fe418:
    ldr r8, [r8, #0x8]
L_021fe41c:
    cmp r8, #0x0
    bne L_021fe330
    ldr r0, [r4, #0x58]
    bl func_020773a8
    ldr r1, [r4, #0x118]
    mov r0, r4
    ldr r3, [r1, #0x30]
    ldr r2, [r1, #0x20]
    ldr r1, [r1, #0x10]
    str r1, [r4, #0x84]
    str r2, [r4, #0x88]
    str r3, [r4, #0x8c]
    ldr r1, [r4, #0x11c]
    ldr r3, [r1, #0x30]
    ldr r2, [r1, #0x20]
    ldr r1, [r1, #0x10]
    str r1, [r4, #0x90]
    str r2, [r4, #0x94]
    str r3, [r4, #0x98]
    bl func_ov027_021fe0f8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe470: .word data_ov027_021fef44
L_021fe474: .word gHeapContext
L_021fe478: .word data_ov027_021fe950
.size func_ov027_021fe1c8, .-func_ov027_021fe1c8

