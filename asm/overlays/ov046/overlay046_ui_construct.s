.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_ui_construct.c.
.extern GameWork_TestFlag
.extern __construct_array
.extern data_020d77fc
.extern data_020d780c
.extern data_020f4e18
.extern func_02071ea4
.extern func_02071eb8
.extern func_02071ee0
.extern func_02073e48
.extern func_02073ffc
.extern func_020742cc
.extern func_ov046_0220bac0
.extern gGameWork

.global func_ov046_0220b7bc
func_ov046_0220b7bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x8
    mov r5, r1
    mov r4, r2
    bl func_02071ea4
    ldr r2, .L_0220ba60
    ldr r3, .L_0220ba64
    str r2, [sp, #0x0]
    add r0, r10, #0x14
    mov r1, #0x2
    mov r2, #0xc
    bl __construct_array
    add r0, r10, #0x2c
    bl func_02071ea4
    mov r0, r5
    str r5, [r10, #0x0]
    bl func_020742cc
    str r0, [r10, #0x4]
    ldr r3, .L_0220ba68
    str r4, [r10, #0x114]
    mov r0, #0x18
    str r0, [r10, #0xc0]
    mov r1, #0x0
    str r1, [r10, #0x10c]
    ldr r0, .L_0220ba6c
    str r1, [r10, #0x110]
    ldr r0, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x2e]
    str r0, [r10, #0xc4]
    cmp r0, #0xb
    movge r0, #0xa
    strge r0, [r10, #0xc4]
    str r3, [sp, #0x0]
    ldr r0, .L_0220ba70
    sub r3, r3, #0x1
    ldr r1, [r0, #0x0]
    add r0, r10, #0x8
    bl func_02071ee0
    ldr r4, .L_0220ba74
    ldr r7, .L_0220ba70
    mov r5, #0x0
    add r8, r10, #0x14
    mov r6, #0xc
.L_0220b878:
    add r3, r4, r5, lsl #0x3
    ldrh r1, [r3, #0x4]
    mla r0, r5, r6, r8
    str r1, [sp, #0x0]
    mov r1, r5, lsl #0x3
    ldrh r2, [r4, r1]
    ldrh r3, [r3, #0x2]
    ldr r1, [r7, #0x0]
    bl func_02071ee0
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0220b878
    ldr r3, .L_0220ba78
    ldr r0, .L_0220ba70
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0x2c
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r10, #0x4]
    add r1, r10, #0x8
    mov r2, #0x1
    bl func_02073ffc
    mov r2, #0x0
    str r0, [r10, #0x38]
    mov r1, #0x2
    stmia sp, {r1, r2}
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x38]
    mov r3, r2
    bl func_02073e48
    mov r2, #0x0
    mvn r1, #0x0
    mov r5, r2
.L_0220b908:
    add r0, r10, r2, lsl #0x2
    str r1, [r0, #0xc8]
    add r2, r2, #0x1
    str r5, [r0, #0xd4]
    cmp r2, #0x3
    blt .L_0220b908
    mov r4, #0x1
    mov r9, #0x2
    mov r8, #0x100
    mov r7, #0x4
    mov r6, #0x0
.L_0220b934:
    ldr r0, [r10, #0x4]
    mov r2, r4
    add r1, r10, #0x14
    bl func_02073ffc
    add r1, r10, r5, lsl #0x2
    str r0, [r1, #0x3c]
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    str r7, [sp, #0x8]
    ldr r0, [r1, #0x3c]
    mov r1, r6
    mov r2, r6
    mov r3, r6
    bl func_02073e48
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_0220b934
    mov r8, #0x0
    ldr r6, .L_0220ba7c
    ldr r4, .L_0220ba6c
    mov r11, r8
    mov r5, #0x2
    mov r7, #0x1
.L_0220b990:
    ldr r0, [r10, #0xc4]
    cmp r8, r0
    addgt r0, r10, r8, lsl #0x2
    strgt r7, [r0, #0xe0]
    bgt .L_0220ba08
    mov r0, #0x34
    mla r9, r8, r0, r6
    ldrh r1, [r9, #0x1e]
    ldr r0, [r4, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220b9fc
    ldr r0, [r10, #0x114]
    cmp r0, #0x1
    addeq r0, r10, r8, lsl #0x2
    streq r5, [r0, #0xe0]
    beq .L_0220ba08
    ldrh r1, [r9, #0x20]
    ldr r0, [r4, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    addne r0, r10, r8, lsl #0x2
    strne r11, [r0, #0xe0]
    addeq r1, r10, r8, lsl #0x2
    moveq r0, #0x2
    streq r0, [r1, #0xe0]
    b .L_0220ba08
.L_0220b9fc:
    add r1, r10, r8, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xe0]
.L_0220ba08:
    add r8, r8, #0x1
    cmp r8, #0xb
    blt .L_0220b990
    ldr r0, [r10, #0x4]
    add r1, r10, #0x2c
    mov r2, #0x1
    bl func_02073ffc
    mov r1, #0x0
    str r0, [r10, #0xbc]
    mov r0, #0x2
    stmia sp, {r0, r1}
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r10, #0xbc]
    mov r2, r1
    mov r3, r1
    bl func_02073e48
    mov r0, r10
    bl func_ov046_0220bac0
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220ba60: .word func_02071eb8
.L_0220ba64: .word func_02071ea4
.L_0220ba68: .word 0x3328
.L_0220ba6c: .word gGameWork
.L_0220ba70: .word data_020f4e18
.L_0220ba74: .word data_020d77fc
.L_0220ba78: .word 0x400e
.L_0220ba7c: .word data_020d780c
.size func_ov046_0220b7bc, . - func_ov046_0220b7bc
