; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern func_020b1b2c
.extern func_020b1b94
.extern func_020b44e8
.extern func_020b4554

    .global Bg2ExtendedTileLayer_UpdateHardware
    .type Bg2ExtendedTileLayer_UpdateHardware, @function
Bg2ExtendedTileLayer_UpdateHardware: ; 0x0202af84
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldrb r0, [r0, #0x30]
    tst r0, #0x1
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x4
    mov r1, #0x1000
    bl func_020b4554
    bl func_020b44e8
    add r0, r4, #0x1000
    ldrb r0, [r0, #0x31]
    cmp r0, #0x1
    beq .L_0202afc8
    cmp r0, #0x2
    beq .L_0202b02c
    ldmia sp!, {r4, pc}
.L_0202afc8:
    add r0, r4, #0x4
    mov r1, #0x0
    mov r2, #0x1000
    bl func_020b1b94
    add r2, r4, #0x1000
    ldr r0, .L_0202b08c
    ldr ip, [r2, #0x18]
    ldr r4, [r2, #0x20]
    ldr r3, [r2, #0x1c]
    ldr r1, [r2, #0x24]
    add r4, ip, r4
    add r3, r3, r1
    mov r1, r0, lsl #0x10
    and r4, r4, r0
    and r1, r1, r3, lsl #0x10
    ldr r0, .L_0202b090
    orr r1, r4, r1
    str r1, [r0, #0x0]
    mov r3, #0x4000000
    ldr r1, [r3, #0x0]
    ldrh r0, [r2, #0x32]
    bic r1, r1, #0x400
    orr r0, r1, r0
    str r0, [r3, #0x0]
    ldmia sp!, {r4, pc}
.L_0202b02c:
    add r0, r4, #0x4
    mov r1, #0x0
    mov r2, #0x1000
    bl func_020b1b2c
    add r2, r4, #0x1000
    ldr r0, .L_0202b08c
    ldr r4, [r2, #0x18]
    ldr lr, [r2, #0x20]
    ldr ip, [r2, #0x1c]
    ldr r1, [r2, #0x24]
    add r4, r4, lr
    add ip, ip, r1
    mov r1, r0, lsl #0x10
    and r4, r4, r0
    and r0, r1, ip, lsl #0x10
    ldr r3, .L_0202b094
    orr r0, r4, r0
    str r0, [r3, #0x0]
    ldr r1, [r3, #-0x18]!
    ldrh r0, [r2, #0x32]
    bic r1, r1, #0x400
    orr r0, r1, r0
    str r0, [r3, #0x0]
    ldmia sp!, {r4, pc}
.L_0202b08c: .word 0x1ff
.L_0202b090: .word 0x4000018
.L_0202b094: .word 0x4001018
    .size Bg2ExtendedTileLayer_UpdateHardware, . - Bg2ExtendedTileLayer_UpdateHardware

