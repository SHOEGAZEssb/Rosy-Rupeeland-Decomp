.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov089_02219a04
.extern func_0200222c
.extern func_020022dc
.extern func_02005058
.extern func_0204aff4
.extern func_0204b078
.extern func_0204b6cc
.extern func_ov062_0220fe78
.extern func_ov062_02210674
.extern func_ov089_022179dc
.extern func_ov089_02218e80
.extern func_ov089_02219214
.extern gGameWork
.extern gHeapContext

.global func_ov089_02218f28
func_ov089_02218f28:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    add r0, r5, #0x200
    ldrsh r2, [r0, #0x14]
    mov r4, r1
    cmp r2, #0x0
    bne .L_022191e8
    ldrh r2, [r0, #0xc]
    ldr r1, .L_022191fc
    orr r2, r2, #0x2
    strh r2, [r0, #0xc]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02218f84
    bl func_0204aff4
    cmp r0, #0x0
    addeq r0, r5, #0x200
    ldreqh r1, [r0, #0xc]
    orreq r1, r1, #0x800
    streqh r1, [r0, #0xc]
.L_02218f84:
    mov r0, r5
    bl func_ov089_022179dc
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    ldrb r3, [r0, #0x38]
    sub r2, r1, #0x1
    cmp r4, #0x0
    rsb r0, r3, #0x8
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x10
    strb r3, [r5, #0xd4]
    str r0, [r5, #0xc8]
    str r0, [r5, #0x224]
    str r1, [r5, #0x228]
    str r2, [r5, #0x230]
    ble .L_02219104
    bl func_020022dc
    ldr r2, .L_02219200
    mov r1, #0x2
    bl func_0200222c
    add r0, r5, #0x200
    ldrh r0, [r0, #0xc]
    tst r0, #0x800
    beq .L_02219084
    ldr r1, .L_02219204
    ldr r3, .L_02219208
    mov r0, #0x40
    mov r2, #0x4
    mov r7, #0x0
    bl Heap_Alloc
    movs r6, r0
    beq .L_02219044
    add r0, sp, #0x1c
    mov r1, r5
    mov r2, r7
    bl func_ov089_02218e80
    str r4, [sp, #0x0]
    mov r7, #0x1
    str r7, [sp, #0x4]
    ldr r0, .L_022191fc
    str r5, [sp, #0x8]
    ldr r0, [r0, #0x0]
    add r2, sp, #0x1c
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea8]
    mov r0, r6
    mov r3, #0x18
    bl func_ov062_02210674
.L_02219044:
    cmp r7, #0x0
    beq .L_02219054
    add r0, sp, #0x1c
    bl func_02005058
.L_02219054:
    add r0, r5, #0x200
    ldrh r3, [r0, #0xc]
    mov r2, #0x0
    ldr r1, .L_022191fc
    orr r3, r3, #0x100
    strh r3, [r0, #0xc]
    ldr r0, [r5, #0x244]
    str r2, [r0, #0x14]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    bl func_0204b6cc
.L_02219084:
    ldr r1, .L_02219204
    ldr r3, .L_02219208
    mov r0, #0x48
    mov r2, #0x4
    mov r7, #0x0
    bl Heap_Alloc
    movs r6, r0
    beq .L_022190d4
    add r0, sp, #0xc
    mov r1, r5
    mov r2, #0x1
    bl func_ov089_02218e80
    mov r7, #0x1
    str r7, [sp, #0x0]
    add r1, sp, #0xc
    mov r0, r6
    mov r3, r4
    mov r2, #0x18
    stmib sp, {r5, r7}
    bl func_ov062_0220fe78
.L_022190d4:
    cmp r7, #0x0
    beq .L_022190e4
    add r0, sp, #0xc
    bl func_02005058
.L_022190e4:
    add r0, r5, #0x200
    ldrh r2, [r0, #0xc]
    mov r1, #0x0
    orr r2, r2, #0x80
    strh r2, [r0, #0xc]
    ldr r0, [r5, #0x240]
    str r1, [r0, #0x14]
    b .L_022191d8
.L_02219104:
    ldr r0, .L_022191fc
    mov r2, r1
    ldr r0, [r0, #0x0]
    mov r3, r1
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ldr ip, [r4, #0x230]
    add r0, r4, #0x38
    bic ip, ip, #0x4
    str ip, [r4, #0x230]
    bl func_ov089_02219214
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov089_02219214
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov089_02219214
    ldr r1, [r4, #0x230]
    mov r0, r4
    orr r1, r1, #0x100
    str r1, [r4, #0x230]
    ldr r2, [r4, #0x14]
    mov r1, #0x0
    orr r2, r2, #0x2
    str r2, [r4, #0x14]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_022191fc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_022191d8
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_022191fc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    bl func_0204b6cc
    ldr r0, .L_022191fc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    bl func_0204b078
.L_022191d8:
    ldr r0, .L_0221920c
    ldr r1, .L_02219210
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_022191e8:
    add r0, r5, #0x200
    mov r1, #0x1
    strh r1, [r0, #0x14]
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_022191fc: .word data_021052fc
.L_02219200: .word 0x3e
.L_02219204: .word data_ov089_02219a04
.L_02219208: .word gHeapContext
.L_0221920c: .word gGameWork
.L_02219210: .word 0x402
.size func_ov089_02218f28, . - func_ov089_02218f28
