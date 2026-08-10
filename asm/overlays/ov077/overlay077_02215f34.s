.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov077_02216fc8
.extern data_ov077_02216ff0
.extern data_ov077_022174d8
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionJitter_EnsureMinimum
.extern AuxiliaryTimedSpritePresentation_Init
.extern func_02032228
.extern func_02032370
.extern func_020349b8
.extern func_020befec
.extern func_020bf1f8
.extern func_ov077_022142c8
.extern func_ov077_022142e0
.extern func_ov077_02214ce4
.extern func_ov077_02214fc0
.extern func_ov090_0221b03c
.extern func_ov090_0221b194
.extern func_ov090_0221c44c
.extern gHeapContext
.extern genrand_int32

.global func_ov077_02215f34
func_ov077_02215f34:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    ldr r2, .L_0221692c
    mov r8, r0
    ldr r0, [r2, #0x0]
    add r2, r8, #0x200
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    mov r0, #0x5a
    strh r0, [r2, #0xee]
    ldrh r0, [r2, #0xf2]
    mov r7, r1
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    add r0, r8, #0x200
    ldrh r1, [r0, #0xf2]
    movne r6, #0x1
    moveq r6, #0x0
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_02216050
    ldrsh r0, [r0, #0xea]
    cmp r0, #0x0
    bne .L_02216050
    ldr r0, .L_02216930
    ldr r1, [r0, #0x88]
    ldr r0, [r0, #0x8c]
    str r1, [r8, #0x218]
    str r0, [r8, #0x21c]
    ldr r4, [r8, #0x1c]
    ldr r3, [r8, #0x230]
    ldrsh r0, [r8, #0xd8]
    ldr r2, [r8, #0x20]
    ldr r1, [r8, #0x234]
    sub r3, r4, r3
    sub r1, r2, r1
    mov r2, r3, asr #0xc
    ldrsh r3, [r7, #0x8]
    cmp r0, #0xd
    mov r1, r1, asr #0xc
    addeq r0, r3, r3, lsr #0x1f
    moveq r3, r0, asr #0x1
    mul r0, r1, r1
    mla r1, r2, r2, r0
    mul r0, r3, r3
    cmp r1, r0
    mov r0, r8
    ldr r2, [r0, #0x0]
    ble .L_02216008
    ldr r2, [r2, #0xd0]
    add r1, r8, #0x22c
    blx r2
    b .L_02216014
.L_02216008:
    ldr r2, [r2, #0xd0]
    add r1, r5, #0x18
    blx r2
.L_02216014:
    add r0, r8, #0x200
    ldrsh r0, [r0, #0xe6]
    cmp r0, #0x0
    movgt r1, #0x3
    movle r1, #0x2
    mov r0, r8
    strh r1, [r8, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x144]
    blx r1
    mov r2, r0
    mov r0, r8
    add r1, r5, #0x18
    bl func_02032370
    b .L_022160e8
.L_02216050:
    ldr r1, .L_02216930
    add r0, sp, #0x38
    ldr r3, [r1, #0x80]
    ldr r2, [r1, #0x84]
    add r1, r8, #0x22c
    str r3, [r8, #0x218]
    str r2, [r8, #0x21c]
    bl VecFx32Object_InitCopy
    mov r0, r8
    ldr r2, [r0, #0x0]
    add r1, sp, #0x38
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r8, #0x200
    ldrsh r0, [r0, #0xea]
    cmp r0, #0x0
    movle r0, #0x2
    strleh r0, [r8, #0xd6]
    ble .L_022160bc
    mov r0, #0x5
    strh r0, [r8, #0xd6]
    ldr r0, [r8, #0x3c]
    add r0, r0, r0, lsl #0x1
    str r0, [r8, #0x3c]
    ldr r0, [r8, #0x40]
    add r0, r0, r0, lsl #0x1
    str r0, [r8, #0x40]
.L_022160bc:
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x140]
    blx r1
    mov r3, r0
    ldr r1, [r8, #0x3c]
    ldr r2, [r8, #0x40]
    mov r0, r8
    bl func_02032228
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
.L_022160e8:
    ldr r0, [r8, #0x298]
    bl func_ov090_0221c44c
    add r1, r8, #0x200
    ldrh r2, [r1, #0xf2]
    add r3, r0, #0x1
    mov r0, #0x18
    mul r0, r3, r0
    mov r3, r2, lsl #0x10
    sub r4, r0, #0x30
    movs r3, r3, lsr #0x17
    beq .L_02216138
    add r3, r3, #0xff
    add r3, r3, #0xff00
    mov ip, r3, lsl #0x10
    ldr r3, .L_02216934
    mov ip, ip, lsr #0x10
    and r3, r2, r3
    mov r2, ip, lsl #0x17
    orr r2, r3, r2, lsr #0x10
    strh r2, [r1, #0xf2]
.L_02216138:
    add r2, r8, #0x200
    ldrsh r1, [r2, #0xec]
    cmp r1, #0x0
    subgt r0, r1, #0x1
    strgth r0, [r2, #0xec]
    bgt .L_022168e8
    ldrsh r1, [r2, #0xea]
    cmp r1, #0x0
    ble .L_02216594
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b .L_022168e8
.L_02216168:
    b .L_022168e8
    b .L_02216198
    b .L_022168e8
    b .L_022161f0
    b .L_02216218
    b .L_022162b0
    b .L_022162ec
    b .L_02216338
    b .L_022168e8
    b .L_022168e8
    b .L_02216360
    b .L_02216390
.L_02216198:
    mov r1, #0x0
    strh r1, [r2, #0x5a]
    strh r0, [r2, #0xe6]
    ldrh r0, [r2, #0xf2]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    movne r0, #0xa
    strneh r0, [r2, #0xea]
    subne r0, r0, #0xb
    moveq r0, #0x3
    streqh r0, [r2, #0xea]
    subeq r0, r0, #0x5
    strb r0, [r8, #0x2e5]
    add r0, r8, #0x200
    ldrh r1, [r0, #0xf2]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1f
    movne r1, #0xa
    strneh r1, [r0, #0xea]
    moveq r1, #0x3
    streqh r1, [r0, #0xea]
    b .L_022168e8
.L_022161f0:
    mov r0, r8
    mov r1, #0x43
    mov r2, #0x0
    bl func_020349b8
    add r0, r8, #0x200
    mov r1, #0x4
    strh r1, [r0, #0xea]
    mov r0, #0xe
    strh r0, [r8, #0xd6]
    b .L_022168e8
.L_02216218:
    mov r0, #0xe
    strh r0, [r8, #0xd6]
    ldrsh r0, [r2, #0x5a]
    mov r1, #0xa
    add r0, r0, #0x1
    strh r0, [r2, #0x5a]
    ldrsh r0, [r2, #0x5a]
    bl func_020befec
    cmp r1, #0x0
    bne .L_02216250
    ldr r1, .L_02216938
    mov r0, r8
    mov r2, #0x0
    bl func_020349b8
.L_02216250:
    add r0, r8, #0x200
    ldrsb r1, [r0, #0xe5]
    cmp r1, #0x0
    beq .L_0221626c
    ldrsh r0, [r0, #0xe6]
    cmp r0, #0x30
    bgt .L_022168e8
.L_0221626c:
    add r0, r8, #0x200
    mov r1, #0x5
    strh r1, [r0, #0xea]
    mov r2, #0x0
    ldr r1, .L_0221692c
    strh r2, [r0, #0x5a]
    ldr r0, [r1, #0x0]
    mov r1, #0x1e
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    mov r2, #0x2
    bl ActorMotionJitter_EnsureMinimum
    ldr r1, .L_0221693c
    mov r0, r8
    mov r2, #0x0
    bl func_020349b8
    b .L_022168e8
.L_022162b0:
    mov r0, #0xe
    strh r0, [r8, #0xd6]
    ldrsh r0, [r2, #0x5a]
    add r0, r0, #0x1
    strh r0, [r2, #0x5a]
    ldrsh r0, [r2, #0x5a]
    cmp r0, #0xa
    ble .L_022168e8
    mov r0, #0x8
    strb r0, [r8, #0x2e5]
    mov r0, #0x6
    strh r0, [r2, #0xea]
    mov r0, #0x0
    strh r0, [r2, #0x5a]
    b .L_022168e8
.L_022162ec:
    ldrsh r1, [r2, #0x5a]
    mov r0, #0xe
    add r1, r1, #0x1
    strh r1, [r2, #0x5a]
    strh r0, [r8, #0xd6]
    ldrsb r0, [r2, #0xe5]
    cmp r0, #0x0
    bne .L_022168e8
    mov r0, #0x6
    strh r0, [r8, #0xd6]
    mov r0, #0x7
    strh r0, [r2, #0xea]
    ldr r0, [r8, #0x2f8]
    mov r1, r8
    bl func_ov090_0221b03c
    add r0, r8, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x5a]
    b .L_022168e8
.L_02216338:
    mov r0, #0x6
    strh r0, [r8, #0xd6]
    ldrsh r0, [r2, #0x5a]
    add r0, r0, #0x1
    strh r0, [r2, #0x5a]
    ldrsh r0, [r2, #0x5a]
    cmp r0, #0x3c
    movgt r0, #0x0
    strgth r0, [r2, #0xea]
    b .L_022168e8
.L_02216360:
    mov r0, r8
    mov r1, #0x26
    mov r2, #0x0
    bl func_020349b8
    add r0, r8, #0x200
    mov r1, #0xb
    strh r1, [r0, #0xea]
    mov r1, #0xe
    strh r1, [r8, #0xd6]
    mov r1, #0x0
    strh r1, [r0, #0x5a]
    b .L_022168e8
.L_02216390:
    ldrsh r0, [r2, #0x5a]
    mov r1, #0xa
    add r0, r0, #0x1
    strh r0, [r2, #0x5a]
    ldrsh r0, [r2, #0x5a]
    bl func_020befec
    cmp r1, #0x0
    bne .L_022163c0
    ldr r1, .L_02216938
    mov r0, r8
    mov r2, #0x0
    bl func_020349b8
.L_022163c0:
    mov r0, #0xe
    strh r0, [r8, #0xd6]
    add r0, r8, #0x200
    ldrsh r0, [r0, #0xe6]
    cmp r0, #0x30
    bgt .L_022168e8
    mov r0, r8
    bl func_ov077_022142c8
    cmp r0, #0x0
    movne r5, #0x1
    ldrne r1, .L_02216940
    bne .L_0221640c
    mov r0, r8
    bl func_ov077_022142e0
    cmp r0, #0x0
    ldrne r1, .L_02216944
    movne r5, #0x2
    ldreq r1, .L_02216948
    moveq r5, #0x0
.L_0221640c:
    mov r0, r8
    mov r2, #0x0
    bl func_020349b8
    ldr r1, .L_0221694c
    mov r0, r8
    mov r2, #0x0
    bl func_020349b8
    ldr r1, .L_02216950
    ldr r3, .L_02216954
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02216498
    ldrsh r1, [r8, #0xda]
    ldr r4, .L_02216958
    cmp r1, #0x0
    movgt r1, #0x3
    movle r1, #0x0
    str r4, [sp, #0x0]
    add r2, r4, #0xf
    add r1, r5, r1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mvn r1, #0x7f
    str r1, [sp, #0xc]
    mov r1, #0x1
    str r1, [sp, #0x10]
    str r1, [sp, #0x14]
    ldr r1, [r8, #0x54]
    ldr r3, [r8, #0x29c]
    ldr r2, [r1, #0x0]
    add r1, r3, #0x18
    add r3, r4, #0xe
    bl AuxiliaryTimedSpritePresentation_Init
.L_02216498:
    ldrsh r0, [r8, #0xda]
    mov r1, r8
    add r0, r0, #0x1
    strh r0, [r8, #0xda]
    ldr r0, [r8, #0x2f8]
    bl func_ov090_0221b03c
    ldr r0, .L_0221692c
    mov r1, #0xf
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    ldrsh r0, [r8, #0xda]
    cmp r0, #0x3
    blt .L_02216558
    add r0, r8, #0x200
    ldrh r0, [r0, #0xf2]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_022164f8
    ldr r0, [r8, #0x2f8]
    mov r1, r8
    bl func_ov090_0221b194
.L_022164f8:
    add r1, r8, #0x200
    mov r4, #0xc0
    strh r4, [r1, #0xfe]
    add r0, r8, #0x300
    mov r2, #0x1000
    strh r2, [r0, #0x0]
    ldrh r3, [r1, #0xf2]
    mov r2, #0x0
    ldr r0, .L_02216934
    bic r3, r3, #0x30
    strh r3, [r1, #0xf2]
    ldrh r3, [r1, #0xf2]
    bic r3, r3, #0x2
    strh r3, [r1, #0xf2]
    ldrh r3, [r1, #0xf2]
    bic r3, r3, #0x4
    strh r3, [r1, #0xf2]
    strh r2, [r1, #0xc8]
    strh r4, [r1, #0xec]
    ldrh r2, [r1, #0xf2]
    and r0, r2, r0
    orr r0, r0, #0x6000
    strh r0, [r1, #0xf2]
    b .L_02216584
.L_02216558:
    mov r0, r8
    mov r1, #0x80
    bl func_ov077_02214fc0
    add r1, r8, #0x200
    mov r0, #0x80
    strh r0, [r1, #0xec]
    ldrh r2, [r1, #0xf2]
    ldr r0, .L_02216934
    and r0, r2, r0
    orr r0, r0, #0x4000
    strh r0, [r1, #0xf2]
.L_02216584:
    add r0, r8, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xea]
    b .L_022168e8
.L_02216594:
    ldrh r0, [r2, #0xf2]
    mov r0, r0, lsl #0x1d
    movs r3, r0, lsr #0x1f
    moveq r0, #0x0
    streqh r0, [r2, #0xe8]
    beq .L_022168e8
    ldrsh r1, [r2, #0xcc]
    ldrsh r0, [r2, #0xce]
    cmp r1, r0
    bge .L_022167a0
    ldrsh r0, [r2, #0xa2]
    cmp r0, #0x3d
    bge .L_0221670c
    add r0, sp, #0x28
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x30]
    mov r1, #0x1e
    cmp r0, #0x200000
    movlt r0, #0x200000
    strlt r0, [sp, #0x30]
    add r0, r8, #0x200
    ldrsh r2, [r0, #0xa2]
    add r2, r2, #0x1
    strh r2, [r0, #0xa2]
    ldrsh r0, [r0, #0xa2]
    bl func_020befec
    cmp r1, #0x0
    bne .L_022166d8
    bl genrand_int32
    add r1, r8, #0x200
    ldrsb r1, [r1, #0xe4]
    mov r4, r0
    mov r0, r1, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    mov r0, r4
    beq .L_02216668
    mov r1, #0xd8
    bl func_020bf1f8
    mov r0, r4, lsr #0x8
    and r0, r0, #0x7f
    ldr r2, [sp, #0x2c]
    sub r1, r1, #0x6c
    add r2, r2, r1, lsl #0xc
    ldr r1, [sp, #0x30]
    sub r0, r0, #0x40
    add r0, r1, r0, lsl #0xc
    str r2, [sp, #0x2c]
    str r0, [sp, #0x30]
    b .L_02216698
.L_02216668:
    mov r1, #0x30
    bl func_020bf1f8
    mov r0, r4, lsr #0x8
    and r0, r0, #0x1f
    ldr r2, [sp, #0x2c]
    sub r1, r1, #0x18
    add r2, r2, r1, lsl #0xc
    ldr r1, [sp, #0x30]
    sub r0, r0, #0x10
    add r0, r1, r0, lsl #0xc
    str r2, [sp, #0x2c]
    str r0, [sp, #0x30]
.L_02216698:
    add r1, sp, #0x28
    mov r0, r8
    mov r2, r7
    bl func_ov077_02214ce4
    add r0, r8, #0x200
    ldrh r0, [r0, #0xfe]
    cmp r0, #0x0
    bne .L_022166c4
    mov r0, r8
    mov r1, #0x8
    bl func_ov077_02214fc0
.L_022166c4:
    mov r0, #0x2000
    str r0, [r8, #0x44]
    mov r0, #0x1000
    str r0, [r8, #0x94]
    b .L_02216700
.L_022166d8:
    mov r0, r4, asr #0x2
    add r0, r4, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    rsb r0, r0, #0x1e
    cmp r1, r0
    addeq r0, r8, #0x200
    moveq r1, #0x0
    streqh r1, [r0, #0xe6]
    moveq r0, #0x8
    streqb r0, [r8, #0x2e5]
.L_02216700:
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
    b .L_02216764
.L_0221670c:
    mov r3, #0x0
    strh r3, [r2, #0xe8]
    ldrsh r0, [r2, #0xcc]
    add r0, r0, #0x1
    strh r0, [r2, #0xcc]
    ldrsh r1, [r2, #0xcc]
    ldrsh r0, [r2, #0xce]
    cmp r1, r0
    blt .L_02216764
    ldrsb r0, [r2, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r3, #0x1
    cmp r3, #0x0
    beq .L_02216764
    add r0, r8, #0x200
    ldrh r2, [r0, #0xf2]
    mov r1, r8
    bic r2, r2, #0x4
    strh r2, [r0, #0xf2]
    ldr r0, [r8, #0x2f8]
    bl func_ov090_0221b194
.L_02216764:
    mov r0, r8
    ldr r2, [r0, #0x0]
    add r1, r8, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r8, #0x200
    ldrsh r0, [r0, #0xa2]
    mov r1, #0x1e
    bl func_020befec
    cmp r1, #0x14
    movlt r0, #0xd
    strlth r0, [r8, #0xd6]
    movge r0, #0x2
    strgeh r0, [r8, #0xd6]
    b .L_022168e8
.L_022167a0:
    add r0, r8, #0x300
    ldrh r0, [r0, #0x6]
    cmp r0, #0x0
    movne r2, #0x21c
    add r0, r8, #0x200
    ldreqsh r2, [r2, #0xca]
    ldrsh r1, [r0, #0xc8]
    cmp r1, r2
    bge .L_022167dc
    mov r1, #0x0
    strh r1, [r0, #0xe8]
    ldrsh r1, [r0, #0xc8]
    add r1, r1, #0x1
    strh r1, [r0, #0xc8]
    b .L_022168e8
.L_022167dc:
    cmp r3, #0x0
    beq .L_022168e8
    ldrsb r0, [r0, #0xe5]
    mov r3, #0x0
    cmp r0, #0x0
    bgt .L_0221682c
    ldr r0, .L_02216930
    ldr r2, [r8, #0x218]
    ldr r0, [r0, #0x28]
    mov ip, #0x1
    cmp r2, r0
    ldr r0, .L_0221695c
    bne .L_02216824
    ldr r1, [r8, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_02216824:
    cmp ip, #0x0
    moveq r3, #0x1
.L_0221682c:
    cmp r3, #0x0
    beq .L_02216850
    add r0, r8, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xe6]
    mov r1, #0x8
    strb r1, [r8, #0x2e5]
    mov r1, #0x1
    strh r1, [r0, #0xe8]
.L_02216850:
    add r1, r8, #0x200
    ldrsh r0, [r1, #0xe6]
    cmp r0, r4
    movlt r0, #0x1000
    strlt r0, [r8, #0x44]
    blt .L_022168e8
    mov r2, #0x0
    strh r2, [r1, #0xc8]
    strh r2, [r1, #0xcc]
    strh r2, [r1, #0xa2]
    add r0, sp, #0x18
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x20]
    add r1, sp, #0x18
    cmp r0, #0x200000
    movlt r0, #0x200000
    strlt r0, [sp, #0x20]
    mov r0, r8
    mov r2, r7
    bl func_ov077_02214ce4
    add r0, r8, #0x200
    ldrh r0, [r0, #0xfe]
    cmp r0, #0x0
    bne .L_022168c0
    mov r0, r8
    mov r1, #0x8
    bl func_ov077_02214fc0
.L_022168c0:
    mov r0, #0xd
    strh r0, [r8, #0xd6]
    add r0, r8, #0x200
    mov r1, #0x2
    strh r1, [r0, #0xe8]
    ldr r1, [r8, #0x44]
    add r0, sp, #0x18
    add r1, r1, #0x2800
    str r1, [r8, #0x44]
    bl VecFx32Object_Destroy
.L_022168e8:
    ldrb r1, [r8, #0x2e4]
    and r0, r6, #0xff
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x80
    orr r0, r1, r0, lsr #0x18
    strb r0, [r8, #0x2e4]
    ldrsh r0, [r8, #0xd6]
    cmp r0, #0x2
    bne .L_02216920
    add r0, r8, #0x200
    ldrsb r0, [r0, #0xe5]
    cmp r0, #0x0
    movne r0, #0x3
    strneh r0, [r8, #0xd6]
.L_02216920:
    mov r0, #0x0
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0221692c: .word data_021052fc
.L_02216930: .word data_ov077_02216fc8
.L_02216934: .word 0xffff007f
.L_02216938: .word 0x9f84
.L_0221693c: .word 0xa10d
.L_02216940: .word 0x9f8a
.L_02216944: .word 0x9f8c
.L_02216948: .word 0x9f88
.L_0221694c: .word 0xa10c
.L_02216950: .word data_ov077_022174d8
.L_02216954: .word gHeapContext
.L_02216958: .word 0x129f
.L_0221695c: .word data_ov077_02216ff0
.size func_ov077_02215f34, . - func_ov077_02215f34
