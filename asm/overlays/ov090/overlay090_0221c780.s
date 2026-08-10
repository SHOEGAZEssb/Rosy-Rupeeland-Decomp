.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern data_ov090_0221cc88
.extern DisplayController_GetVerticalOffset
.extern func_02005810
.extern func_02072b68
.extern func_020bf1f8
.extern func_ov090_0221b97c
.extern func_ov090_0221bc5c
.extern func_ov090_0221c170
.extern func_ov090_0221c68c
.extern func_ov090_0221c728
.extern func_ov090_0221c9f8
.extern func_ov090_0221ca14
.extern genrand_int32

.global func_ov090_0221c780
func_ov090_0221c780:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x24
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r6, r1
    mov r1, #0x4
    mov r5, r2
    mov r10, r3
    bl func_ov090_0221bc5c
    ldr r7, [r4, #0x4]
    ldrsh r3, [r4, #0xc]
    ldrsh r2, [r4, #0xe]
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x54]
    add r8, r6, r3
    add r2, r5, r2
    sub r3, r1, #0x1
    ldr r6, [sp, #0x50]
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    ldrb r5, [r0, #0x38]
    ldr ip, [sp, #0x4c]
    mov r8, r1, asr #0x10
    cmp ip, r5
    mov r9, r2, asr #0x10
    mov r5, r3, asr #0x10
    and r6, r6, #0xff
    beq .L_0221c80c
    and r1, ip, #0xff
    bl func_02072b68
    ldr r1, [sp, #0x4c]
    ldr r0, [r7, #0x8]
    and r1, r1, #0xff
    bl func_02072b68
.L_0221c80c:
    ldr r0, [r4, #0x4]
    mov r1, r5
    str r8, [r0, #0x18]
    ldr r0, [r4, #0x4]
    str r9, [r0, #0x1c]
    ldr r0, [r4, #0x4]
    bl func_ov090_0221c9f8
    ldr r0, [r4, #0x4]
    mov r1, r6
    bl func_ov090_0221c170
    ldrh r0, [r4, #0x10]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_0221c86c
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x4]
    ldrsh r1, [r1, #0x30]
    add r1, r1, #0x200
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    bl func_ov090_0221c728
    b .L_0221c87c
.L_0221c86c:
    ldr r2, [sp, #0x48]
    mov r0, r4
    mov r1, r10
    bl func_ov090_0221c68c
.L_0221c87c:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0221c990
    ldrh r1, [r4, #0x10]
    mov r2, r1, lsl #0x1e
    movs r2, r2, lsr #0x1f
    beq .L_0221c928
    ldr r1, [r0, #0x4]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    bne .L_0221c8c8
    ldr r1, [r0, #0x8]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0221c8d0
.L_0221c8c8:
    mov r1, #0x1
    b .L_0221c8d4
.L_0221c8d0:
    mov r1, #0x0
.L_0221c8d4:
    cmp r1, #0x0
    mov r1, #0x4
    beq .L_0221c8f8
    ldrh r0, [r4, #0x10]
    bic r0, r0, #0x2
    strh r0, [r4, #0x10]
    ldr r0, [r4, #0x8]
    bl func_ov090_0221b97c
    b .L_0221c990
.L_0221c8f8:
    bl func_ov090_0221bc5c
    ldr r0, [r4, #0x8]
    mov r1, r5
    str r8, [r0, #0x18]
    ldr r0, [r4, #0x8]
    str r9, [r0, #0x1c]
    ldr r0, [r4, #0x8]
    bl func_ov090_0221c9f8
    ldr r0, [r4, #0x8]
    mov r1, r6
    bl func_ov090_0221c170
    b .L_0221c990
.L_0221c928:
    mov r0, r1, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_0221c990
    ldrsh r0, [r4, #0x12]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r4, #0x12]
    bne .L_0221c990
    orr r0, r1, #0x2
    strh r0, [r4, #0x10]
    ldr r6, [r4, #0x8]
    ldr r0, [r6, #0x4]
    ldrb r5, [r0, #0x38]
    mov r1, r5
    bl func_02072b68
    ldr r0, [r6, #0x8]
    mov r1, r5
    bl func_02072b68
    ldr r0, [r4, #0x8]
    mov r1, #0x5
    bl func_ov090_0221bc5c
    bl genrand_int32
    mov r1, #0x5a
    bl func_020bf1f8
    add r0, r1, #0x3c
    strh r0, [r4, #0x12]
.L_0221c990:
    bl DisplayController_GetVerticalOffset
    mvn r1, #0xbf
    sub r5, r1, r0
    ldr r3, .L_0221c9f4
    mov r2, #0x0
    add r0, sp, #0xc
    add r1, sp, #0x18
    str r3, [sp, #0x18]
    str r2, [sp, #0x1c]
    str r5, [sp, #0x20]
    bl func_ov090_0221ca14
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    bl func_02005810
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0221c9ec
    add r0, sp, #0x0
    add r1, sp, #0x18
    bl func_ov090_0221ca14
    ldr r0, [r4, #0x8]
    add r1, sp, #0x0
    bl func_02005810
.L_0221c9ec:
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0221c9f4: .word data_ov090_0221cc88
.size func_ov090_0221c780, . - func_ov090_0221c780
