.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern data_020c9670
.extern data_ov094_02219c98
.extern data_ov094_02219d18
.extern data_ov094_02219f0c
.extern func_02073ffc
.extern func_020740a4
.extern func_02091b98
.extern func_02091c7c
.extern func_02095274
.extern func_02095360
.extern func_020ae024
.extern func_ov094_02217ec8
.extern gGameWork
.extern gHeapContext

.global func_ov094_02218720
func_ov094_02218720:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r1, [r7, #0x4]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_022189b8
.L_0221873c:
    b .L_02218758
    b .L_0221877c
    b .L_02218924
    b .L_02218954
    b .L_02218984
    b .L_02218998
    b .L_022189b0
.L_02218758:
    ldr r0, .L_022189dc
    ldr r1, .L_022189e0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r7, #0x4]
    addne r0, r0, #0x1
    strne r0, [r7, #0x4]
    b .L_022189b8
.L_0221877c:
    add r0, r7, #0x34
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq .L_022189b8
    ldr r0, [r7, #0x28]
    cmp r0, #0x10
    bge .L_02218914
    ldr r0, [r7, #0x14]
    add r1, r7, #0x8
    mov r2, #0x1
    bl func_02073ffc
    mov r8, r0
    ldr r0, [r7, #0x18]
    add r1, r7, #0x8
    mov r2, #0x1
    bl func_02073ffc
    ldrh r1, [r8, #0x24]
    mov r9, r0
    orr r0, r1, #0x2
    strh r0, [r8, #0x24]
    ldrh r0, [r9, #0x24]
    orr r0, r0, #0x2
    strh r0, [r9, #0x24]
    ldr r1, [r7, #0x0]
    ldr r0, [r7, #0x28]
    cmp r1, #0x0
    beq .L_02218800
    cmp r1, #0x1
    beq .L_02218814
    cmp r1, #0x2
    beq .L_0221887c
    b .L_022188c0
.L_02218800:
    ldr r1, .L_022189e4
    mov r4, #0x80000
    add r6, r1, r0, lsl #0x3
    mov r5, #0x40000
    b .L_022188c0
.L_02218814:
    ldr r1, .L_022189e4
    add r6, r1, r0, lsl #0x3
    ldr r3, [r1, r0, lsl #0x3]
    ldr r2, [r6, #0x4]
    mov r0, r3, asr #0xb
    mov r1, r2, asr #0xb
    add r0, r3, r0, lsr #0x14
    add r1, r2, r1, lsr #0x14
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl func_020ae024
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, .L_022189e8
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r0, [r2, r0]
    mov r1, r1, lsl #0x7
    mov r0, r0, lsl #0x7
    add r4, r1, #0x80000
    sub r5, r0, #0x80000
    b .L_022188c0
.L_0221887c:
    mov r2, r0, lsl #0x10
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x8
    mov r2, r1, lsl #0x1
    add r1, r2, #0x1
    ldr r3, .L_022189e8
    mov r2, r2, lsl #0x1
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r2]
    ldrsh r1, [r3, r1]
    ldr r3, .L_022189ec
    mov r2, r2, lsl #0x7
    mov r1, r1, lsl #0x7
    add r6, r3, r0, lsl #0x3
    add r4, r2, #0x80000
    sub r5, r1, #0xa0000
.L_022188c0:
    ldr r1, .L_022189f0
    ldr r3, .L_022189f4
    mov r0, #0xcc
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_022188fc
    stmia sp, {r5, r6}
    ldr r5, [r7, #0x0]
    mov r1, r8
    mov r2, r9
    mov r3, r4
    str r5, [sp, #0x8]
    bl func_ov094_02217ec8
    mov r1, r0
.L_022188fc:
    add r0, r7, #0x1c
    bl func_02095274
    add r0, r7, #0x34
    mov r1, #0x6
    bl func_02091b98
    b .L_022189b8
.L_02218914:
    ldr r0, [r7, #0x4]
    add r0, r0, #0x1
    str r0, [r7, #0x4]
    b .L_022189b8
.L_02218924:
    ldr r0, [r7, #0x24]
    ldrh r0, [r0, #0x98]
    tst r0, #0x1
    beq .L_022189b8
    ldr r0, .L_022189dc
    ldr r1, .L_022189e0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r7, #0x4]
    add r0, r0, #0x1
    str r0, [r7, #0x4]
    b .L_022189b8
.L_02218954:
    ldr r0, [r7, #0x24]
    ldrh r0, [r0, #0x98]
    tst r0, #0x2
    beq .L_022189b8
    ldr r0, .L_022189dc
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r7, #0x4]
    add r0, r0, #0x1
    str r0, [r7, #0x4]
    b .L_022189b8
.L_02218984:
    ldr r0, [r7, #0x28]
    cmp r0, #0x0
    addeq r0, r1, #0x1
    streq r0, [r7, #0x4]
    b .L_022189b8
.L_02218998:
    ldr r0, [r7, #0x14]
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    addeq r0, r1, #0x1
    streq r0, [r7, #0x4]
    b .L_022189b8
.L_022189b0:
    mov r0, #0x1
    b .L_022189d4
.L_022189b8:
    add r0, r7, #0x1c
    bl func_02095360
    ldr r0, [r7, #0x14]
    bl func_020740a4
    ldr r0, [r7, #0x18]
    bl func_020740a4
    mov r0, #0x0
.L_022189d4:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_022189dc: .word gGameWork
.L_022189e0: .word 0x3d3
.L_022189e4: .word data_ov094_02219c98
.L_022189e8: .word data_020c9670
.L_022189ec: .word data_ov094_02219d18
.L_022189f0: .word data_ov094_02219f0c
.L_022189f4: .word gHeapContext
.size func_ov094_02218720, . - func_ov094_02218720
