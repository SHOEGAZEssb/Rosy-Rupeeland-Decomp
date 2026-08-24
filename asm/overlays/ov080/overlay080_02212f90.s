.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern GameWork_TestFlag
.extern data_020c9670
.extern gGamePhaseRuntime
.extern data_0210576c
.extern data_0210576d
.extern data_0210576f
.extern data_02105770
.extern data_ov080_02213e68
.extern data_ov080_02213ef0
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Actor_QueryTerrainHeight
.extern Actor_IsTerrainCellEligibleAtHeight
.extern Actor_PlayRadialSpatialSound
.extern func_020befec
.extern func_020bf1f8
.extern func_ov080_02212ae0
.extern gGameWork
.extern genrand_int32

.global func_ov080_02212f90
func_ov080_02212f90:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r10, r0
    mov r1, #0x11
    strh r1, [r10, #0xd6]
    ldr r0, .L_02213380
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_ov080_02212ae0
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_02212fe8
    ldr r2, [r10, #0x54]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x17
    strh r1, [r2, #0x24]
    ldr r1, [r10, #0x14]
    orr r1, r1, #0x10000000
    str r1, [r10, #0x14]
    b .L_02213378
.L_02212fe8:
    add r0, r10, #0x200
    ldrh r0, [r0, #0x72]
    tst r0, #0x800
    beq .L_02213034
    ldr r0, .L_02213380
    ldr r1, [r10, #0x1cc]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02213034
    ldr r1, [r10, #0x14]
    mov r0, #0x0
    orr r1, r1, #0x10000000
    str r1, [r10, #0x14]
    ldr r2, [r10, #0x54]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x7
    strh r1, [r2, #0x24]
    b .L_02213378
.L_02213034:
    ldr r0, .L_02213384
    ldrh r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_02213068
    ldr r2, [r10, #0x54]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x17
    strh r1, [r2, #0x24]
    ldr r1, [r10, #0x14]
    orr r1, r1, #0x10000000
    str r1, [r10, #0x14]
    b .L_02213378
.L_02213068:
    ldr r0, .L_02213388
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r2, [r0, #0xea8]
    cmp r2, #0x0
    beq .L_02213094
    ldr r1, .L_0221338c
    ldrb r1, [r1, #0x0]
    tst r1, #0x4
    ldrne r2, [r0, #0xea4]
    b .L_02213098
.L_02213094:
    ldr r2, [r0, #0xea4]
.L_02213098:
    add r0, sp, #0x18
    add r1, r2, #0x18
    bl VecFx32Object_InitCopy
    add r0, sp, #0x8
    bl VecFx32Object_Init
    mov r4, #0x0
    b .L_0221335c
.L_022130b4:
    ldr r0, .L_02213390
    mov r1, #0xa
    ldrb r0, [r0, #0x0]
    add r0, r0, r4
    bl func_020befec
    ldr r0, .L_02213394
    mov r9, r1
    ldrb r1, [r0, #0x0]
    mov r0, #0x1
    tst r1, r0, lsl r9
    bne .L_02213358
    add r0, sp, #0x8
    add r1, sp, #0x18
    bl VecFx32Object_Assign
    ldr r0, .L_02213398
    ldr r1, .L_0221338c
    mul r0, r9, r0
    ldrb r1, [r1, #0x0]
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    tst r1, #0x1
    mov r1, r2, asr #0x4
    mov r1, r1, lsl #0x1
    movne r0, #0x4b
    ldr r2, .L_0221339c
    mov r5, r1, lsl #0x1
    add r1, r2, r1, lsl #0x1
    ldrsh r3, [r1, #0x2]
    ldrsh r1, [r2, r5]
    ldr r6, [sp, #0xc]
    moveq r0, #0x6c
    ldr r2, [sp, #0x10]
    mla r3, r0, r3, r6
    mla r1, r0, r1, r2
    str r3, [sp, #0xc]
    str r1, [sp, #0x10]
    ldrsb r3, [r10, #0xa]
    ldrsb r0, [r10, #0x8]
    ldrsb r2, [r10, #0xb]
    ldrsb r1, [r10, #0x9]
    sub r0, r3, r0
    mov r0, r0, lsl #0x18
    sub r1, r2, r1
    mov r1, r1, lsl #0x18
    mov r0, r0, asr #0x18
    mov r1, r1, asr #0x18
    add r0, r0, r0, lsr #0x1f
    add r1, r1, r1, lsr #0x1f
    mov r2, r0, asr #0x1
    mov r0, r1, asr #0x1
    add r1, r2, #0x2
    add r0, r0, #0x2
    mov r11, r1, lsl #0xc
    mov r6, r0, lsl #0xc
    mov r5, #0x1
    mov r7, #0x0
    b .L_02213208
.L_02213198:
    mov r0, r7
    mov r1, #0x3
    bl func_020befec
    sub r2, r1, #0x1
    ldr r1, [sp, #0xc]
    mov r0, r7
    mla r1, r11, r2, r1
    mov r8, r1, asr #0x10
    mov r1, #0x3
    bl func_020befec
    sub r2, r0, #0x1
    ldr r1, [sp, #0x10]
    mov r0, r10
    mla r1, r6, r2, r1
    mov r1, r1, asr #0x10
    str r1, [sp, #0x0]
    ldr r2, [sp, #0x0]
    mov r1, r8
    bl Actor_QueryTerrainHeight
    ldr r2, [sp, #0x0]
    mov r1, r8
    mov r0, r10
    mov r3, #0x0
    bl Actor_IsTerrainCellEligibleAtHeight
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_02213210
    add r7, r7, #0x1
.L_02213208:
    cmp r7, #0x9
    blt .L_02213198
.L_02213210:
    cmp r5, #0x0
    beq .L_02213358
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r3, .L_0221338c
    ldr r0, [sp, #0x4]
    ldrb r2, [r3, #0x0]
    ldr r1, .L_02213380
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    add r2, r2, #0x1
    strb r2, [r3, #0x0]
    ldr r1, [r1, #0x0]
    mov r0, r0, asr #0x10
    str r0, [r1, #0x5c8]
    mov r0, #0x13
    strh r0, [r10, #0xd6]
    ldr r2, .L_02213394
    ldrb r3, [r3, #0x0]
    ldrb r4, [r2, #0x0]
    mov r0, #0x1
    mov r1, r3, lsr #0x1f
    orr r4, r4, r0, lsl r9
    rsb r0, r1, r3, lsl #0x1e
    adds r0, r1, r0, ror #0x1e
    strb r4, [r2, #0x0]
    moveq r2, #0x78
    ldr r1, .L_02213384
    movne r2, #0x1e
    strh r2, [r1, #0x0]
    add r0, r9, #0x1
    mov r1, #0xa
    strb r9, [r10, #0x298]
    bl func_020befec
    ldr r2, .L_02213390
    add r0, r10, #0x22c
    strb r1, [r2, #0x0]
    add r1, sp, #0x8
    bl VecFx32Object_Assign
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xcc]
    blx r1
    ldr r0, [r10, #0x260]
    bic r0, r0, #0x800
    str r0, [r10, #0x260]
    ldr r0, [r10, #0x1fc]
    cmp r0, #0x0
    ldreq r0, [r10, #0x200]
    streq r0, [r10, #0x1fc]
    ldr r0, .L_022133a0
    ldr r1, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r1, [r10, #0x218]
    str r0, [r10, #0x21c]
    bl genrand_int32
    mov r1, #0x9
    bl func_020bf1f8
    ldr r0, .L_022133a4
    mov r1, r1, lsl #0x1
    ldrh r1, [r0, r1]
    mov r0, r10
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
    ldr r1, .L_02213380
    add r0, r10, #0x200
    mov r2, #0x1
    strh r2, [r0, #0x5a]
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x7d
    bl func_ov080_02212ae0
    add r1, r10, #0x200
    strh r0, [r1, #0xa0]
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_02213378
.L_02213358:
    add r4, r4, #0x1
.L_0221335c:
    cmp r4, #0xa
    blt .L_022130b4
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02213378:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02213380: .word gGameWork
.L_02213384: .word data_02105770
.L_02213388: .word gGamePhaseRuntime
.L_0221338c: .word data_0210576c
.L_02213390: .word data_0210576f
.L_02213394: .word data_0210576d
.L_02213398: .word 0x471c
.L_0221339c: .word data_020c9670
.L_022133a0: .word data_ov080_02213e68
.L_022133a4: .word data_ov080_02213ef0
.size func_ov080_02212f90, . - func_ov080_02212f90
