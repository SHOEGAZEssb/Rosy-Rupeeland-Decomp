.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern data_021052fc
.extern GamePhaseCurrencyHud_SetVisible
.extern func_ov092_02218380
.extern func_ov092_02218394
.extern func_ov092_02219fc8
.extern gGameWork
.extern gGamePhaseCurrencyHud

.global func_ov092_02219e8c
func_ov092_02219e8c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02219fb8
    mov r5, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x6
    bl func_ov092_02218380
    ldr r1, .L_02219fbc
    strb r0, [r5, #0x2a0]
    ldr r0, [r1, #0x0]
    ldr r2, .L_02219fb8
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    mov r1, #0x3ec
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x40000
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x230]
    bic r0, r0, #0x4
    orr r0, r0, #0x20
    str r0, [r4, #0x230]
    ldr r0, [r2, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02219fb8
    ldr r1, .L_02219fc0
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    add r0, r5, #0x290
    add r1, r4, #0x60
    bl func_ov092_02219fc8
    ldrsh r2, [r4, #0x60]
    mov r1, #0x0
    add r0, r5, #0x100
    sub r2, r2, #0xa
    strh r2, [r4, #0x60]
    ldrsh ip, [r4, #0x64]
    add r2, r5, #0x200
    ldr r3, .L_02219fb8
    add ip, ip, #0xa
    strh ip, [r4, #0x64]
    strh r1, [r0, #0xee]
    strb r1, [r5, #0x1ed]
    strh r1, [r2, #0x84]
    strb r1, [r5, #0x278]
    strh r1, [r2, #0x7a]
    str r1, [r5, #0x240]
    ldr r0, [r3, #0x0]
    mov r2, #0x2
    mov r3, r1
    bl func_ov092_02218394
    ldr r0, .L_02219fb8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    mov r3, r1
    bl func_ov092_02218394
    add r0, r5, #0x200
    ldrsb r0, [r0, #0xa0]
    ldr r2, .L_02219fb8
    mov r3, #0x1000
    cmp r0, #0x0
    moveq r1, #0x0
    movne r1, #0x4
    add r0, r5, #0x200
    strh r1, [r0, #0x8a]
    mov r1, #0x0
    strh r1, [r0, #0x9c]
    strh r1, [r0, #0x9e]
    ldr r0, [r2, #0x0]
    ldr r2, .L_02219fc4
    add r0, r0, #0x200
    strh r3, [r0, #0x12]
    ldr r0, [r2, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldmia sp!, {r3, r4, r5, pc}
.L_02219fb8: .word gGameWork
.L_02219fbc: .word data_021052fc
.L_02219fc0: .word 0x3f5
.L_02219fc4: .word gGamePhaseCurrencyHud
.size func_ov092_02219e8c, . - func_ov092_02219e8c
