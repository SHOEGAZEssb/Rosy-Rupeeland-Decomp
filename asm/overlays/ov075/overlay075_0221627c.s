.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_021052fc
.extern data_ov075_02217290
.extern data_ov075_022172d8
.extern Actor_GetCachedTerrainHeight
.extern func_0204aff4
.extern func_0204cfa4
.extern func_ov075_0221625c
.extern func_ov075_0221647c

.global func_ov075_0221627c
func_ov075_0221627c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r1, [r10, #0x298]
    ldr r0, .L_02216470
    ldr r2, [r1, #0x218]
    ldr r0, [r0, #0x48]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02216474
    bne .L_022162b8
    ldr r1, [r1, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022162b8:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    add r0, r10, #0x200
    ldrh r1, [r0, #0xa4]
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldrh r1, [r0, #0xa6]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa6]
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r10, #0x29c]
    tst r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r5, #0x1
    ldr r4, .L_02216478
    mov r6, #0x0
    mov r11, r5
.L_0221630c:
    ldr r0, [r4, #0x0]
    cmp r6, #0x0
    addeq r0, r0, #0x2000
    ldreq r9, [r0, #0xea4]
    addne r0, r0, #0x2000
    ldrne r9, [r0, #0xea8]
    cmp r9, #0x0
    beq .L_02216460
    mov r0, r9
    bl Actor_GetCachedTerrainHeight
    mov r7, r0
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    cmp r7, r0
    bne .L_02216460
    cmp r6, #0x0
    bne .L_022163e4
    ldr r0, [r9, #0xd0]
    mov r7, #0x0
    mov r1, r7
    tst r0, #0x100
    mov r2, r7
    bne .L_02216390
    tst r0, #0x10000
    bne .L_0221637c
    ldr r0, [r9, #0x230]
    tst r0, #0x980000
    beq .L_02216384
.L_0221637c:
    mov r0, r5
    b .L_02216388
.L_02216384:
    mov r0, r7
.L_02216388:
    cmp r0, #0x0
    moveq r2, r11
.L_02216390:
    cmp r2, #0x0
    beq .L_022163a4
    ldr r0, [r9, #0x270]
    cmp r0, #0x0
    moveq r1, #0x1
.L_022163a4:
    cmp r1, #0x0
    beq .L_022163d8
    mov r0, r9
    bl func_ov075_0221625c
    cmp r0, #0x0
    beq .L_022163d8
    add r0, r9, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bne .L_022163d8
    ldr r0, [r9, #0xd0]
    tst r0, #0x4000
    moveq r7, #0x1
.L_022163d8:
    cmp r7, #0x0
    beq .L_02216460
    b .L_0221641c
.L_022163e4:
    mov r0, r9
    bl func_0204aff4
    cmp r0, #0x0
    bne .L_02216460
    mov r0, r9
    bl func_ov075_0221625c
    cmp r0, #0x0
    beq .L_02216460
    ldr r0, [r9, #0x268]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02216460
.L_0221641c:
    ldr r1, [r10, #0x1c]
    ldr r0, [r9, #0x1c]
    ldr r2, [r10, #0x20]
    sub r7, r1, r0
    ldr r1, [r9, #0x20]
    mov r0, r7
    sub r8, r2, r1
    mov r1, r8
    bl func_0204cfa4
    cmp r0, #0x20000
    bge .L_02216460
    mov r1, r9
    mov r2, r7
    mov r3, r8
    str r0, [sp, #0x0]
    mov r0, r10
    bl func_ov075_0221647c
.L_02216460:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0221630c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02216470: .word data_ov075_02217290
.L_02216474: .word data_ov075_022172d8
.L_02216478: .word data_021052fc
.size func_ov075_0221627c, . - func_ov075_0221627c
