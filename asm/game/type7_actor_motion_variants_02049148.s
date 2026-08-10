; Matching retail form; see src/game/type7_actor_motion_variants.c.
.extern data_020c9670
.extern func_020050a4
.extern Actor_GetCachedTerrainHeight
.extern Type7Actor_UpdateMotionTowardTransform
.extern func_02047dd8
.extern func_0204820c
.extern func_0204832c
.extern func_0204876c
.extern func_0204a2e8
.extern func_0204a360
.extern func_0204a5dc
.extern func_020ada8c
.extern func_020adcac
.extern func_020be328
.extern genrand_int32
    .text
    .global func_02049148
.type func_02049148, @function
func_02049148: ; 0x02049148
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    add r0, r4, #0x200
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    ldr r1, [r4, #0xd0]
    bic r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldrsh r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_020491f0
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl func_020050a4
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x10000
    bl func_020ada8c
    ldr r1, [r4, #0x29c]
    mov r0, r0, lsl #0x10
    ldrb r1, [r1, #0x54]
    mov r2, r0, lsr #0x10
    ldr r3, .L_02049298
    cmp r1, #0x2
    mov r1, r2, asr #0x4
    mov lr, r1, lsl #0x1
    add r1, lr, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r1]
    movne r0, #0x18
    ldr ip, [r4, #0x7c]
    moveq r0, #0x80
    mla r2, r0, r2, ip
    mov r1, lr, lsl #0x1
    str r2, [r4, #0x7c]
    ldrsh r2, [r3, r1]
    ldr r3, [r4, #0x80]
    mov r1, #0x0
    mla r2, r0, r2, r3
    str r2, [r4, #0x80]
    str r1, [r4, #0x210]
.L_020491f0:
    mov r0, r4
    bl func_0204832c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_0204820c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0204876c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x64]
    cmp r0, #0x0
    ble .L_02049250
    add r0, r4, #0x78
    add r1, r4, #0x18
    bl func_020050a4
    b .L_02049268
.L_02049250:
    ldr r0, [r4, #0x268]
    tst r0, #0x4
    beq .L_02049268
    add r0, r4, #0x78
    add r1, r4, #0x224
    bl func_020050a4
.L_02049268:
    mov r0, r4
    add r1, r4, #0x78
    bl Type7Actor_UpdateMotionTowardTransform
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_02049290
    mov r0, r4
    bl func_02047dd8
.L_02049290:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02049298: .word data_020c9670
.size func_02049148, . - func_02049148

    .global func_0204929c
.type func_0204929c, @function
func_0204929c: ; 0x0204929c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    add r0, r4, #0x200
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldrsh r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_02049344
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl func_020050a4
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x10000
    bl func_020ada8c
    ldr r1, [r4, #0x29c]
    mov r0, r0, lsl #0x10
    ldrb r1, [r1, #0x54]
    mov r2, r0, lsr #0x10
    ldr r3, .L_020493f4
    cmp r1, #0x2
    mov r1, r2, asr #0x4
    mov lr, r1, lsl #0x1
    add r1, lr, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r1]
    movne r0, #0x18
    ldr ip, [r4, #0x7c]
    moveq r0, #0x80
    mla r2, r0, r2, ip
    mov r1, lr, lsl #0x1
    str r2, [r4, #0x7c]
    ldrsh r2, [r3, r1]
    ldr r3, [r4, #0x80]
    mov r1, #0x0
    mla r2, r0, r2, r3
    str r2, [r4, #0x80]
    str r1, [r4, #0x210]
.L_02049344:
    mov r0, r4
    bl func_0204832c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_0204820c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0204876c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x64]
    cmp r0, #0x0
    ble .L_020493a4
    add r0, r4, #0x78
    add r1, r4, #0x18
    bl func_020050a4
    b .L_020493bc
.L_020493a4:
    ldr r0, [r4, #0x268]
    tst r0, #0x4
    beq .L_020493bc
    add r0, r4, #0x78
    add r1, r4, #0x224
    bl func_020050a4
.L_020493bc:
    mov r0, r4
    bl func_0204a5dc
    mov r0, r4
    add r1, r4, #0x78
    bl Type7Actor_UpdateMotionTowardTransform
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_020493ec
    mov r0, r4
    bl func_02047dd8
.L_020493ec:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_020493f4: .word data_020c9670
.size func_0204929c, . - func_0204929c

    .global func_020493f8
.type func_020493f8, @function
func_020493f8: ; 0x020493f8
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x268]
    orr r1, r1, #0x8000
    str r1, [r5, #0x268]
    ldr r1, [r5, #0xd0]
    orr r1, r1, #0x2
    str r1, [r5, #0xd0]
    ldr r4, [r5, #0x280]
    cmp r4, #0x0
    beq .L_020494a0
    ldr r1, [r5, #0x20]
    ldr r2, [r4, #0x20]
    mov r1, r1, asr #0xc
    rsb r2, r1, r2, asr #0xc
    mul r1, r2, r2
    ldr r2, [r5, #0x1c]
    ldr r3, [r4, #0x1c]
    mov r2, r2, asr #0xc
    rsb r2, r2, r3, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, #0x24000
    ble .L_0204946c
    ldr r1, [r5, #0x10]
    tst r1, #0x4
    bne .L_0204946c
    bl func_0204a2e8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_0204946c:
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    mov r6, r0
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    sub r0, r6, r0
    bl func_020be328
    cmp r0, #0x20000
    blt .L_020494a0
    mov r0, r5
    bl func_0204a360
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_020494a0:
    mov r0, r5
    bl func_0204832c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, #0x1
    bl func_0204876c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x64]
    cmp r0, #0x0
    ble .L_020494ec
    add r0, r5, #0x78
    add r1, r5, #0x18
    bl func_020050a4
    b .L_02049510
.L_020494ec:
    ldr r0, [r5, #0x268]
    tst r0, #0x4
    add r0, r5, #0x78
    beq .L_02049508
    add r1, r5, #0x224
    bl func_020050a4
    b .L_02049510
.L_02049508:
    add r1, r5, #0x214
    bl func_020050a4
.L_02049510:
    mov r0, r5
    bl func_0204a5dc
    mov r0, r5
    add r1, r5, #0x78
    bl Type7Actor_UpdateMotionTowardTransform
    ldr r0, [r5, #0x268]
    tst r0, #0x4
    bne .L_02049554
    adds r1, r5, #0x78
    addne r1, r1, #0x4
    adds r0, r5, #0x18
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0x28000
    bge .L_02049554
    mov r0, r5
    bl func_02047dd8
.L_02049554:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_020493f8, . - func_020493f8
