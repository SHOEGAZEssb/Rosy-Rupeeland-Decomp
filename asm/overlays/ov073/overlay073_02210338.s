.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern Heap_Alloc
.extern gFx32CosSinTable
.extern gGamePhaseRuntime
.extern data_ov073_02210c0c
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseRuntime_GetActorCollection
.extern AuxiliaryTimedSpritePresentation_Init
.extern ActorCollection_GetSpriteGroup
.extern func_020adae4
.extern SignedAbsoluteValue
.extern func_020befec
.extern func_020bf1f8
.extern func_ov073_0220fe08
.extern func_ov073_0220ff28
.extern gHeapContext
.extern genrand_int32

.global func_ov073_02210338
func_ov073_02210338:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4c
    mov r9, r0
    ldr r2, [r9, #0x38]
    mov r0, #0x5c
    mul r3, r2, r0
    ldr r0, [r9, #0x34]
    str r1, [sp, #0x18]
    add r0, r3, r0, lsl #0x3
    mov r1, #0x64
    bl func_020adae4
    str r0, [r9, #0x38]
    ldr r1, [r9, #0x28]
    add r0, sp, #0x3c
    add r1, r1, #0x100
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r9, #0x28]
    ldr r3, [r9, #0x30]
    ldr r6, [r9, #0x38]
    mov r1, r3, asr #0x1
    smull r2, r4, r3, r6
    adds r5, r2, #0x800
    smull r3, r2, r1, r6
    adc r4, r4, #0x0
    adds r3, r3, #0x800
    mov r1, r5, lsr #0xc
    str r1, [sp, #0x24]
    mov r1, r3, lsr #0xc
    str r1, [sp, #0x1c]
    ldr r1, [sp, #0x24]
    adc r2, r2, #0x0
    orr r1, r1, r4, lsl #0x14
    str r1, [sp, #0x24]
    ldr r1, [sp, #0x1c]
    orr r1, r1, r2, lsl #0x14
    str r1, [sp, #0x1c]
    bl VecFx32Object_Init
    ldr r1, [r9, #0x38]
    ldrsh r2, [r9, #0x2c]
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    ldr r1, .L_022106b8
    mov r0, r0, asr #0x5
    ldr r5, [r9, #0x28]
    cmp r2, r1
    add r8, r0, #0x80
    addlt r0, r2, #0x1
    strlth r0, [r9, #0x2c]
    ldr r0, [sp, #0x24]
    mov r6, #0x0
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x1c]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x20]
    b .L_0221058c
.L_0221041c:
    ldr r0, [r9, #0x0]
    ldr r4, [r0, r6, lsl #0x2]
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210458
    ldrsh r0, [r9, #0x2c]
    cmp r0, r6, lsl #0x3
    blt .L_02210458
    mov r0, r4
    mov r1, #0xb4
    mov r2, #0x1
    bl func_ov073_0220ff28
.L_02210458:
    ldr r1, [sp, #0x18]
    add r0, r4, #0x2c
    bl VecFx32Object_Assign
    ldrsh r0, [r9, #0x2e]
    ldr r1, .L_022106bc
    ldr r7, [sp, #0x28]
    cmp r0, #0x0
    movne r0, r5, lsl #0x10
    rsbeq r0, r5, #0x10000
    moveq r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r1, r1, r2, lsl #0x1
    ldrsh lr, [r1, #0x2]
    ldr r1, [sp, #0x24]
    mov r0, r2, lsl #0x1
    umull r2, r1, lr, r1
    mla r1, lr, r7, r1
    ldr r7, [sp, #0x24]
    mov ip, lr, asr #0x1f
    mla r1, ip, r7, r1
    adds r7, r2, #0x800
    ldr r3, [r4, #0x30]
    adc r1, r1, #0x0
    mov r2, r7, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r3, r2
    str r1, [r4, #0x30]
    ldr r1, .L_022106bc
    ldr r3, [r4, #0x34]
    ldrsh r7, [r1, r0]
    ldr r1, [sp, #0x1c]
    umull ip, r1, r7, r1
    adds r2, ip, #0x800
    ldr ip, [sp, #0x20]
    mov r0, r7, asr #0x1f
    mla r1, r7, ip, r1
    ldr ip, [sp, #0x1c]
    mov r2, r2, lsr #0xc
    mla r1, r0, ip, r1
    mov r0, #0x0
    adc r0, r1, r0
    orr r2, r2, r0, lsl #0x14
    sub r0, r3, r2
    str r0, [r4, #0x34]
    ldr r0, [r4, #0x24]
    bl SignedAbsoluteValue
    mov r1, r7, asr #0x5
    add r1, r7, r1, lsr #0x1a
    sub r2, r8, r1, asr #0x6
    mov r1, r0, asr #0x7
    add r0, r0, r1, lsr #0x18
    sub r0, r2, r0, asr #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    cmp r2, #0x20
    movlt r2, #0x20
    blt .L_0221054c
    cmp r2, #0x200
    movgt r2, #0x200
.L_0221054c:
    ldr r1, [r4, #0x4]
    mov r0, r7, asr #0x8
    add r0, r7, r0, lsr #0x17
    strh r2, [r1, #0x32]
    mov r0, r0, asr #0x9
    strh r2, [r1, #0x34]
    strh r0, [r4, #0x44]
    mov r0, r4
    bl func_ov073_0220fe08
    ldr r1, [r9, #0x3c]
    mov r0, #0x10000
    bl func_020befec
    add r0, r5, r0
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    add r6, r6, #0x1
.L_0221058c:
    ldr r0, [r9, #0x3c]
    cmp r6, r0
    blt .L_0221041c
    ldrsh r0, [r9, #0x2c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r0, r1, r0, ror #0x1d
    bne .L_022106a8
    add r0, sp, #0x2c
    bl VecFx32Object_Init
    ldrsh r0, [r9, #0x2c]
    ldr r1, [r9, #0x0]
    tst r0, #0x8
    ldreq r0, [r9, #0x3c]
    movne r2, #0x0
    addeq r0, r0, r0, lsr #0x1f
    moveq r2, r0, asr #0x1
    ldr r1, [r1, r2, lsl #0x2]
    add r0, sp, #0x2c
    add r1, r1, #0x8
    bl VecFx32Object_Assign
    bl genrand_int32
    mov r1, #0x3000
    bl func_020bf1f8
    sub r4, r1, #0x1800
    bl genrand_int32
    ldr r1, .L_022106c0
    ldr r2, [sp, #0x30]
    and r0, r0, r1
    sub r5, r0, #0x1000
    add r0, r2, r4, lsl #0x3
    ldr r1, [sp, #0x34]
    str r0, [sp, #0x30]
    add r1, r1, r5, lsl #0x2
    str r1, [sp, #0x34]
    ldr r1, .L_022106c4
    ldr r3, .L_022106c8
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq .L_02210688
    ldr r0, .L_022106cc
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteGroup
    mov r3, #0x1640
    mov r2, r0
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r0, r3, #0x3
    stmib sp, {r0, r1}
    sub r0, r1, #0x3
    str r0, [sp, #0xc]
    mov r0, #0x1
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    add r1, sp, #0x2c
    mov r0, r6
    add r3, r3, #0x2
    bl AuxiliaryTimedSpritePresentation_Init
    mov r6, r0
.L_02210688:
    ldr r0, [r6, #0x8]
    mov r1, #0x0
    adds r2, r0, #0x18
    addne r2, r2, #0x4
    stmia r2, {r4, r5}
    add r0, sp, #0x2c
    str r1, [r2, #0x8]
    bl VecFx32Object_Destroy
.L_022106a8:
    add r0, sp, #0x3c
    bl VecFx32Object_Destroy
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_022106b8: .word 0x7fff
.L_022106bc: .word gFx32CosSinTable
.L_022106c0: .word 0x1fff
.L_022106c4: .word data_ov073_02210c0c
.L_022106c8: .word gHeapContext
.L_022106cc: .word gGamePhaseRuntime
.size func_ov073_02210338, . - func_ov073_02210338
