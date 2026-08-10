.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02004fe0
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern VecFx32Triple_Set
.extern VecFx32Triple_Destroy
.extern Actor_GetCachedTerrainHeight
.extern func_02072b68
.extern func_020befec
.extern func_ov075_02212d80
.extern func_ov075_02212e04
.extern func_ov075_022132e8
.extern func_ov075_02213368
.extern func_ov075_022133a4
.extern func_ov075_02213480
.extern func_ov075_02213c04
.extern func_ov075_02213ec4

.global func_ov075_02213f08
func_ov075_02213f08:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x60
    mov r10, r0
    bl func_ov075_02212d80
    cmp r0, #0x0
    bne .L_02213f30
    mov r0, r10
    bl func_ov075_02212e04
    cmp r0, #0x0
    beq .L_02213f38
.L_02213f30:
    mov r0, #0x1
    b .L_02214240
.L_02213f38:
    ldr r1, .L_02214248
    ldr r2, [r10, #0x230]
    ldr r6, [r10, #0x2b4]
    umull r8, r7, r2, r1
    mov r4, #0x0
    rsb r5, r1, #0x1000
    mla r7, r2, r4, r7
    umull r3, r0, r6, r5
    mla r0, r6, r4, r0
    mov r2, r2, asr #0x1f
    mov r6, r6, asr #0x1f
    mla r0, r6, r5, r0
    mla r7, r2, r1, r7
    adds r8, r8, #0x800
    adc r2, r7, #0x0
    adds r1, r3, #0x800
    mov r3, r8, lsr #0xc
    ldr r6, [r10, #0x238]
    ldr r7, [r10, #0x2bc]
    ldr r5, [r10, #0x234]
    ldr r8, [r10, #0x2b8]
    orr r3, r3, r2, lsl #0x14
    sub r2, r8, r5
    add r2, r2, r2, lsr #0x1f
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r7, r6
    add r1, r3, r1
    add r3, r0, r0, lsr #0x1f
    add r0, sp, #0x50
    add r2, r5, r2, asr #0x1
    add r3, r6, r3, asr #0x1
    bl func_0200500c
    add r5, sp, #0x20
    mov r0, r5
    bl func_02004fe0
    add r0, sp, #0x30
    bl func_02004fe0
    add r0, r5, #0x20
    bl func_02004fe0
    mov r0, r5
    add r1, r10, #0x22c
    add r2, r10, #0x2b0
    add r3, sp, #0x50
    bl VecFx32Triple_Set
    add r0, r10, #0x200
    ldrh r0, [r0, #0x6a]
    mov r1, #0x78
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r5, r0
    mov r0, r10
    bl func_ov075_02213c04
    cmp r0, #0x0
    beq .L_02214104
    cmp r5, #0x0
    blt .L_022140b8
    cmp r5, #0x1000
    bgt .L_022140b8
    add r0, sp, #0x10
    add r2, sp, #0x20
    mov r1, r10
    mov r3, r5
    bl func_ov075_02213ec4
    add r1, sp, #0x10
    add r0, r10, #0x18
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r10, #0x24]
    cmp r1, r0
    bge .L_02214070
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    str r0, [r10, #0x24]
.L_02214070:
    ldr r1, [r10, #0x54]
    cmp r5, #0x800
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r10, #0x54]
    ldr r2, [r10, #0x2ac]
    ldrb r1, [r0, #0x38]
    addgt r2, r2, #0x1
    cmp r2, r1
    beq .L_022140a4
    and r1, r2, #0xff
    bl func_02072b68
.L_022140a4:
    ldr r1, [r10, #0x238]
    mov r0, r10
    bl func_ov075_02213368
    add r4, r4, #0x1
    b .L_02214104
.L_022140b8:
    ldr r0, [r10, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x15
    beq .L_022140f8
    mov r1, #0x15
    bl func_02072b68
    ldr r3, [r10, #0x54]
    mov r1, #0x3
    ldrh r2, [r3, #0x24]
    mov r0, r10
    bic r2, r2, #0x3
    strh r2, [r3, #0x24]
    str r1, [r10, #0x298]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8c]
    blx r1
.L_022140f8:
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    str r0, [r10, #0x24]
.L_02214104:
    add r11, r10, #0x200
    mov r6, #0x0
    mov r8, r6
    ldrh r7, [r11, #0x6a]
    b .L_022141f4
.L_02214118:
    ldr r0, [r10, #0x2a4]
    ldr r9, [r0, r8, lsl #0x2]
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0221415c
    mov r0, r9
    bl func_ov075_02212d80
    cmp r0, #0x0
    bne .L_0221415c
    mov r0, r9
    bl func_ov075_02212e04
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02214160
.L_0221415c:
    mov r0, #0x0
.L_02214160:
    cmp r0, #0x0
    beq .L_022141f0
    sub r5, r5, #0xf6
    add r0, sp, #0x0
    mov r1, r10
    add r2, sp, #0x20
    mov r3, r5
    sub r7, r7, #0xa
    bl func_ov075_02213ec4
    mov r0, r9
    add r1, sp, #0x0
    bl func_ov075_022133a4
    add r0, sp, #0x0
    bl func_02005058
    cmp r6, #0x0
    mov r2, #0x300
    beq .L_022141b4
    add r1, r6, #0x18
    mov r0, r9
    bl func_ov075_022132e8
    b .L_022141c0
.L_022141b4:
    mov r0, r9
    add r1, r10, #0x18
    bl func_ov075_022132e8
.L_022141c0:
    ldr r1, [r10, #0x238]
    mov r6, r9
    mov r0, r9
    bl func_ov075_02213368
    cmp r5, #0x0
    blt .L_022141e0
    cmp r5, #0x1000
    addle r4, r4, #0x1
.L_022141e0:
    cmp r7, #0x3c
    bne .L_022141f0
    mov r0, r9
    bl func_ov075_02213480
.L_022141f0:
    add r8, r8, #0x1
.L_022141f4:
    ldrsh r0, [r11, #0xa8]
    cmp r8, r0
    blt .L_02214118
    add r0, r10, #0x200
    ldrh r1, [r0, #0x6a]
    add r1, r1, #0x1
    strh r1, [r0, #0x6a]
    ldrh r1, [r0, #0x6a]
    cmp r1, #0xef
    movhi r1, #0xef
    strhih r1, [r0, #0x6a]
    cmp r4, #0x0
    moveq r4, #0x1
    add r0, sp, #0x20
    movne r4, #0x0
    bl VecFx32Triple_Destroy
    add r0, sp, #0x50
    bl func_02005058
    mov r0, r4
.L_02214240:
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02214248: .word 0x266
.size func_ov075_02213f08, . - func_ov075_02213f08
