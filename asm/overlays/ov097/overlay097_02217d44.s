.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern GameWork_SetFlag
.extern data_021052fc
.extern data_ov097_0221a4c8
.extern func_0201e0ec
.extern func_02030ad4
.extern func_020337d4
.extern func_02034a60
.extern func_020425d4
.extern func_0204362c
.extern func_0206e590
.extern func_020a2844
.extern func_ov097_022177e0
.extern func_ov097_02217fd8
.extern func_ov097_02217fec
.extern gGameWork

.global func_ov097_02217d44
func_ov097_02217d44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r7, r0
    bl func_020425d4
    ldr r0, [r7, #0x1fc]
    cmp r0, #0x0
    ble .L_02217dc8
    ldr r1, .L_02217fc0
    mov r0, r7
    ldr r3, [r1, #0x60]
    ldr r2, [r1, #0x64]
    mov r1, #0x0
    str r3, [r7, #0x2a4]
    str r2, [r7, #0x2a8]
    strb r1, [r7, #0x2bc]
    bl func_0204362c
    cmp r0, #0x0
    ldr r0, .L_02217fc4
    moveq r2, #0x4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    movne r2, #0x5
    mov r3, r1
    bl func_ov097_022177e0
    add r0, r7, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x98]
    strh r1, [r0, #0xbe]
    mov r0, #0x4
    strh r0, [r7, #0xda]
    ldr r0, [r7, #0x260]
    bic r0, r0, #0x8
    str r0, [r7, #0x260]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217dc8:
    ldr r0, .L_02217fc8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x8
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x24]
    ldr r2, [r7, #0x20]
    mov r1, r1, asr #0xc
    ldr r3, [r7, #0x1c]
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    sub r3, r1, #0x18
    mov r1, #0x0
    mov r5, r0
    bl func_020a2844
    mov r0, r7
    bl func_0204362c
    cmp r0, #0x0
    moveq r4, #0x1
    ldr r0, .L_02217fc4
    movne r4, #0x0
    cmp r4, #0x0
    movne r2, #0x4
    ldr r0, [r0, #0x0]
    moveq r2, #0x5
    mov r1, #0x0
    mov r3, #0x2
    bl func_ov097_022177e0
    cmp r4, #0x0
    beq .L_02217e5c
    ldr r0, .L_02217fc4
    ldr r1, .L_02217fcc
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b .L_02217e6c
.L_02217e5c:
    ldr r0, .L_02217fc4
    ldr r1, .L_02217fd0
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_02217e6c:
    mov r0, r7
    bl func_0204362c
    cmp r0, #0x0
    ldr r0, .L_02217fc4
    moveq r2, #0x5
    ldr r0, [r0, #0x0]
    movne r2, #0x4
    mov r1, #0x0
    bl func_ov097_02217fd8
    cmp r0, #0x2
    bne .L_02217f94
    ldr r0, .L_02217fc8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x26c]
    cmp r0, #0x0
    beq .L_02217ebc
    mov r1, #0x1
    bl func_0206e590
.L_02217ebc:
    ldr r0, .L_02217fc8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldrne r0, [r0, #0x234]
    cmpne r0, #0x0
    beq .L_02217ee4
    mov r1, #0x1
    bl func_0206e590
.L_02217ee4:
    mov r6, #0x0
    ldr r8, .L_02217fc4
    mov r9, #0x3
    mov r11, r6
    mov r4, r6
.L_02217ef8:
    ldr r0, [r8, #0x0]
    mov r1, r4
    add r2, r6, #0x6
    bl func_ov097_02217fd8
    cmp r0, #0x0
    beq .L_02217f84
    mov r0, r7
    bl func_020337d4
    mov r10, r0
    ldr r0, [r8, #0x0]
    mov r1, r11
    add r2, r6, #0x9
    bl func_ov097_02217fd8
    mov r1, r0
    mov r0, r10
    bl func_02030ad4
    mov r10, r0
    bl func_ov097_02217fec
    cmp r0, #0x0
    bne .L_02217f84
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
    str r9, [sp, #0x0]
    ldr r2, [r10, #0x1c]
    ldr r3, [r10, #0x20]
    ldr r10, [r10, #0x24]
    mov r0, r5
    mov r10, r10, asr #0xc
    rsb r3, r10, r3, asr #0xc
    mov r1, #0x0
    mov r2, r2, asr #0xc
    sub r3, r3, #0x18
    bl func_020a2844
.L_02217f84:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_02217ef8
    b .L_02217fac
.L_02217f94:
    ldr r0, .L_02217fc4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    mov r3, #0x2
    bl func_ov097_022177e0
.L_02217fac:
    ldr r1, .L_02217fd4
    mov r0, r7
    mov r2, #0x0
    bl func_02034a60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217fc0: .word data_ov097_0221a4c8
.L_02217fc4: .word gGameWork
.L_02217fc8: .word data_021052fc
.L_02217fcc: .word 0x415
.L_02217fd0: .word 0x416
.L_02217fd4: .word 0xf688
.size func_ov097_02217d44, . - func_ov097_02217d44
