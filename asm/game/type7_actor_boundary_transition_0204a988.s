; Matching retail form; see src/game/type7_actor_boundary_transition.c.
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e17e8
.extern data_021052fc
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern Actor_GetCachedTerrainHeight
.extern func_02034568
.extern func_02034718
.extern func_02039d54
.extern func_020481dc
.extern func_0206c978
.extern func_0206e590
.extern func_020adae4
.extern func_020be328
.extern gGameWork
.text
    .global func_0204a988
func_0204a988: ; 0x0204a988
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4c
    mov r8, r0
    ldr r0, [r8, #0x234]
    mov r7, r1
    mov r6, r2
    cmp r0, #0x0
    beq .L_0204a9f0
    mov r1, #0x0
    bl func_0206e590
    ldr r4, [r8, #0x234]
    cmp r4, #0x0
    beq .L_0204a9cc
    mov r0, r4
    bl func_0206c978
    mov r0, r4
    bl Heap_Free
.L_0204a9cc:
    mov r1, #0x0
    ldr r0, .L_0204afc0
    str r1, [r8, #0x234]
    ldr r0, [r0, #0x0]
    ldr r1, .L_0204afc4
    bl GameWork_ClearFlag
    ldr r0, [r8, #0xd0]
    bic r0, r0, #0x80
    str r0, [r8, #0xd0]
.L_0204a9f0:
    ldr r0, [r8, #0x268]
    tst r0, #0x10
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_0204afac
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0204afac
    ldr r0, .L_0204afc8
    mov r9, #0x0
    ldr r0, [r0, #0x0]
    ldrsh r1, [r8, #0x6c]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r2, [r8, #0x20]
    ldr r4, [r0, #0x20]
    ldrsh r0, [r8, #0x68]
    mov r5, r4, lsl #0x10
    mov r5, r5, lsr #0xc
    sub r0, r1, r0
    mov r4, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    str r5, [sp, #0x14]
    mov r5, r2, asr #0xc
    ldr r2, [r8, #0x1c]
    mov r4, r4, lsl #0x4
    ldr r3, [r8, #0x1c]
    str r4, [sp, #0x10]
    mov r0, r0, asr #0x10
    mov r1, #0x2
    str r9, [sp, #0x18]
    mov r4, r3, asr #0xc
    str r2, [sp, #0xc]
    ldr r11, [r8, #0x20]
    bl func_020adae4
    str r0, [sp, #0x8]
    mov r0, r8
    bl Actor_GetCachedTerrainHeight
    mov r0, r0, asr #0x10
    str r0, [sp, #0x4]
    cmp r6, #0x0
    mov r10, r9
    bne .L_0204ab1c
    ldr r0, [sp, #0x8]
    sub r0, r4, r0
    cmp r0, #0x40
    bge .L_0204acec
    sub r9, r10, #0x1
.L_0204aabc:
    cmp r9, #0x0
    mov r0, r8
    mov r1, #0x2
    add r2, r11, r9, lsl #0xe
    bne .L_0204aae8
    ldr r3, [sp, #0x4]
    mov r2, r2, asr #0x10
    bl func_02034568
    cmp r0, #0x0
    addne r10, r10, #0x1
    b .L_0204aafc
.L_0204aae8:
    ldr r3, [sp, #0x4]
    mov r2, r2, asr #0x10
    bl func_02034718
    cmp r0, #0x1
    addle r10, r10, #0x1
.L_0204aafc:
    add r9, r9, #0x1
    cmp r9, #0x1
    ble .L_0204aabc
    cmp r10, #0x3
    moveq r9, #0x1
    streq r9, [sp, #0x18]
    movne r9, #0x0
    b .L_0204acec
.L_0204ab1c:
    cmp r6, #0x1
    bne .L_0204abbc
    ldr r0, [sp, #0x8]
    add r1, r4, r0
    ldr r0, [sp, #0x14]
    sub r0, r0, #0x40
    cmp r1, r0
    ble .L_0204acec
    ldr r0, [sp, #0x14]
    mov r1, #0x10
    bl func_020adae4
    sub r0, r0, #0x2
    str r0, [sp, #0x0]
    mvn r9, #0x0
.L_0204ab54:
    cmp r9, #0x0
    mov r0, r8
    bne .L_0204ab80
    add r2, r11, r9, lsl #0xe
    ldr r1, [sp, #0x0]
    ldr r3, [sp, #0x4]
    mov r2, r2, asr #0x10
    bl func_02034568
    cmp r0, #0x0
    addne r10, r10, #0x1
    b .L_0204ab9c
.L_0204ab80:
    add r2, r11, r9, lsl #0xe
    ldr r1, [sp, #0x0]
    ldr r3, [sp, #0x4]
    mov r2, r2, asr #0x10
    bl func_02034718
    cmp r0, #0x1
    addle r10, r10, #0x1
.L_0204ab9c:
    add r9, r9, #0x1
    cmp r9, #0x1
    ble .L_0204ab54
    cmp r10, #0x3
    moveq r9, #0x1
    streq r9, [sp, #0x18]
    movne r9, #0x0
    b .L_0204acec
.L_0204abbc:
    cmp r6, #0x2
    bne .L_0204ac4c
    ldrsh r0, [r8, #0x6a]
    bl func_020be328
    sub r0, r5, r0
    cmp r0, #0x40
    bge .L_0204acec
    ldr r11, .L_0204afcc
    mvn r9, #0x0
.L_0204abe0:
    cmp r9, #0x0
    mov r0, r8
    mov r2, #0x2
    bne .L_0204ac10
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x4]
    mla r1, r9, r11, r1
    mov r1, r1, asr #0x10
    bl func_02034568
    cmp r0, #0x0
    addne r10, r10, #0x1
    b .L_0204ac2c
.L_0204ac10:
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x4]
    mla r1, r9, r11, r1
    mov r1, r1, asr #0x10
    bl func_02034718
    cmp r0, #0x1
    addle r10, r10, #0x1
.L_0204ac2c:
    add r9, r9, #0x1
    cmp r9, #0x1
    ble .L_0204abe0
    cmp r10, #0x3
    moveq r9, #0x1
    streq r9, [sp, #0x18]
    movne r9, #0x0
    b .L_0204acec
.L_0204ac4c:
    ldrsh r0, [r8, #0x6e]
    bl func_020be328
    add r1, r5, r0
    ldr r0, [sp, #0x10]
    sub r0, r0, #0x40
    cmp r1, r0
    ble .L_0204acec
    ldr r0, [sp, #0x10]
    mov r1, #0x10
    bl func_020adae4
    sub r11, r0, #0x2
    mvn r9, #0x0
.L_0204ac7c:
    cmp r9, #0x0
    mov r0, r8
    ldr r2, .L_0204afcc
    bne .L_0204acb0
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x4]
    mla r1, r9, r2, r1
    mov r1, r1, asr #0x10
    mov r2, r11
    bl func_02034568
    cmp r0, #0x0
    addne r10, r10, #0x1
    b .L_0204acd0
.L_0204acb0:
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x4]
    mla r1, r9, r2, r1
    mov r1, r1, asr #0x10
    mov r2, r11
    bl func_02034718
    cmp r0, #0x1
    addle r10, r10, #0x1
.L_0204acd0:
    add r9, r9, #0x1
    cmp r9, #0x1
    ble .L_0204ac7c
    cmp r10, #0x3
    moveq r9, #0x1
    streq r9, [sp, #0x18]
    movne r9, #0x0
.L_0204acec:
    cmp r9, #0x0
    beq .L_0204ae80
    add r0, sp, #0x3c
    bl func_02004fe0
    add r0, sp, #0x2c
    add r1, r8, #0x18
    bl func_02005030
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    add r0, sp, #0x3c
    beq .L_0204adb4
    add r1, r8, #0x18
    bl func_020050a4
    cmp r6, #0x0
    bne .L_0204ad44
    ldr r1, [r7, #0x4]
    sub r0, r4, #0x20
    str r1, [sp, #0x40]
    ldr r1, [r7, #0x4]
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x30]
    b .L_0204ae28
.L_0204ad44:
    cmp r6, #0x1
    bne .L_0204ad70
    ldr r1, [r7, #0x4]
    ldr r0, [sp, #0x14]
    str r1, [sp, #0x40]
    sub r0, r0, #0x20
    ldr r1, [r7, #0x4]
    sub r0, r0, r4
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x30]
    b .L_0204ae28
.L_0204ad70:
    cmp r6, #0x2
    ldr r1, [r7, #0x8]
    bne .L_0204ad94
    str r1, [sp, #0x44]
    ldr r1, [r7, #0x8]
    sub r0, r5, #0x20
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x34]
    b .L_0204ae28
.L_0204ad94:
    ldr r0, [sp, #0x10]
    str r1, [sp, #0x44]
    sub r0, r0, #0x20
    ldr r1, [r7, #0x8]
    sub r0, r0, r5
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x34]
    b .L_0204ae28
.L_0204adb4:
    mov r1, r7
    bl func_020050a4
    cmp r6, #0x0
    ldreq r1, [r7, #0x4]
    subeq r0, r4, #0x20
    addeq r0, r1, r0, lsl #0xc
    streq r0, [sp, #0x30]
    beq .L_0204ae28
    cmp r6, #0x1
    bne .L_0204adf8
    ldr r0, [sp, #0x14]
    ldr r1, [r7, #0x4]
    sub r0, r0, #0x20
    sub r0, r0, r4
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x30]
    b .L_0204ae28
.L_0204adf8:
    cmp r6, #0x2
    ldreq r1, [r7, #0x8]
    subeq r0, r5, #0x20
    addeq r0, r1, r0, lsl #0xc
    streq r0, [sp, #0x34]
    beq .L_0204ae28
    ldr r0, [sp, #0x10]
    ldr r1, [r7, #0x8]
    sub r0, r0, #0x20
    sub r0, r0, r5
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x34]
.L_0204ae28:
    add r1, sp, #0x2c
    add r0, r8, #0x28
    bl func_020050a4
    mov r1, r0
    add r0, r8, #0x18
    bl func_020050a4
    add r1, sp, #0x3c
    add r0, r8, #0x284
    bl func_020050a4
    cmp r6, #0x2
    ldreq r0, [r8, #0x28c]
    addeq r0, r0, #0x2000
    streq r0, [r8, #0x28c]
    cmp r6, #0x3
    ldreq r0, [r8, #0x28c]
    subeq r0, r0, #0x2000
    streq r0, [r8, #0x28c]
    add r0, sp, #0x2c
    bl func_02005058
    add r0, sp, #0x3c
    bl func_02005058
    b .L_0204af44
.L_0204ae80:
    add r0, sp, #0x1c
    mov r1, r7
    bl func_02005030
    cmp r6, #0x0
    bne .L_0204aeac
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x20]
    add r0, r0, #0x30
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x20]
    b .L_0204af08
.L_0204aeac:
    cmp r6, #0x1
    bne .L_0204aecc
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x20]
    add r0, r0, #0x30
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x20]
    b .L_0204af08
.L_0204aecc:
    cmp r6, #0x2
    bne .L_0204aef0
    ldrsh r0, [r8, #0x6a]
    bl func_020be328
    ldr r1, [sp, #0x24]
    add r0, r0, #0x30
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x24]
    b .L_0204af08
.L_0204aef0:
    ldrsh r0, [r8, #0x6e]
    bl func_020be328
    ldr r1, [sp, #0x24]
    add r0, r0, #0x30
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x24]
.L_0204af08:
    add r1, sp, #0x1c
    add r0, r8, #0x28
    bl func_020050a4
    mov r1, r0
    add r0, r8, #0x18
    bl func_020050a4
    mov r1, r7
    add r0, r8, #0x284
    bl func_020050a4
    cmp r6, #0x2
    ldreq r0, [r8, #0x28c]
    addeq r0, r0, #0x1000
    streq r0, [r8, #0x28c]
    add r0, sp, #0x1c
    bl func_02005058
.L_0204af44:
    ldr r0, [r8, #0x268]
    ldr r1, .L_0204afd0
    orr r0, r0, #0x4
    orr r0, r0, #0x80000
    str r0, [r8, #0x268]
    ldr r2, [r8, #0x14]
    mov r0, r8
    orr r2, r2, #0x6
    bic r2, r2, #0x2000000
    str r2, [r8, #0x14]
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bl func_020481dc
    ldr r4, [r8, #0x54]
    ldr r1, .L_0204afc8
    ldrh r3, [r4, #0x24]
    add r0, r8, #0x200
    mov r2, #0x0
    bic r3, r3, #0x10
    strh r3, [r4, #0x24]
    strh r2, [r0, #0x46]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl func_02039d54
.L_0204afac:
    add r0, r8, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa6]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0204afc0: .word gGameWork
.L_0204afc4: .word 0x3fd
.L_0204afc8: .word data_021052fc
.L_0204afcc: .word 0xdfd7
.L_0204afd0: .word data_020e17e8
.size func_0204a988, . - func_0204a988

