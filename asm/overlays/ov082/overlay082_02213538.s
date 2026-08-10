.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern Heap_Alloc
.extern Sound_Play
.extern data_020e6e68
.extern data_021052fc
.extern data_02105310
.extern data_ov082_02214aa4
.extern func_0200500c
.extern func_02005058
.extern ActorMotionAreaFollower_GetPosition
.extern func_0200b04c
.extern func_0200b294
.extern func_02010c00
.extern func_0201ded4
.extern func_0201e0ec
.extern func_02022cb0
.extern func_02032228
.extern func_02032a94
.extern ActorDerivedType1_StartRecord
.extern ActorExtendedType2_GetDescriptorValue28
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_0204cfa4
.extern func_020a2894
.extern func_020adc90
.extern func_ov082_0221391c
.extern func_ov082_02213974
.extern func_ov082_022139ac
.extern func_ov082_022139f4
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

.global func_ov082_02213538
func_ov082_02213538:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x48
    mov r5, r0
    ldr r0, .L_022138f8
    mov r4, r1
    mov r11, r2
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_022138e0
    ldr r0, .L_022138f8
    bl func_0200b294
    cmp r0, #0x0
    bne .L_022138e0
    add r0, r5, #0x200
    ldrh r0, [r0, #0x98]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x11
    bne .L_022138e0
    ldr r0, [r5, #0x260]
    tst r0, #0x8
    bne .L_022138e0
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_022135b8
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022138e0
.L_022135b8:
    add r2, r5, #0x200
    ldrh r3, [r2, #0x98]
    ldr r1, .L_022138fc
    mov r0, r5
    and r1, r3, r1
    orr r1, r1, #0x78
    strh r1, [r2, #0x98]
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x1b4]
    blx r2
    ldr r3, [r5, #0x1c]
    ldr r2, [r4, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r4, #0x20]
    sub r7, r3, r2
    sub r8, r1, r0
    mov r0, r7
    mov r1, r8
    bl func_0204cfa4
    mov r9, r0
    cmp r9, #0x1000
    ble .L_022138e0
    mov r0, r5
    mov r10, #0x0
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    beq .L_0221364c
    cmp r0, #0x1
    beq .L_02213658
    cmp r0, #0x2
    mvneq r0, #0x4
    muleq r0, r7, r0
    moveq r1, r8, lsl #0x1
    moveq r7, r0
    rsbeq r8, r1, #0x0
    b .L_02213664
.L_0221364c:
    mov r7, r7, lsl #0x1
    mov r8, r8, lsl #0x1
    b .L_02213664
.L_02213658:
    mov r7, r7, lsl #0x1
    mov r8, r8, lsl #0x1
    mov r10, #0x1
.L_02213664:
    mov r0, r7
    mov r1, r9
    bl func_020adc90
    mov r6, r0
    mov r0, r8
    mov r1, r9
    bl func_020adc90
    mov r2, r0
    mov r1, r6
    add r0, sp, #0x38
    mov r3, #0x0
    bl func_0200500c
    mov r0, r5
    ldr r3, [r0, #0x0]
    add r1, sp, #0x38
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02213704
    mov r1, #0x2000
    add r0, sp, #0x38
    rsb r1, r1, #0x0
    bl func_ov082_0221391c
    mov r0, r4
    ldr r3, [r0, #0x0]
    add r1, sp, #0x38
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    cmp r10, #0x0
    beq .L_02213740
    mov r0, r4
    mov r1, #0x84
    bl ActorDerivedType1_StartRecord
    b .L_02213740
.L_02213704:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02213740
    mov r1, #0x1000
    add r0, sp, #0x38
    rsb r1, r1, #0x0
    bl func_ov082_0221391c
    mov r0, r4
    ldr r3, [r0, #0x0]
    add r1, sp, #0x38
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
.L_02213740:
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue28
    add r1, r5, #0x200
    ldrh r1, [r1, #0x9c]
    mov r6, r0
    cmp r1, #0x0
    bne .L_02213834
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02213804
    cmp r6, #0x0
    ble .L_02213804
    ldr r0, .L_02213900
    rsb r10, r6, #0x0
    ldr r0, [r0, #0x0]
    mov r1, r10
    mov r2, #0x0
    bl func_02010c00
    ldr r1, .L_02213904
    ldr r3, .L_02213908
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq .L_022137ec
    ldr r0, .L_0221390c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r2, #0x2000
    mov r1, r0
    mov r3, r10
    str r2, [sp, #0x0]
    sub r0, r2, #0x20c0
    str r0, [sp, #0x4]
    mov r0, r9
    mov r2, r4
    bl func_02022cb0
    mov r9, r0
.L_022137ec:
    ldr r0, .L_0221390c
    mov r1, r9
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
.L_02213804:
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02213910
    ldr r0, .L_02213914
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    cmp r2, r0
    beq .L_02213834
    ldr r0, .L_02213918
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
.L_02213834:
    cmp r6, #0x0
    ble .L_02213850
    mov r0, r5
    rsb r1, r7, #0x0
    rsb r2, r8, #0x0
    mov r3, #0x8000
    bl func_02032228
.L_02213850:
    add r0, sp, #0x18
    add r1, r4, #0x18
    add r2, r5, #0x18
    bl func_ov082_02213974
    add r0, sp, #0x8
    add r1, sp, #0x18
    mov r2, #0x2000
    bl func_ov082_022139ac
    add r0, sp, #0x28
    add r2, sp, #0x8
    add r1, r5, #0x18
    bl func_ov082_022139f4
    add r0, sp, #0x8
    bl func_02005058
    add r0, sp, #0x18
    bl func_02005058
    ldr r0, .L_0221390c
    ldr r1, [sp, #0x34]
    ldr r0, [r0, #0x0]
    ldr r2, [sp, #0x30]
    rsb r1, r1, #0x18000
    add r0, r0, #0x37c
    add r1, r2, r1
    add r0, r0, #0x2c00
    str r1, [sp, #0x30]
    bl func_0201e0ec
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r2, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r1, #0x1
    bl func_020a2894
    add r0, sp, #0x28
    bl func_02005058
    add r0, sp, #0x38
    bl func_02005058
.L_022138e0:
    mov r0, r5
    mov r1, r4
    mov r2, r11
    bl func_02032a94
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022138f8: .word data_02105310
.L_022138fc: .word 0xffff0001
.L_02213900: .word gLupyContext
.L_02213904: .word data_ov082_02214aa4
.L_02213908: .word gHeapContext
.L_0221390c: .word data_021052fc
.L_02213910: .word data_020e6e68
.L_02213914: .word 0xffff
.L_02213918: .word gSoundContext
.size func_ov082_02213538, . - func_ov082_02213538
