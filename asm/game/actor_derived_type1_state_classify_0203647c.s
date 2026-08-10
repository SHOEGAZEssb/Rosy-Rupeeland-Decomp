; Matching retail form; see src/game/actor_derived_type1_state_classify.c.
.text
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Sound_Play
.extern data_020df49c
.extern data_021052fc
.extern func_0200222c
.extern func_020022dc
.extern Actor_IsAtCachedTerrainHeight
.extern ActorDerivedType1_TeardownActiveRecord
.extern Type7AuxiliaryPresentation_Activate
.extern func_ov059_0220fd20
.extern gGameWork
.extern gHeapContext
.extern gSoundContext

    .global ActorDerivedType1_ClassifyState
    .type ActorDerivedType1_ClassifyState, @function
ActorDerivedType1_ClassifyState: ; 0x0203647c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0xd0]
    mov r0, #0x0
    bic r1, r1, #0x10
    str r1, [r4, #0xd0]
    strh r0, [r4, #0xda]
    ldr r0, [r4, #0x10]
    tst r0, #0x8
    beq .L_020364b8
    tst r0, #0x100
    movne r0, #0xf
    strneh r0, [r4, #0xd6]
    bne .L_020369f8
.L_020364b8:
    ldr r1, [r4, #0x230]
    tst r1, #0x400
    beq .L_02036510
    mov r0, r4
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    moveq r0, #0xd
    streqh r0, [r4, #0xd6]
    beq .L_020369f8
    mov r0, #0x2
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x230]
    bic r0, r0, #0x400
    str r0, [r4, #0x230]
    b .L_020369f8
.L_02036510:
    ldr r0, [r4, #0xd0]
    tst r0, #0x100
    beq .L_02036554
    add r1, r4, #0x200
    ldrsh r1, [r1, #0x68]
    cmp r1, #0x0
    bgt .L_02036534
    tst r0, #0x4000
    beq .L_02036548
.L_02036534:
    mov r0, #0x2
    strh r0, [r4, #0xd6]
    mov r0, #0x3
    strh r0, [r4, #0xda]
    b .L_020369f8
.L_02036548:
    mov r0, #0xe
    strh r0, [r4, #0xd6]
    b .L_020369f8
.L_02036554:
    tst r1, #0x10
    orrne r0, r0, #0x10
    strne r0, [r4, #0xd0]
    movne r0, #0x11
    strneh r0, [r4, #0xd6]
    bne .L_020369f8
    ldr r3, [r4, #0x1dc]
    ldr r2, [r4, #0x24]
    cmp r2, r3
    movlt r0, #0x1
    strlth r0, [r4, #0xd6]
    blt .L_020369f8
    ldrsh ip, [r4, #0xd8]
    cmp ip, #0xb
    bne .L_020365d0
    ldr lr, [r4, #0x54]
    ldrh lr, [lr, #0x24]
    and lr, lr, #0x1
    mov lr, lr, lsl #0x10
    movs lr, lr, lsr #0x10
    bne .L_020365d0
    tst r1, #0x800
    bne .L_020365d0
    mov r0, #0xb
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    movgt r0, #0x3
    strgth r0, [r4, #0xda]
    b .L_020369f8
.L_020365d0:
    ldrsh lr, [r4, #0xac]
    cmp lr, #0x7
    moveq r5, #0x1
    movne r5, #0x0
    cmp r5, #0x0
    beq .L_0203660c
    mov r0, #0x8
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x10
    str r0, [r4, #0xd0]
    tst r0, #0x20
    moveq r0, #0x1
    streqh r0, [r4, #0xda]
    b .L_020369d8
.L_0203660c:
    ldr r5, [r4, #0x270]
    cmp r5, #0x0
    beq .L_02036648
    ldrb lr, [r5, #0x10]
    tst lr, #0x1
    beq .L_02036648
    mov r0, #0x8
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x10
    str r0, [r4, #0xd0]
    tst r0, #0x20
    moveq r0, #0x1
    streqh r0, [r4, #0xda]
    b .L_020369d8
.L_02036648:
    ldr lr, [r4, #0x34]
    cmp r2, lr
    bge .L_0203675c
    cmp r2, r3
    bgt .L_0203673c
    mov r0, #0xb
    strh r0, [r4, #0xd6]
    ldr r1, [r4, #0x230]
    ldr r0, .L_02036a6c
    bic r1, r1, #0x1
    orr r1, r1, #0x2
    str r1, [r4, #0x230]
    ldr r0, [r0, #0x0]
    ldr r1, [r4, #0x1c]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r2, [r4, #0x20]
    ldr r3, [r0, #0x0]
    mov r1, r1, asr #0x10
    ldr r3, [r3, #0x2c]
    mov r2, r2, asr #0x10
    blx r3
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0x1
    bne .L_02036724
    mov r0, r4
    bl ActorDerivedType1_TeardownActiveRecord
    bl func_020022dc
    ldr r2, .L_02036a70
    mov r1, #0x2
    bl func_0200222c
    ldr r1, .L_02036a74
    ldr r3, .L_02036a78
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02036714
    ldr r0, .L_02036a7c
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r1, #0x2
    moveq r1, #0x0
    mov r0, r5
    mov r2, #0xc8
    bl func_ov059_0220fd20 ; func_ov060_0220fd20, func_ov061_0220fd20, func_ov062_0220fd20, func_ov063_0220fd20, func_ov064_0220fd20, func_ov065_0220fd20, func_ov066_0220fd20, func_ov068_0220fd20, func_ov069_0220fd20, func_ov070_0220fd20, func_ov071_0220fd20, func_ov072_0220fd20, func_ov073_0220fd20, func_ov074_0220fd20
.L_02036714:
    ldr r0, [r4, #0x230]
    orr r0, r0, #0x80000
    str r0, [r4, #0x230]
    b .L_02036a64
.L_02036724:
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    movgt r0, #0x3
    strgth r0, [r4, #0xda]
    b .L_020369d8
.L_0203673c:
    mov r0, #0xa
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    movgt r0, #0x3
    strgth r0, [r4, #0xda]
    b .L_020369d8
.L_0203675c:
    ble .L_02036780
    mov r0, #0x9
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    movgt r0, #0x3
    strgth r0, [r4, #0xda]
    b .L_020369d8
.L_02036780:
    cmp r2, r3
    ble .L_020367a8
    mov r0, #0xa
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    movgt r0, #0x3
    strgth r0, [r4, #0xda]
    b .L_020369d8
.L_020367a8:
    add r2, r4, #0x200
    ldrh r3, [r2, #0xa2]
    cmp r3, #0x0
    movne r0, #0x0
    strneh r0, [r2, #0x64]
    movne r0, #0xc
    strneh r0, [r4, #0xd6]
    bne .L_020369d8
    cmp r5, #0x0
    beq .L_02036880
    tst r1, #0x40
    beq .L_02036880
    cmp ip, #0x7
    bne .L_02036848
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02036848
    ldr r0, [r4, #0x230]
    bic r0, r0, #0x40
    str r0, [r4, #0x230]
    ldr r0, [r4, #0xd0]
    tst r0, #0x8
    moveq r0, #0x1
    streqh r0, [r4, #0xd6]
    beq .L_020369d8
    ldr r0, [r4, #0x270]
    bl Type7AuxiliaryPresentation_Activate
    ldr r0, .L_02036a80
    mov r1, #0x60
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    mov r0, #0x8
    strh r0, [r4, #0xd6]
    mov r0, #0x1
    strh r0, [r4, #0xda]
    b .L_020369d8
.L_02036848:
    cmp ip, #0x7
    beq .L_02036874
    ldr r1, [r4, #0x3c]
    ldr r0, .L_02036a80
    str r1, [r4, #0x8c]
    ldr r2, [r4, #0x40]
    mov r1, #0x60
    str r2, [r4, #0x90]
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
.L_02036874:
    mov r0, #0x7
    strh r0, [r4, #0xd6]
    b .L_020369d8
.L_02036880:
    ldr r2, [r4, #0x3c]
    ldr r1, [r4, #0x40]
    orrs r1, r2, r1
    beq .L_020368a8
    tst r0, #0x2
    movne r0, #0x6
    strneh r0, [r4, #0xd6]
    moveq r0, #0x5
    streqh r0, [r4, #0xd6]
    b .L_02036964
.L_020368a8:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xa4]
    cmp r1, #0x78
    bge .L_020368d0
    mov r1, #0x1
    strh r1, [r4, #0xd6]
    ldrsh r1, [r0, #0xa4]
    add r1, r1, #0x1
    strh r1, [r0, #0xa4]
    b .L_02036964
.L_020368d0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrsh r2, [r4, #0xd8]
    cmp r2, #0x2
    cmpeq r0, #0x0
    moveq r0, #0x3
    streqh r0, [r4, #0xd6]
    beq .L_02036964
    cmp r2, #0x3
    bne .L_02036920
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r0, #0x3
    streqh r0, [r4, #0xd6]
    beq .L_02036964
.L_02036920:
    cmp r2, #0x2
    cmpeq r0, #0x1
    moveq r0, #0x4
    streqh r0, [r4, #0xd6]
    beq .L_02036964
    cmp r2, #0x4
    bne .L_0203695c
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    moveq r0, #0x4
    streqh r0, [r4, #0xd6]
    beq .L_02036964
.L_0203695c:
    mov r0, #0x2
    strh r0, [r4, #0xd6]
.L_02036964:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x68]
    cmp r1, #0x0
    movgt r0, #0x3
    strgth r0, [r4, #0xda]
    bgt .L_020369d8
    ldrsh r1, [r0, #0x80]
    cmp r1, #0x0
    movgt r0, #0x7
    strgth r0, [r4, #0xda]
    bgt .L_020369d8
    ldrsh r1, [r0, #0x64]
    cmp r1, #0x0
    ble .L_020369c8
    ldrsb r0, [r0, #0x6a]
    cmp r0, #0x2
    moveq r0, #0x6
    streqh r0, [r4, #0xda]
    beq .L_020369d8
    cmp r0, #0x3
    moveq r0, #0x2
    streqh r0, [r4, #0xda]
    movne r0, #0x5
    strneh r0, [r4, #0xda]
    b .L_020369d8
.L_020369c8:
    ldr r0, [r4, #0x230]
    tst r0, #0x200
    movne r0, #0x4
    strneh r0, [r4, #0xda]
.L_020369d8:
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x1
    cmpne r0, #0x2
    cmpne r0, #0x3
    cmpne r0, #0x4
    addne r0, r4, #0x200
    movne r1, #0x0
    strneh r1, [r0, #0xa4]
.L_020369f8:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    addne r0, r4, #0x200
    movne r1, #0x0
    strneh r1, [r0, #0x50]
    bne .L_02036a64
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x9
    cmpne r0, #0xa
    cmpne r0, #0xb
    beq .L_02036a64
    cmp r0, #0x8
    add r0, r4, #0x200
    bne .L_02036a5c
    ldrsh r2, [r0, #0x50]
    mov r1, #0x1
    strh r1, [r0, #0x50]
    cmp r2, #0x1
    ldrne r0, [r4, #0xd0]
    orrne r0, r0, #0x1000
    strne r0, [r4, #0xd0]
    b .L_02036a64
.L_02036a5c:
    mov r1, #0x0
    strh r1, [r0, #0x50]
.L_02036a64:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02036a6c: .word data_021052fc
.L_02036a70: .word 0x40
.L_02036a74: .word data_020df49c
.L_02036a78: .word gHeapContext
.L_02036a7c: .word gGameWork
.L_02036a80: .word gSoundContext
    .size ActorDerivedType1_ClassifyState, . - ActorDerivedType1_ClassifyState

    .global Type1Actor_GetDefaultIndex
