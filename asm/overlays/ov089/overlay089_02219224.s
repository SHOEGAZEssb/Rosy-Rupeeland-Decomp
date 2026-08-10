.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov089_02219918
.extern data_ov089_02219a04
.extern func_0200222c
.extern func_020022dc
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern Actor_SetDirectionFromVector
.extern func_02038aac
.extern func_02047d40
.extern func_0204b078
.extern func_ov062_0220fe78
.extern func_ov062_02210674
.extern func_ov089_02217904
.extern func_ov089_02218c9c
.extern func_ov089_02218e80
.extern func_ov089_02219214
.extern gGameWork
.extern gHeapContext

.global func_ov089_02219224
func_ov089_02219224:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    mov r7, r0
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x14]
    mov r6, r1
    mov r5, r2
    cmp r0, #0x1
    bne .L_02219508
    ldr r3, .L_02219524
    mov r2, #0x0
    add r1, sp, #0xc
    add r0, r7, #0x218
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    str r2, [sp, #0x14]
    bl func_ov089_02218c9c
    mov r1, #0x1
    mov r0, r7
    strh r1, [r7, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    mov r1, #0x0
    add r0, sp, #0x38
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    add r0, r7, #0x38
    add r1, sp, #0x38
    bl func_020050a4
    add r0, sp, #0x38
    bl func_02005058
    ldr r0, .L_02219528
    cmp r5, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ble .L_02219454
    add r0, sp, #0x28
    mov r1, r7
    mov r2, #0x1
    bl func_ov089_02218e80
    add r1, sp, #0x28
    add r0, r4, #0x18
    bl func_020050a4
    add r0, sp, #0x28
    bl func_02005058
    add r0, r4, #0x28
    add r1, r4, #0x18
    bl func_020050a4
    add r0, r7, #0x200
    ldrh r1, [r0, #0xc]
    orr r1, r1, #0x80
    strh r1, [r0, #0xc]
    bl func_020022dc
    ldr r2, .L_0221952c
    mov r1, #0x2
    bl func_0200222c
    ldr r0, .L_02219528
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02219410
    add r0, r7, #0x200
    ldrh r0, [r0, #0xc]
    tst r0, #0x800
    beq .L_02219410
    add r0, sp, #0x18
    mov r1, r7
    mov r2, #0x0
    bl func_ov089_02218e80
    ldr r0, .L_02219528
    add r1, sp, #0x18
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    add r0, r0, #0x18
    bl func_020050a4
    add r0, sp, #0x18
    bl func_02005058
    ldr r1, .L_02219530
    ldr r3, .L_02219534
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022193b0
    ldr r1, .L_02219528
    mov ip, #0x0
    ldr r1, [r1, #0x0]
    mov r2, r6
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea8]
    mov r3, #0x18
    stmia sp, {r5, ip}
    str r1, [sp, #0x8]
    bl func_ov062_02210674
.L_022193b0:
    add r0, r7, #0x200
    ldrh r1, [r0, #0xc]
    mov r3, #0x0
    ldr r2, .L_02219528
    orr r1, r1, #0x100
    strh r1, [r0, #0xc]
    ldrh ip, [r0, #0xc]
    mov r1, #0x1
    bic ip, ip, #0x800
    strh ip, [r0, #0xc]
    ldr r0, [r7, #0x244]
    str r3, [r0, #0x14]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    bl func_0204b078
    ldr r0, .L_02219528
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    ldr r1, [r0, #0x268]
    bic r1, r1, #0x40000
    str r1, [r0, #0x268]
    bl func_02047d40
.L_02219410:
    ldr r1, .L_02219530
    ldr r3, .L_02219534
    mov r0, #0x48
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022194f8
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r1, r6
    mov r3, r5
    str r4, [sp, #0x4]
    mov r4, #0x1
    mov r2, #0x18
    str r4, [sp, #0x8]
    bl func_ov062_0220fe78
    b .L_022194f8
.L_02219454:
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x2
    str r1, [r4, #0x14]
    ldr r2, [r4, #0x230]
    mov r1, #0x1
    orr r2, r2, #0x4
    str r2, [r4, #0x230]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, [r4, #0x230]
    mov r1, r6
    bic r2, r0, #0x100
    add r0, r4, #0x18
    str r2, [r4, #0x230]
    bl func_020050a4
    add r0, r4, #0x28
    add r1, r4, #0x18
    bl func_020050a4
    add r0, r4, #0x38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov089_02219214
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov089_02219214
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov089_02219214
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    bl Actor_SetDirectionFromVector
    mov r0, r4
    bl func_02038aac
.L_022194f8:
    ldr r0, .L_02219538
    ldr r1, .L_0221953c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_02219508:
    mov r0, r7
    bl func_ov089_02217904
    add r0, r7, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x14]
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02219524: .word data_ov089_02219918
.L_02219528: .word data_021052fc
.L_0221952c: .word 0x3e
.L_02219530: .word data_ov089_02219a04
.L_02219534: .word gHeapContext
.L_02219538: .word gGameWork
.L_0221953c: .word 0x402
.size func_ov089_02219224, . - func_ov089_02219224
