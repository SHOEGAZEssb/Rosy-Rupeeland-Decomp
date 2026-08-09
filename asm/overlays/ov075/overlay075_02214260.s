.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern GameWork_TestFlag
.extern data_021052fc
.extern data_ov075_02216cc8
.extern func_020593dc
.extern func_02072b68
.extern func_ov075_02213cfc
.extern gGameWork
.extern gSoundContext

.global func_ov075_02214260
func_ov075_02214260:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r0, #0x11
    strh r0, [r6, #0xd6]
    ldr r0, [r6, #0x260]
    mov r5, r1
    tst r0, #0x800
    bne .L_02214354
    add r1, r6, #0x200
    ldrsh r0, [r1, #0x50]
    cmp r0, #0x0
    bne .L_022142c0
    ldr r3, [r6, #0x54]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x17
    strh r2, [r3, #0x24]
    ldr r2, [r6, #0x14]
    orr r2, r2, #0x10000000
    str r2, [r6, #0x14]
    ldrh r2, [r5, #0x14]
    strh r2, [r1, #0x4e]
    b .L_022144a0
.L_022142c0:
    ldrh r0, [r1, #0x72]
    tst r0, #0x800
    beq .L_02214310
    ldr r0, .L_022144a8
    ldr r1, [r6, #0x1cc]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02214310
    ldr r0, [r6, #0x14]
    add r1, r6, #0x200
    orr r0, r0, #0x10000000
    str r0, [r6, #0x14]
    ldr r3, [r6, #0x54]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x17
    strh r2, [r3, #0x24]
    strh r0, [r1, #0x4e]
    b .L_022144a0
.L_02214310:
    add r0, r6, #0x200
    ldrh r1, [r0, #0x4e]
    add r1, r1, #0x1
    strh r1, [r0, #0x4e]
    ldrh r1, [r0, #0x4e]
    ldrh r0, [r5, #0x14]
    cmp r1, r0
    bls .L_0221449c
    mov r0, r6
    bl func_ov075_02213cfc
    ldrh r1, [r5, #0x14]
    add r0, r6, #0x200
    strh r1, [r0, #0x4e]
    ldr r0, [r6, #0x260]
    orr r0, r0, #0x800
    str r0, [r6, #0x260]
    b .L_0221449c
.L_02214354:
    ldr r0, .L_022144ac
    ldr r2, [r6, #0x10]
    ldr r1, [r0, #0x0]
    add r0, r6, #0x72
    tst r2, #0x4
    add r1, r1, #0x2000
    add r2, r0, #0x200
    ldr r0, [r1, #0xea4]
    mov r4, #0x0
    ldrh r1, [r2, #0x0]
    beq .L_022143b0
    tst r1, #0x100
    beq .L_022143dc
    tst r1, #0x400
    beq .L_022143a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r4, #0x1
    b .L_022143dc
.L_022143a8:
    mov r4, #0x1
    b .L_022143dc
.L_022143b0:
    tst r1, #0x200
    beq .L_022143dc
    tst r1, #0x400
    beq .L_022143d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r4, #0x1
    b .L_022143dc
.L_022143d8:
    mov r4, #0x1
.L_022143dc:
    cmp r4, #0x0
    beq .L_02214490
    ldr r0, [r6, #0x1fc]
    mov r3, #0x1
    cmp r0, #0x0
    ldreq r0, [r6, #0x200]
    mov r1, #0x14
    streq r0, [r6, #0x1fc]
    ldr r0, .L_022144b0
    strh r3, [r6, #0xd6]
    ldr r2, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r2, [r6, #0x218]
    str r0, [r6, #0x21c]
    ldr r0, [r6, #0x14]
    bic r0, r0, #0x10000000
    str r0, [r6, #0x14]
    str r3, [r6, #0x298]
    ldr r0, [r6, #0x54]
    bl func_02072b68
    ldr r4, [r6, #0x54]
    mov r2, #0x0
    ldrh r3, [r4, #0x24]
    mov r1, #0x100
    ldr r0, .L_022144b4
    bic r3, r3, #0x17
    strh r3, [r4, #0x24]
    ldr r4, [r6, #0x260]
    mov r3, r6
    bic r4, r4, #0x800
    str r4, [r6, #0x260]
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r1, r1, #0xe9
    bl func_020593dc
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x50]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x50]
    mov r0, r6
    bl func_ov075_02213cfc
    mov r0, #0x1
    b .L_022144a0
.L_02214490:
    ldrh r1, [r5, #0x14]
    add r0, r6, #0x200
    strh r1, [r0, #0x4e]
.L_0221449c:
    mov r0, #0x0
.L_022144a0:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_022144a8: .word gGameWork
.L_022144ac: .word data_021052fc
.L_022144b0: .word data_ov075_02216cc8
.L_022144b4: .word gSoundContext
.size func_ov075_02214260, . - func_ov075_02214260
