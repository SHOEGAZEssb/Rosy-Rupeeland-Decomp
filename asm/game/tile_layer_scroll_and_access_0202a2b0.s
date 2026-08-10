; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text
.extern TileLayer_RefreshCacheColumn
.extern TileLayer_RefreshCacheRow

    .global TileLayer_ScrollToPixelPosition
    .type TileLayer_ScrollToPixelPosition, @function
TileLayer_ScrollToPixelPosition: ; 0x0202a2b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    add r4, r10, #0x1000
    ldr r0, [r4, #0x18]
    mov r9, r1
    mov r8, r2
    cmp r9, r0
    ble .L_0202a368
    mov r0, r9, asr #0x3
    add r0, r9, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    sub r7, r0, #0x1
    add r0, r10, #0x4
    add r1, r10, #0x28
    add r6, r0, #0x1000
    add r5, r1, #0x1000
    add r11, sp, #0x6
    b .L_0202a358
.L_0202a2fc:
    ldrsh r2, [r4, #0x2a]
    ldrb r3, [r4, #0x4]
    add r0, r0, #0x20
    mov r1, r0, lsl #0x10
    strb r3, [sp, #0x6]
    ldrb ip, [r4, #0x5]
    mov r0, r10
    mov r3, r11
    strb ip, [sp, #0x7]
    mov r1, r1, asr #0x10
    bl TileLayer_RefreshCacheColumn
    ldrb r1, [r6, #0x0]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1b
    add r0, r0, #0x1
    and r0, r0, #0xff
    bic r1, r1, #0x1f
    and r0, r0, #0x1f
    orr r0, r1, r0
    strb r0, [r6, #0x0]
    ldrsh r0, [r5, #0x0]
    add r0, r0, #0x1
    strh r0, [r5, #0x0]
.L_0202a358:
    ldrsh r0, [r4, #0x28]
    cmp r7, r0
    bgt .L_0202a2fc
    b .L_0202a41c
.L_0202a368:
    bge .L_0202a41c
    mov r0, r9, asr #0x3
    add r0, r9, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    sub r7, r0, #0x1
    add r0, r10, #0x4
    add r1, r10, #0x28
    add r6, r0, #0x1000
    add r5, r1, #0x1000
    add r11, sp, #0x4
    b .L_0202a410
.L_0202a394:
    ldrb r3, [r4, #0x4]
    sub r1, r0, #0x1
    ldrsh r2, [r4, #0x2a]
    mov r0, r3, lsl #0x1b
    mov r0, r0, lsr #0x1b
    strb r3, [sp, #0x4]
    sub r0, r0, #0x1
    and r0, r0, #0xff
    ldrb lr, [r4, #0x5]
    mov r1, r1, lsl #0x10
    bic r3, r3, #0x1f
    and r0, r0, #0x1f
    orr ip, r3, r0
    mov r0, r10
    mov r3, r11
    strb lr, [sp, #0x5]
    strb ip, [r11, #0x0]
    mov r1, r1, asr #0x10
    bl TileLayer_RefreshCacheColumn
    ldrb r1, [r6, #0x0]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1b
    add r0, r0, #0xff
    and r0, r0, #0xff
    bic r1, r1, #0x1f
    and r0, r0, #0x1f
    orr r0, r1, r0
    strb r0, [r6, #0x0]
    ldrsh r0, [r5, #0x0]
    sub r0, r0, #0x1
    strh r0, [r5, #0x0]
.L_0202a410:
    ldrsh r0, [r4, #0x28]
    cmp r7, r0
    blt .L_0202a394
.L_0202a41c:
    add r4, r10, #0x1000
    ldr r0, [r4, #0x1c]
    cmp r8, r0
    ble .L_0202a4c0
    mov r0, r8, asr #0x3
    add r0, r8, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    sub r7, r0, #0x1
    add r0, r10, #0x5
    add r1, r10, #0x2a
    add r6, r0, #0x1000
    add r5, r1, #0x1000
    add r11, sp, #0x2
    b .L_0202a4b0
.L_0202a454:
    ldrsh r1, [r4, #0x28]
    ldrb r3, [r4, #0x4]
    add r0, r0, #0x10
    mov r2, r0, lsl #0x10
    strb r3, [sp, #0x2]
    ldrb ip, [r4, #0x5]
    mov r0, r10
    mov r3, r11
    strb ip, [sp, #0x3]
    mov r2, r2, asr #0x10
    bl TileLayer_RefreshCacheRow
    ldrb r1, [r6, #0x0]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x1
    and r0, r0, #0xff
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strb r0, [r6, #0x0]
    ldrsh r0, [r5, #0x0]
    add r0, r0, #0x1
    strh r0, [r5, #0x0]
.L_0202a4b0:
    ldrsh r0, [r4, #0x2a]
    cmp r7, r0
    bgt .L_0202a454
    b .L_0202a574
.L_0202a4c0:
    bge .L_0202a574
    mov r0, r8, asr #0x3
    add r0, r8, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    sub r5, r0, #0x1
    add r0, r10, #0x5
    add r1, r10, #0x2a
    add r7, r0, #0x1000
    add r6, r1, #0x1000
    b .L_0202a568
.L_0202a4e8:
    ldrsh r1, [r4, #0x28]
    ldrb r3, [r4, #0x4]
    sub r0, r0, #0x1
    mov r2, r0, lsl #0x10
    strb r3, [sp, #0x0]
    ldrb ip, [r4, #0x5]
    mov r0, r10
    add r3, sp, #0x0
    strb ip, [sp, #0x1]
    bic r11, ip, #0xf
    mov ip, ip, lsl #0x1c
    mov ip, ip, lsr #0x1c
    add ip, ip, #0xff
    and ip, ip, #0xff
    and ip, ip, #0xf
    orr ip, r11, ip
    add r11, sp, #0x1
    mov r2, r2, asr #0x10
    strb ip, [r11, #0x0]
    bl TileLayer_RefreshCacheRow
    ldrb r1, [r7, #0x0]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0xff
    and r0, r0, #0xff
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strb r0, [r7, #0x0]
    ldrsh r0, [r6, #0x0]
    sub r0, r0, #0x1
    strh r0, [r6, #0x0]
.L_0202a568:
    ldrsh r0, [r4, #0x2a]
    cmp r5, r0
    blt .L_0202a4e8
.L_0202a574:
    add r0, r10, #0x1000
    str r9, [r0, #0x18]
    str r8, [r0, #0x1c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size TileLayer_ScrollToPixelPosition, . - TileLayer_ScrollToPixelPosition

