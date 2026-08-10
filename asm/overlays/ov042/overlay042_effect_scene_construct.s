.text
.extern Heap_Alloc
.extern gHeapContext
.extern func_ov042_021fd66c
.extern func_ov042_021fcf80
.extern func_ov042_022050b0
.extern func_ov042_0220999c
.extern func_ov042_02207e04
.extern func_ov042_022087a0
.extern func_ov042_02208ffc
.extern func_ov042_02209190
.extern func_ov042_02200950
.extern func_0209a208
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_0209a2a4
.extern data_ov042_0220b57c
.extern data_ov042_0220b590
    .global func_ov042_021ffee4
func_ov042_021ffee4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r9, r1
    mov r8, r2
    bl func_ov042_021fd66c
    ldr r1, .L_02200470
    add r0, r10, #0xa4
    str r1, [r10, #0x0]
    bl func_ov042_021fcf80
    add r0, r10, #0xb0
    bl func_ov042_021fcf80
    add r0, r10, #0x154
    bl func_ov042_021fcf80
    add r0, r10, #0x160
    bl func_ov042_021fcf80
    add r0, r10, #0x170
    bl func_ov042_021fcf80
    add r0, r10, #0x17c
    bl func_ov042_021fcf80
    add r0, r10, #0x18c
    bl func_ov042_021fcf80
    add r0, r10, #0x198
    bl func_ov042_021fcf80
    add r0, r10, #0x1a4
    bl func_ov042_021fcf80
    add r0, r10, #0x1f4
    bl func_ov042_021fcf80
    add r0, r10, #0x200
    bl func_ov042_021fcf80
    add r0, r10, #0x214
    bl func_ov042_021fcf80
    add r0, r10, #0x250
    bl func_ov042_021fcf80
    add r0, r10, #0x264
    bl func_ov042_021fcf80
    add r0, r10, #0x270
    bl func_ov042_021fcf80
    add r0, r10, #0x27c
    bl func_ov042_021fcf80
    str r9, [r10, #0x48]
    ldr r0, .L_02200474
    ldr r1, .L_02200478
    mov r2, #0x4
    ldr r3, .L_0220047c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021fffac
    mov r1, r9
    bl func_ov042_022050b0
.L_021fffac:
    mov r1, #0x5
    ldr r5, .L_02200478
    ldr r11, .L_0220047c
    str r0, [r10, #0xa0]
    sub r7, r1, #0x1
    mov r6, #0x8c
    mov r4, #0x4
.L_021fffc8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_021ffff0
    mov r1, r9
    mov r2, r8
    bl func_ov042_0220999c
.L_021ffff0:
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x8c]
    subs r7, r7, #0x1
    bpl .L_021fffc8
    ldr r1, .L_02200480
    str r8, [sp, #0x0]
    mov r2, #0x2
    mov r0, r10
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    mov r2, #0x80000
    ldr r1, [r10, #0x4c]
    ldr r4, [r4, #0x0]
    sub r3, r2, #0xd0000
    blx r4
    ldr r2, [r10, #0x4c]
    mov r1, #0xa
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x4c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    str r8, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r1, .L_02200484
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x50]
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r0, r10
    ldr r1, [r10, #0x50]
    sub r3, r2, #0x29000
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    ldr r2, [r10, #0x50]
    mov r1, #0x7
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x50]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mvn r1, #0x9
    ldr r0, [r10, #0x50]
    str r1, [r0, #0x44]
    ldr r0, [r10, #0x50]
    ldr r1, [r10, #0x4c]
    bl func_0209a2a4
    str r8, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r1, .L_02200488
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x54]
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0x54]
    ldr r4, [r4, #0x0]
    mov r3, r2
    blx r4
    ldr r2, [r10, #0x54]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x54]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r10, #0x54]
    mov r1, #0xa
    str r1, [r0, #0x44]
    ldr r0, [r10, #0x54]
    ldr r1, [r10, #0x4c]
    bl func_0209a2a4
    ldr r1, .L_0220048c
    str r8, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x58]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    mov r2, #0x80000
    ldr r1, [r10, #0x58]
    ldr r4, [r4, #0x0]
    sub r3, r2, #0xbc000
    blx r4
    ldr r2, [r10, #0x58]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x58]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3
    ldr r1, [r10, #0x58]
    mvn r2, #0x9
    ldr r5, .L_02200490
    ldr r4, .L_02200494
    str r2, [r1, #0x44]
    sub r7, r0, #0x1
    mov r6, #0x2
    mov r11, #0x0
.L_022001fc:
    str r8, [sp, #0x0]
    mov r0, r10
    mov r1, r5
    mov r2, r4
    add r3, r5, #0x1
    str r6, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x5c]
    str r11, [sp, #0x0]
    str r11, [sp, #0x4]
    mov r0, r10
    ldr r1, [r1, #0x5c]
    mov r2, r11
    mov r3, r11
    ldr ip, [r0, #0x0]
    ldr ip, [ip, #0x0]
    blx ip
    add r3, r10, r7, lsl #0x2
    ldr r2, [r3, #0x5c]
    and r1, r7, #0xff
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r3, #0x5c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    subs r7, r7, #0x1
    bpl .L_022001fc
    ldr r0, [r10, #0x5c]
    mvn r2, #0x7c
    str r2, [r0, #0x44]
    sub r1, r2, #0x2
    ldr r0, [r10, #0x60]
    sub r2, r2, #0x1
    str r1, [r0, #0x44]
    ldr r1, [r10, #0x64]
    mov r0, r10
    str r2, [r1, #0x44]
    bl func_ov042_02200950
    mov r0, #0x4
    ldr r5, .L_02200478
    ldr r11, .L_0220047c
    sub r7, r0, #0x1
    mov r6, #0x90
    mov r4, r0
.L_022002b4:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022002dc
    mov r1, r9
    mov r2, r8
    bl func_ov042_02207e04
.L_022002dc:
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x68]
    subs r7, r7, #0x1
    bpl .L_022002b4
    mov r0, #0x3
    ldr r5, .L_02200478
    ldr r11, .L_0220047c
    sub r7, r0, #0x1
    mov r6, #0x8c
    mov r4, #0x4
.L_02200304:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220032c
    mov r1, r9
    mov r2, r8
    bl func_ov042_022087a0
.L_0220032c:
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x78]
    subs r7, r7, #0x1
    bpl .L_02200304
    mov r0, #0x2
    ldr r5, .L_02200478
    ldr r11, .L_0220047c
    sub r7, r0, #0x1
    mov r6, #0x90
    mov r4, #0x4
.L_02200354:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02200380
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl func_ov042_02208ffc
.L_02200380:
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x84]
    bl func_ov042_02209190
    subs r7, r7, #0x1
    bpl .L_02200354
    mov r2, #0x0
    str r2, [r10, #0xa8]
    sub r0, r2, #0x50000
    str r0, [r10, #0xac]
    str r2, [r10, #0x164]
    sub r0, r2, #0x41000
    str r0, [r10, #0x168]
    str r2, [r10, #0x174]
    sub r0, r2, #0x26000
    str r0, [r10, #0x178]
    str r2, [r10, #0x184]
    str r2, [r10, #0x180]
    str r2, [r10, #0x194]
    str r2, [r10, #0x190]
    str r2, [r10, #0x1ac]
    str r2, [r10, #0x1a8]
    str r2, [r10, #0x1a0]
    str r2, [r10, #0x19c]
    mov r1, #0x1
    str r1, [r10, #0x1b0]
    str r2, [r10, #0xc0]
    str r2, [r10, #0xbc]
    str r2, [r10, #0xd8]
    ldr r1, .L_02200498
    str r2, [r10, #0xdc]
    mov r0, #0x4
    str r1, [r10, #0xe0]
    str r0, [r10, #0xe4]
    str r2, [r10, #0xc4]
    str r2, [r10, #0x1e4]
    str r2, [r10, #0x1e8]
    str r2, [r10, #0xc8]
    sub r0, r0, #0x5
    str r2, [r10, #0xcc]
    str r0, [r10, #0x16c]
    str r0, [r10, #0x150]
    str r2, [r10, #0x1ec]
    str r2, [r10, #0x1c0]
    str r2, [r10, #0x1b8]
    str r2, [r10, #0x1b4]
    str r2, [r10, #0x1d8]
    str r2, [r10, #0x1d4]
    str r2, [r10, #0x1d0]
    str r2, [r10, #0x1cc]
    str r2, [r10, #0x1c8]
    str r2, [r10, #0x1c4]
    str r2, [r10, #0x1bc]
    str r2, [r10, #0x24c]
    str r2, [r10, #0x248]
    str r2, [r10, #0x244]
    str r2, [r10, #0x240]
    mov r0, r10
    str r2, [r10, #0x23c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02200470: .word data_ov042_0220b57c
.L_02200474: .word 0x848
.L_02200478: .word data_ov042_0220b590
.L_0220047c: .word gHeapContext
.L_02200480: .word 0x12e0
.L_02200484: .word 0x12e3
.L_02200488: .word 0x12e8
.L_0220048c: .word 0x12f7
.L_02200490: .word 0x1396
.L_02200494: .word 0x1078
.L_02200498: .word 0x352
.size func_ov042_021ffee4, . - func_ov042_021ffee4

