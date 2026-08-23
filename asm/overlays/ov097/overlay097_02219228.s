.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov097_0221aa1c
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern AuxiliaryTimedSpritePresentation_Init
.extern Actor_PlayRadialSpatialSound
.extern ActorExtendedType2_GetDescriptorValue25
.extern Fx32Vector2_Magnitude
.extern func_020adc90
.extern func_ov097_0221a43c
.extern gHeapContext

.global func_ov097_02219228
func_ov097_02219228:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    mov r8, r0
    ldrb r2, [r8, #0x2bc]
    mov r7, r1
    cmp r2, #0x0
    ldreqsh r1, [r8, #0xda]
    cmpeq r1, #0x6
    bne .L_02219430
    mov r1, #0x7
    strh r1, [r8, #0xda]
    ldr r2, [r8, #0xd0]
    add r1, r8, #0x200
    orr r2, r2, #0x1000
    str r2, [r8, #0xd0]
    mov r2, #0x0
    strh r2, [r1, #0xbe]
    ldr r1, .L_02219438
    ldr r3, [r7, #0x1c]
    ldr r1, [r1, #0x0]
    ldr r2, [r7, #0x20]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r4, [r1, #0x1c]
    ldr r1, [r1, #0x20]
    sub r5, r4, r3
    sub r6, r1, r2
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    bne .L_022192ac
    cmp r5, #0x0
    movlt r5, #0x0
    b .L_022192b4
.L_022192ac:
    cmp r5, #0x0
    movgt r5, #0x0
.L_022192b4:
    mov r0, r5
    mov r1, r6
    bl Fx32Vector2_Magnitude
    ldr r1, .L_0221943c
    mov r4, r0
    cmp r4, r1
    ble .L_02219430
    mov r0, r5
    mov r1, r4
    bl func_020adc90
    mov r5, r0
    mov r0, r6
    mov r1, r4
    bl func_020adc90
    ldr r1, [r7, #0x1fc]
    mov r6, r0
    ldrsh r1, [r1, #0xa]
    mov r0, r7
    mov r4, r1, lsl #0x4
    bl func_ov097_0221a43c
    cmp r0, #0x0
    bne .L_02219334
    ldr r0, .L_02219440
    mov r1, #0x0
    umull r3, r2, r4, r0
    mla r2, r4, r1, r2
    mov r1, r4, asr #0x1f
    adds r3, r3, #0x800
    mla r2, r1, r0, r2
    adc r0, r2, #0x0
    mov r4, r3, lsr #0xc
    orr r4, r4, r0, lsl #0x14
.L_02219334:
    smull r0, r2, r6, r4
    adds r3, r0, #0x800
    smull r1, r0, r5, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r4, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    mov r0, r8
    str r1, [r7, #0x3c]
    orr r4, r4, r2, lsl #0x14
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    bne .L_0221938c
    cmp r4, #0x1800
    movgt r0, #0x1000
    strgt r0, [r7, #0x44]
    movle r0, #0x3000
    movgt r4, #0x1800
    strle r0, [r7, #0x44]
    b .L_022193ac
.L_0221938c:
    mov r0, #0x1800
    rsb r0, r0, #0x0
    cmp r4, r0
    movlt r1, #0x1000
    movlt r4, r0
    strlt r1, [r7, #0x44]
    movge r0, #0x3000
    strge r0, [r7, #0x44]
.L_022193ac:
    ldr r1, .L_02219444
    mov r0, r8
    mov r2, #0x0
    str r4, [r7, #0x40]
    bl Actor_PlayRadialSpatialSound
    add r0, sp, #0x18
    add r1, r7, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, .L_02219448
    ldr r3, .L_0221944c
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02219428
    ldr r2, .L_02219450
    mov r1, #0x0
    str r2, [sp, #0x0]
    add r2, r2, #0x620
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    sub r1, r1, #0x20
    str r1, [sp, #0xc]
    mov r1, #0x1
    str r1, [sp, #0x10]
    str r1, [sp, #0x14]
    ldr r2, [r8, #0x54]
    ldr r3, .L_02219454
    ldr r2, [r2, #0x0]
    add r1, sp, #0x18
    bl AuxiliaryTimedSpritePresentation_Init
.L_02219428:
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
.L_02219430:
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02219438: .word data_021052fc
.L_0221943c: .word 0x19a
.L_02219440: .word 0x1333
.L_02219444: .word 0xf687
.L_02219448: .word data_ov097_0221aa1c
.L_0221944c: .word gHeapContext
.L_02219450: .word 0x1001
.L_02219454: .word 0x1620
.size func_ov097_02219228, . - func_ov097_02219228
