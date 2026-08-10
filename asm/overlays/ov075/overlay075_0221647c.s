.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern Heap_Alloc
.extern Sound_Play
.extern data_020c9670
.extern data_020e6e68
.extern data_021052fc
.extern data_ov075_022177d0
.extern func_0200500c
.extern func_02005058
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_0201ded4
.extern func_0201f864
.extern func_02022cb0
.extern func_02032228
.extern ActorDerivedType1_TeardownRecordAndApplyMotionImpulse
.extern ActorDerivedType1_GetSingletonObject
.extern Actor_RandomizeValueByTenPercent
.extern ActorExtendedType2_GetDescriptorValue28
.extern func_020ae024
.extern func_020befec
.extern func_ov075_02212f10
.extern func_ov075_02214898
.extern func_ov075_022168a8
.extern func_ov075_022168f0
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext
.extern genrand_int32

.global func_ov075_0221647c
func_ov075_0221647c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x5c
    mov r6, r0
    add r0, r6, #0x200
    mov r4, #0x5a
    strh r4, [r0, #0xa4]
    mov r4, #0x3c
    strh r4, [r0, #0xa6]
    ldr r4, [r6, #0xd0]
    mov r0, #0x1
    orr r4, r4, #0x1000
    str r4, [r6, #0xd0]
    strh r0, [r6, #0xda]
    ldr r4, [r6, #0x298]
    mov r5, r1
    ldr r0, [r4, #0x260]
    mov r1, #0x0
    bic r0, r0, #0x8
    str r0, [r4, #0x260]
    ldr r0, [r6, #0x298]
    mov r4, r2
    mov r11, r3
    mov r2, r1
    mov r3, r1
    add r0, r0, #0x38
    bl func_ov075_02212f10
    ldr r0, [r6, #0x298]
    mov r1, #0x2
    strh r1, [r0, #0xd6]
    ldr r0, [r6, #0x298]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02216540
    ldr r0, [r5, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02216540
    bl ActorDerivedType1_GetSingletonObject
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xcc]
    blx r1
.L_02216540:
    ldr r0, [sp, #0x80]
    cmp r0, #0x1000
    movlt r4, #0x0
    sublt r11, r4, #0x1000
    bl genrand_int32
    mov r7, r0
    tst r7, #0x1
    movne r8, #0x1
    mov r0, r11
    mov r1, r4
    mvneq r8, #0x0
    bl func_020ae024
    mov r4, r0
    ldr r1, .L_0221687c
    mov r0, r7
    bl func_020befec
    mla r0, r1, r8, r4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r2, r0, lsl #0x1
    ldr r3, .L_02216880
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r2]
    ldrsh r1, [r3, r1]
    add r0, sp, #0x4c
    add r4, r2, r2, lsl #0x1
    add r11, r1, r1, lsl #0x1
    mov r3, #0x0
    mov r1, r4
    mov r2, r11
    bl func_0200500c
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x4c
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    ldr r8, [sp, #0x50]
    mov r1, #0x1800
    rsb r1, r1, #0x0
    ldr lr, [sp, #0x54]
    ldr r3, [sp, #0x58]
    mvn r2, #0x0
    umull r10, r9, r8, r1
    mov r0, r3, asr #0x1f
    str r0, [sp, #0x18]
    mla r9, r8, r2, r9
    mov r7, r8, asr #0x1f
    adds r8, r10, #0x800
    mla r9, r7, r1, r9
    adc r7, r9, #0x0
    mov r8, r8, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    str r8, [sp, #0x50]
    umull r8, r7, lr, r1
    adds r8, r8, #0x800
    mla r7, lr, r2, r7
    mov ip, lr, asr #0x1f
    mla r7, ip, r1, r7
    adc r7, r7, #0x0
    mov r8, r8, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    str r8, [sp, #0x54]
    umull r8, r7, r3, r1
    mla r7, r3, r2, r7
    ldr r2, [sp, #0x18]
    mov r0, r6
    mla r7, r2, r1, r7
    adds r2, r8, #0x800
    adc r1, r7, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0x58]
    bl ActorExtendedType2_GetDescriptorValue28
    bl Actor_RandomizeValueByTenPercent
    mov r7, r0
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02216750
    cmp r7, #0x0
    ble .L_02216750
    ldr r1, .L_02216884
    ldr r3, .L_02216888
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq .L_022166f4
    ldr r0, .L_0221688c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r3, #0x2000
    mov r1, r0
    mov r0, r8
    mov r2, r5
    str r3, [sp, #0x0]
    sub r3, r3, #0x20c0
    str r3, [sp, #0x4]
    rsb r3, r7, #0x0
    bl func_02022cb0
    mov r8, r0
.L_022166f4:
    ldr r0, .L_0221688c
    mov r1, r8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r0, .L_02216890
    rsb r1, r7, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r0, [r5, #0x230]
    add r1, sp, #0x4c
    orr r2, r0, #0x40000
    mov r0, r5
    str r2, [r5, #0x230]
    bl ActorDerivedType1_TeardownRecordAndApplyMotionImpulse
    mov r0, #0x3000
    str r0, [r5, #0x44]
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x2000
    str r0, [r5, #0xd0]
    b .L_0221677c
.L_02216750:
    mov r0, r5
    ldr r3, [r0, #0x0]
    add r1, sp, #0x4c
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    mov r0, #0x3000
    str r0, [r5, #0x44]
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x2000
    str r0, [r5, #0xd0]
.L_0221677c:
    ldrh r2, [r6, #0x4e]
    ldr r1, .L_02216894
    ldr r0, .L_02216898
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    cmp r2, r0
    beq .L_022167ac
    ldr r0, .L_0221689c
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
.L_022167ac:
    cmp r7, #0x0
    ble .L_022167c8
    mov r0, r6
    rsb r1, r4, #0x0
    rsb r2, r11, #0x0
    mov r3, #0x8000
    bl func_02032228
.L_022167c8:
    add r0, sp, #0x2c
    add r1, r5, #0x18
    add r2, r6, #0x18
    bl func_ov075_02214898
    add r0, sp, #0x1c
    add r1, sp, #0x2c
    mov r2, #0x2000
    bl func_ov075_022168a8
    add r0, sp, #0x3c
    add r2, sp, #0x1c
    add r1, r6, #0x18
    bl func_ov075_022168f0
    add r0, sp, #0x1c
    bl func_02005058
    add r0, sp, #0x2c
    bl func_02005058
    ldr r1, .L_02216884
    ldr r3, .L_02216888
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02216864
    ldr r1, .L_022168a0
    mov r2, #0x0
    str r1, [sp, #0x0]
    add r1, r1, #0x620
    stmib sp, {r1, r2}
    sub r1, r2, #0x40
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r6, #0x54]
    ldr r3, .L_022168a4
    ldr r2, [r2, #0x0]
    add r1, sp, #0x3c
    bl func_0201f864
.L_02216864:
    add r0, sp, #0x3c
    bl func_02005058
    add r0, sp, #0x4c
    bl func_02005058
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221687c: .word 0x3333
.L_02216880: .word data_020c9670
.L_02216884: .word data_ov075_022177d0
.L_02216888: .word gHeapContext
.L_0221688c: .word data_021052fc
.L_02216890: .word gLupyContext
.L_02216894: .word data_020e6e68
.L_02216898: .word 0xffff
.L_0221689c: .word gSoundContext
.L_022168a0: .word 0x1001
.L_022168a4: .word 0x1620
.size func_ov075_0221647c, . - func_ov075_0221647c
