.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern Heap_Alloc
.extern data_ov092_0221c99c
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern AuxiliaryTimedSpritePresentation_Init
.extern func_0204cfa4
.extern func_0204cff4
.extern func_020adae4
.extern func_020adc90
.extern SignedAbsoluteValue
.extern func_020befec
.extern func_ov092_02217930
.extern func_ov092_02219e54
.extern func_ov092_0221ad28
.extern gHeapContext
.extern gSystemState

.global func_ov092_0221ada4
func_ov092_0221ada4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x48
    mov r5, r0
    ldr r0, [r5, #0x14]
    ldr r1, .L_0221b0d4
    bic r0, r0, #0x40
    str r0, [r5, #0x14]
    ldr r6, [r5, #0x200]
    ldr r0, [r5, #0x214]
    ldr r7, [r5, #0x1c]
    ldr r4, [r6, #0x1c]
    ldr r3, [r5, #0x20]
    ldr r2, [r6, #0x20]
    cmp r0, #0x0
    sub r0, r7, r4
    sub r9, r3, r2
    ldrh r7, [r1, #0x1a]
    beq .L_0221aeb8
    cmp r0, #0x0
    ldrgt r4, .L_0221b0d8
    ldrle r4, .L_0221b0dc
    bl SignedAbsoluteValue
    mov r8, r0
    cmp r8, #0xd000
    bge .L_0221ae50
    ldr r0, [r5, #0x208]
    add r2, r8, r8, lsr #0x1f
    mov r1, #0x3
    mov r8, r2, asr #0x1
    bl func_020befec
    str r0, [r5, #0x208]
    ldr r2, [r5, #0x204]
    mov r0, #0x1800
    umull ip, r3, r2, r0
    mov r1, #0x0
    adds ip, ip, #0x800
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, ip, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r5, #0x204]
.L_0221ae50:
    sub r0, r9, #0x4000
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r4, r2, lsr #0xc
    tst r7, #0x40
    orr r4, r4, r0, lsl #0x14
    mov r2, #0x0
    mov r1, #0x800
    beq .L_0221ae9c
    mov r0, #0xc00
    umull r9, r7, r4, r0
    mla r7, r4, r2, r7
    mov r3, r4, asr #0x1f
    adds r1, r9, r1
    mla r7, r3, r0, r7
    adc r0, r7, r2
    mov r4, r1, lsr #0xc
    orr r4, r4, r0, lsl #0x14
.L_0221ae9c:
    mov r0, #0x4000
    rsb r0, r0, #0x0
    sub r9, r0, r8
    sub r1, r0, #0x8000
    cmp r9, r1
    movlt r9, r1
    b .L_0221aee4
.L_0221aeb8:
    ldr r1, .L_0221b0e0
    mov r2, #0x0
    umull r4, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    adds r2, r4, #0x800
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r4, r2, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    add r9, r9, r9, lsl #0x1
.L_0221aee4:
    mov r0, r4
    mov r1, r9
    bl func_0204cfa4
    mov r8, r0
    cmp r8, #0x1000
    ble .L_0221b08c
    mov r0, r4
    mov r1, #0x2
    bl func_020adae4
    mov r7, r0
    mov r0, r9
    mov r1, #0x2
    bl func_020adae4
    ldr r2, [r6, #0x24]
    mov r6, r0
    ldr r0, [r5, #0x24]
    mov r1, #0x2
    add r0, r0, r2
    bl func_020adae4
    mov r3, r0
    mov r1, r7
    mov r2, r6
    add r0, sp, #0x18
    bl VecFx32Object_InitComponents
    add r0, sp, #0x38
    add r1, r5, #0x18
    add r2, sp, #0x18
    bl func_ov092_02219e54
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    ldr r2, [r5, #0x208]
    mov r1, r8
    mul r0, r4, r2
    mul r2, r9, r2
    mov r9, r2
    bl func_020adc90
    mov r4, r0
    mov r1, r8
    mov r0, r9
    bl func_020adc90
    mov r2, r0
    ldr r3, [r5, #0x204]
    mov r1, r4
    add r0, sp, #0x28
    bl VecFx32Object_InitComponents
    ldr r2, [r5, #0x8c]
    ldr r1, [sp, #0x2c]
    add r0, r5, #0x8c
    add r1, r2, r1
    str r1, [r5, #0x8c]
    ldr r3, [r5, #0x90]
    ldr r2, [sp, #0x30]
    add r1, r5, #0x90
    add r2, r3, r2
    str r2, [r5, #0x90]
    mov r2, #0x10000
    bl func_0204cff4
    mov r1, #0x0
    ldr r3, [sp, #0x34]
    add r0, r5, #0x38
    mov r2, r1
    bl func_ov092_02217930
    ldr r0, [sp, #0x2c]
    mov r1, #0x8
    bl func_020adae4
    str r0, [r5, #0x3c]
    ldr r0, [sp, #0x30]
    mov r1, #0x8
    bl func_020adae4
    str r0, [r5, #0x40]
    add r0, sp, #0x28
    mvn r1, #0x7a
    bl func_ov092_0221ad28
    ldr r0, [r5, #0x200]
    add r1, sp, #0x28
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0xb8]
    blx r3
    ldr r1, .L_0221b0e4
    ldr r3, .L_0221b0e8
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221b07c
    ldr r3, .L_0221b0ec
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x1
    stmib sp, {r1, r2}
    sub r1, r2, #0x4
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r5, #0x54]
    add r1, sp, #0x38
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_0221b07c:
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
.L_0221b08c:
    mov r0, #0x14
    str r0, [r5, #0x210]
    ldr r0, [r5, #0x1fc]
    ldrsb r0, [r0, #0x13]
    rsb r0, r0, #0x0
    strb r0, [r5, #0x8]
    ldr r0, [r5, #0x1fc]
    ldrsb r0, [r0, #0x14]
    rsb r0, r0, #0x0
    strb r0, [r5, #0x9]
    ldr r0, [r5, #0x1fc]
    ldrsb r0, [r0, #0x13]
    strb r0, [r5, #0xa]
    ldr r0, [r5, #0x1fc]
    ldrsb r0, [r0, #0x14]
    strb r0, [r5, #0xb]
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0221b0d4: .word gSystemState
.L_0221b0d8: .word 0x99a
.L_0221b0dc: .word 0xfffff666
.L_0221b0e0: .word 0xaab
.L_0221b0e4: .word data_ov092_0221c99c
.L_0221b0e8: .word gHeapContext
.L_0221b0ec: .word 0x21e1
.size func_ov092_0221ada4, . - func_ov092_0221ada4
