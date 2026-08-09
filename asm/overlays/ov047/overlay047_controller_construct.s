.text
; Matching fallback for the portable implementation in src/overlays/ov047/overlay047_controller_recovery.c.
.extern data_020f4e18
.extern func_020703d8
.extern func_0207043c
.extern func_02070474
.extern func_020704c8
.extern func_02070580
.extern func_02070874
.extern func_02070888
.extern func_02071568
.extern func_020716bc
.extern func_020b20b4
.extern func_020b210c
.extern func_020b2180
.extern func_020b21c8
.extern func_020b2238
.extern func_020b239c
.extern gGameWork

.global func_ov047_0220b740
func_ov047_0220b740:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    str r1, [r6, #0x20]
    ldr r0, [sp, #0x18]
    mov r1, #0x0
    str r0, [r6, #0x28]
    str r1, [r6, #0x24]
    str r1, [r6, #0x2c]
    str r1, [r6, #0x0]
    str r1, [r6, #0x4]
    ldr r0, [r6, #0x20]
    mov r5, r2
    mov r4, r3
    cmp r0, #0xe
    addls pc, pc, r0, lsl #0x2
    b .L_0220ba44
.L_0220b780:
    b .L_0220ba44
    b .L_0220b7d0
    b .L_0220b7d0
    b .L_0220b9c4
    b .L_0220b9dc
    b .L_0220b9f8
    b .L_0220ba10
    b .L_0220ba2c
    b .L_0220ba2c
    b .L_0220ba2c
    b .L_0220ba2c
    b .L_0220b7bc
    b .L_0220b7bc
    b .L_0220b7bc
    b .L_0220b7bc
.L_0220b7bc:
    ldr r0, .L_0220ba4c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x2]
    str r0, [r6, #0x2c]
.L_0220b7d0:
    ldr r0, [r6, #0x20]
    cmp r0, #0xd
    cmpne r0, #0xe
    bne .L_0220b808
    ldr r0, .L_0220ba50
    ldr r1, .L_0220ba54
    ldr r0, [r0, #0x0]
    bl func_02071568
    ldr r1, .L_0220ba50
    str r0, [r6, #0x0]
    ldr r0, [r1, #0x0]
    ldr r1, .L_0220ba58
    bl func_020716bc
    b .L_0220b82c
.L_0220b808:
    ldr r0, .L_0220ba50
    ldr r1, .L_0220ba5c
    ldr r0, [r0, #0x0]
    bl func_02071568
    ldr r1, .L_0220ba50
    str r0, [r6, #0x0]
    ldr r0, [r1, #0x0]
    ldr r1, .L_0220ba60
    bl func_020716bc
.L_0220b82c:
    str r0, [r6, #0x4]
    ldr r0, [r6, #0x0]
    bl func_0207043c
    rsb r0, r0, #0x20000
    str r0, [r6, #0x30]
    ldr r0, [r6, #0x4]
    bl func_02070888
    rsb r0, r0, #0x4000
    str r0, [r6, #0x34]
    ldr r0, [r6, #0x0]
    bl func_02070474
    str r0, [r6, #0x38]
    ldr r0, [r6, #0x0]
    bl func_020704c8
    str r0, [r6, #0x3c]
    ldr r0, [r6, #0x0]
    bl func_02070580
    str r0, [r6, #0x40]
    bl func_020b239c
    ldr r0, [r6, #0x0]
    ldr r7, [r0, #0x24]
    bl func_0207043c
    mov r2, r0
    ldr r1, [r6, #0x30]
    mov r0, r7
    bl func_020b2238
    bl func_020b21c8
    bl func_020b2180
    ldr r0, [r6, #0x4]
    bl func_02070874
    mov r7, r0
    ldr r0, [r6, #0x4]
    bl func_02070888
    mov r2, r0
    ldr r1, [r6, #0x34]
    mov r0, r7
    bl func_020b210c
    bl func_020b20b4
    ldr r0, [r6, #0x0]
    bl func_020703d8
    str r5, [r6, #0x8]
    str r4, [r6, #0xc]
    ldr r0, [r6, #0x8]
    cmp r0, #0x100
    movgt r0, #0x100
    strgt r0, [r6, #0x8]
    bgt .L_0220b8f4
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r6, #0x8]
.L_0220b8f4:
    ldr r0, [r6, #0xc]
    cmp r0, #0xc0
    movgt r0, #0xc0
    strgt r0, [r6, #0xc]
    bgt .L_0220b914
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r6, #0xc]
.L_0220b914:
    ldr r0, [r6, #0x20]
    cmp r0, #0xb
    bgt .L_0220b944
    bge .L_0220b96c
    cmp r0, #0x2
    bgt .L_0220ba44
    cmp r0, #0x1
    blt .L_0220ba44
    beq .L_0220b96c
    cmp r0, #0x2
    beq .L_0220b9a0
    b .L_0220ba44
.L_0220b944:
    cmp r0, #0xe
    bgt .L_0220ba44
    cmp r0, #0xc
    blt .L_0220ba44
    beq .L_0220b9a0
    cmp r0, #0xd
    beq .L_0220b96c
    cmp r0, #0xe
    beq .L_0220b9a0
    b .L_0220ba44
.L_0220b96c:
    ldr r0, [r6, #0x8]
    sub r0, r0, #0x180
    str r0, [r6, #0x10]
    ldr r0, [r6, #0xc]
    sub r0, r0, #0x180
    str r0, [r6, #0x14]
    ldr r0, [r6, #0x8]
    add r0, r0, #0x180
    str r0, [r6, #0x18]
    ldr r0, [r6, #0xc]
    add r0, r0, #0x180
    str r0, [r6, #0x1c]
    b .L_0220ba44
.L_0220b9a0:
    ldr r0, [r6, #0x8]
    str r0, [r6, #0x10]
    ldr r0, [r6, #0xc]
    str r0, [r6, #0x14]
    ldr r0, [r6, #0x8]
    str r0, [r6, #0x18]
    ldr r0, [r6, #0xc]
    str r0, [r6, #0x1c]
    b .L_0220ba44
.L_0220b9c4:
    str r1, [r6, #0x18]
    str r1, [r6, #0x10]
    str r1, [r6, #0x14]
    mov r0, #0xc0
    str r0, [r6, #0x1c]
    b .L_0220ba44
.L_0220b9dc:
    mov r0, #0x100
    str r0, [r6, #0x18]
    str r0, [r6, #0x10]
    str r1, [r6, #0x14]
    mov r0, #0xc0
    str r0, [r6, #0x1c]
    b .L_0220ba44
.L_0220b9f8:
    str r1, [r6, #0x10]
    mov r0, #0x100
    str r0, [r6, #0x18]
    str r1, [r6, #0x1c]
    str r1, [r6, #0x14]
    b .L_0220ba44
.L_0220ba10:
    str r1, [r6, #0x10]
    mov r1, #0x100
    mov r0, #0xc0
    str r1, [r6, #0x18]
    str r0, [r6, #0x1c]
    str r0, [r6, #0x14]
    b .L_0220ba44
.L_0220ba2c:
    str r1, [r6, #0x10]
    str r1, [r6, #0x14]
    mov r0, #0x100
    str r0, [r6, #0x18]
    mov r0, #0xc0
    str r0, [r6, #0x1c]
.L_0220ba44:
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220ba4c: .word gGameWork
.L_0220ba50: .word data_020f4e18
.L_0220ba54: .word 0x6128
.L_0220ba58: .word 0x6129
.L_0220ba5c: .word 0x6126
.L_0220ba60: .word 0x6127
.size func_ov047_0220b740, . - func_ov047_0220b740
