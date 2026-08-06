; Matching retail form; see src/game/actor_collection_motion_category_build.c.
.text
.extern func_0202dd80
.extern func_0202ddac
.extern func_0202ddc4

    .global func_0202de90
    .type func_0202de90, @function
func_0202de90: ; 0x0202de90
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, #0x0
    mov r5, r0
    str r4, [r5, #0xe28]
    str r4, [r5, #0xe24]
    add r6, r5, #0x2000
    mov r11, r4
    mov r8, #0x1
    ldr r7, .L_0202dfe8
    b .L_0202dfd8
.L_0202deb8:
    ldr r9, [r5, r4, lsl #0x2]
    cmp r9, #0x0
    beq .L_0202dfd4
    ldr r10, [r9, #0x54]
    ldr r0, [r9, #0x14]
    tst r0, #0x8
    bne .L_0202def4
    ldr r1, [r9, #0x10]
    tst r1, #0x4
    bne .L_0202def4
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x6
    beq .L_0202def4
    tst r1, #0x100
    beq .L_0202dfd4
.L_0202def4:
    ldr r0, [r9, #0x14]
    tst r0, #0x200000
    moveq r0, r8
    movne r0, r11
    cmp r0, #0x0
    beq .L_0202dfd4
    mov r0, r9
    bl func_0202ddac
    cmp r0, #0x0
    bne .L_0202df2c
    mov r0, r9
    bl func_0202ddc4
    cmp r0, #0x0
    beq .L_0202df68
.L_0202df2c:
    cmp r10, #0x0
    beq .L_0202df58
    ldr r0, [r9, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202df58
    ldr r0, [r9, #0x14]
    tst r0, #0x8
    beq .L_0202df60
.L_0202df58:
    mov r10, #0x1
    b .L_0202df6c
.L_0202df60:
    mov r10, #0x0
    b .L_0202df6c
.L_0202df68:
    mov r10, #0x0
.L_0202df6c:
    ldr r0, [r9, #0x14]
    tst r0, r7
    bne .L_0202dfb0
    cmp r10, #0x0
    beq .L_0202df94
    mov r0, r5
    mov r1, #0x1
    mov r2, r9
    bl func_0202dd80
    b .L_0202dfb0
.L_0202df94:
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x1
    bne .L_0202dfb0
    mov r0, r5
    mov r1, #0x1
    mov r2, r9
    bl func_0202dd80
.L_0202dfb0:
    cmp r10, #0x0
    beq .L_0202dfd4
    ldr r0, [r9, #0x14]
    tst r0, #0x4
    bne .L_0202dfd4
    mov r2, r9
    mov r0, r5
    mov r1, #0x2
    bl func_0202dd80
.L_0202dfd4:
    add r4, r4, #0x1
.L_0202dfd8:
    ldr r0, [r6, #0xe74]
    cmp r4, r0
    blt .L_0202deb8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202dfe8: .word 0x1000002
    .size func_0202de90, . - func_0202de90
