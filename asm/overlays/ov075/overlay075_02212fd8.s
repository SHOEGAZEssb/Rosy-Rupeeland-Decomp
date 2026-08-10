.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216cc8
.extern data_ov075_02216d00
.extern func_020050a4
.extern Actor_ClearTransientContactState
.extern Actor_GetCachedTerrainHeight
.extern func_02072b68
.extern func_ov075_02212d80
.extern func_ov075_02212e04

.global func_ov075_02212fd8
func_ov075_02212fd8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, [r0, #0x0]
    mov r6, r0
    ldr r1, [r1, #0x18]
    blx r1
    ldr r1, [r6, #0x260]
    add r0, r6, #0x28
    bic r1, r1, #0x3
    str r1, [r6, #0x260]
    ldr r2, [r6, #0x14]
    add r1, r6, #0x18
    orr r2, r2, #0x6
    bic r2, r2, #0x800000
    str r2, [r6, #0x14]
    bl func_020050a4
    mov r0, r6
    ldr r1, [r0, #0x0]
    mov r4, #0x1
    ldr r1, [r1, #0xa8]
    mov r5, r4
    blx r1
    cmp r0, #0x0
    bne .L_02213058
    mov r0, r6
    bl func_ov075_02212d80
    cmp r0, #0x0
    bne .L_02213058
    mov r0, r6
    bl func_ov075_02212e04
    cmp r0, #0x0
    moveq r0, r4
    beq .L_0221305c
.L_02213058:
    mov r0, #0x0
.L_0221305c:
    cmp r0, #0x0
    beq .L_0221309c
    ldr r0, .L_022132e0
    ldr r2, [r6, #0x218]
    ldr r0, [r0, #0x38]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022132e4
    bne .L_02213094
    ldr r1, [r6, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02213094:
    cmp r3, #0x0
    movne r5, #0x0
.L_0221309c:
    cmp r5, #0x0
    bne .L_022130b4
    ldr r0, [r6, #0x29c]
    bl func_ov075_02212d80
    cmp r0, #0x0
    moveq r4, #0x0
.L_022130b4:
    cmp r4, #0x0
    beq .L_022130e4
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r1, [r6, #0xa8]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    b .L_022132d4
.L_022130e4:
    ldr r1, [r6, #0xa8]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    ldr r0, [r6, #0x298]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_02213290
.L_02213108:
    b .L_0221311c
    b .L_02213188
    b .L_02213204
    b .L_02213234
    b .L_02213290
.L_0221311c:
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r6, #0x24]
    cmp r1, r0
    ldrlt r1, [r6, #0x54]
    ldrlth r0, [r1, #0x24]
    orrlt r0, r0, #0x10
    strlth r0, [r1, #0x24]
    blt .L_02213290
    mov r0, #0x1
    str r0, [r6, #0x298]
    ldr r0, [r6, #0x54]
    mov r1, #0x14
    bl func_02072b68
    ldr r2, [r6, #0x54]
    mov r0, r6
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    ldr r2, [r6, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8c]
    blx r1
    b .L_02213290
.L_02213188:
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r6, #0x260]
    orr r0, r0, #0x3
    str r0, [r6, #0x260]
    ldr r0, [r6, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r6, #0x14]
    ldr r0, [r6, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02213290
    mov r0, #0x2
    str r0, [r6, #0x298]
    ldrb r1, [r6, #0xd4]
    ldr r0, [r6, #0x54]
    bl func_02072b68
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_02213290
.L_02213204:
    ldr r0, [r6, #0x260]
    orr r0, r0, #0x3
    str r0, [r6, #0x260]
    ldr r0, [r6, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r6, #0x14]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    b .L_02213290
.L_02213234:
    ldr r0, [r6, #0x260]
    orr r0, r0, #0x3
    str r0, [r6, #0x260]
    ldr r0, [r6, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r6, #0x14]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r6, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02213290
    mov r0, #0x4
    str r0, [r6, #0x298]
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_02213290:
    ldr r0, [r6, #0x298]
    sub r0, r0, #0x1
    cmp r0, #0x1
    bhi .L_022132d4
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r6, #0x24]
    cmp r1, r0
    ble .L_022132d4
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r6, #0x24]
    add r0, r0, #0x10000
    cmp r1, r0
    ldrlt r0, [r6, #0x14]
    orrlt r0, r0, #0x800000
    strlt r0, [r6, #0x14]
.L_022132d4:
    mov r0, r6
    bl Actor_ClearTransientContactState
    ldmia sp!, {r4, r5, r6, pc}
.L_022132e0: .word data_ov075_02216cc8
.L_022132e4: .word data_ov075_02216d00
.size func_ov075_02212fd8, . - func_ov075_02212fd8
