.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern func_02004fe0
.extern func_02005058
.extern func_02005070
.extern func_020050a4
.extern func_020593dc
.extern func_ov078_02213c3c
.extern func_ov095_02218130
.extern func_ov095_02218414
.extern func_ov095_0221a294
.extern func_ov095_0221ae5c
.extern func_ov095_0221ae9c
.extern gSoundContext

.global func_ov095_0221a878
func_ov095_0221a878:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x38
    mov r6, r0
    ldr r2, [r6, #0x260]
    mov r5, r1
    orr r1, r2, #0x1000
    str r1, [r6, #0x260]
    bl func_ov095_0221ae5c
    cmp r0, #0x0
    bne .L_0221a8f0
    mov r0, r6
    bl func_ov095_0221ae9c
    cmp r0, #0x0
    bne .L_0221a8f0
    mov r2, #0x0
    strb r2, [r6, #0x319]
    add r0, r6, #0x200
    strh r2, [r0, #0xdc]
    mov r0, #0x14
    strh r0, [r6, #0xda]
    mov r1, #0x200
    str r2, [sp, #0x0]
    ldr r0, .L_0221abbc
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    sub r1, r1, #0x12
    mov r2, #0x9
    bl func_020593dc
    b .L_0221abb4
.L_0221a8f0:
    mov r0, r6
    mov r1, r5
    bl func_ov078_02213c3c
    ldrsh r0, [r6, #0xac]
    cmp r0, #0xff
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221abb4
    ldr r1, [r6, #0x260]
    ldr r0, .L_0221abc0
    orr r1, r1, #0x1
    and r0, r1, r0
    str r0, [r6, #0x260]
    mov r0, #0x3
    strb r0, [r6, #0x24c]
    ldr r1, [r6, #0x314]
    mov r0, r1, lsl #0x2
    movs r0, r0, lsr #0x18
    beq .L_0221a964
    sub r0, r0, #0x1
    bic r1, r1, #0x3fc00000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x2
    str r0, [r6, #0x314]
    ldr r0, [r6, #0x260]
    bic r0, r0, #0x1
    str r0, [r6, #0x260]
    b .L_0221abb4
.L_0221a964:
    mov r0, r1, lsl #0xa
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1
    blo .L_0221a990
    mov r0, r6
    mov r1, #0x2
    bl func_ov095_02218130
    ldr r0, [r6, #0x314]
    bic r0, r0, #0x3f0000
    str r0, [r6, #0x314]
    b .L_0221abb4
.L_0221a990:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0xde]
    cmp r1, #0x3
    beq .L_0221a9b8
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r1, [r0, #0x98]
    cmp r1, #0x12c
    ble .L_0221a9e8
.L_0221a9b8:
    mov r0, r6
    mov r1, #0x4
    bl func_ov095_02218130
    ldr r1, [r6, #0x314]
    mov r0, r1, lsl #0xa
    mov r0, r0, lsr #0x1a
    add r0, r0, #0x1
    bic r1, r1, #0x3f0000
    mov r0, r0, lsl #0x1a
    orr r0, r1, r0, lsr #0xa
    str r0, [r6, #0x314]
    b .L_0221abb4
.L_0221a9e8:
    ldrsh r0, [r0, #0xde]
    cmp r0, #0x7
    bne .L_0221aa88
    ldr r0, [r6, #0x314]
    movs r1, r0, lsr #0x1f
    bne .L_0221aa20
    mov r0, r6
    mov r1, #0x2
    bl func_ov095_02218130
    ldr r0, [r6, #0x314]
    bic r0, r0, #0x80000000
    orr r0, r0, #0x80000000
    str r0, [r6, #0x314]
    b .L_0221abb4
.L_0221aa20:
    bic r1, r0, #0x80000000
    mov r0, r6
    str r1, [r6, #0x314]
    bl func_ov095_0221ae5c
    cmp r0, #0x0
    beq .L_0221aa50
    mov r2, #0x0
    mov r0, r6
    mov r1, #0x3
    strb r2, [r6, #0x318]
    bl func_ov095_02218130
    b .L_0221abb4
.L_0221aa50:
    mov r0, r6
    bl func_ov095_0221ae9c
    cmp r0, #0x0
    beq .L_0221aa78
    mov r2, #0x1
    mov r0, r6
    mov r1, #0x3
    strb r2, [r6, #0x318]
    bl func_ov095_02218130
    b .L_0221abb4
.L_0221aa78:
    mov r0, r6
    mov r1, #0x2
    bl func_ov095_02218130
    b .L_0221abb4
.L_0221aa88:
    mov r0, r6
    bl func_ov095_0221a294
    cmp r0, #0x0
    beq .L_0221abb4
    add r0, sp, #0x28
    bl func_02004fe0
    ldrh r0, [r5, #0x1a]
    tst r0, #0x10
    mvnne r4, #0x80000000
    bne .L_0221aaf0
    ldr r1, .L_0221abc4
    add r0, sp, #0x18
    ldr r2, [r1, #0x0]
    add r1, r6, #0x18
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea4]
    add r2, r2, #0x18
    bl func_ov095_02218414
    add r0, sp, #0x28
    add r1, sp, #0x18
    bl func_020050a4
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x28
    bl func_02005070
    mov r4, r0
.L_0221aaf0:
    ldrh r0, [r5, #0x1a]
    tst r0, #0x20
    ldrne r0, .L_0221abc4
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r2, [r0, #0xea8]
    cmpne r2, #0x0
    beq .L_0221ab5c
    ldr r0, [r2, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0221ab5c
    add r0, sp, #0x8
    add r1, r6, #0x18
    add r2, r2, #0x18
    bl func_ov095_02218414
    add r0, sp, #0x28
    add r1, sp, #0x8
    bl func_020050a4
    add r0, sp, #0x8
    bl func_02005058
    add r0, sp, #0x28
    bl func_02005070
    add r1, r0, #0x18000
    b .L_0221ab60
.L_0221ab5c:
    mvn r1, #0x80000000
.L_0221ab60:
    cmp r4, #0x3c000
    mov r2, #0x0
    bge .L_0221ab84
    cmp r4, r1
    bgt .L_0221ab84
    sub r0, r2, #0x80000001
    cmp r4, r0
    movne r2, #0x1
    bne .L_0221ab98
.L_0221ab84:
    cmp r1, #0x3c000
    bge .L_0221ab98
    mvn r0, #0x80000000
    cmp r1, r0
    movne r2, #0x1
.L_0221ab98:
    cmp r2, #0x0
    beq .L_0221abac
    mov r0, r6
    mov r1, #0x0
    bl func_ov095_02218130
.L_0221abac:
    add r0, sp, #0x28
    bl func_02005058
.L_0221abb4:
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, pc}
.L_0221abbc: .word gSoundContext
.L_0221abc0: .word 0xfffffbf5
.L_0221abc4: .word data_021052fc
.size func_ov095_0221a878, . - func_ov095_0221a878
