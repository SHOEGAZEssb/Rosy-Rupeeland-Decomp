; Matching retail form; see src/game/actor_derived_type1_interaction_dispatch.c.
.text
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern data_020df4a4
.extern data_021052fc
.extern func_02009d78
.extern func_02010c00
.extern func_0201ded4
.extern func_02022cb0
.extern func_020349b8
.extern func_0203811c
.extern func_02038ecc
.extern func_02039bb0
.extern gHeapContext
.extern gLupyContext
.extern gSceneManager

    .global func_020398a4
    .type func_020398a4, @function
func_020398a4: ; 0x020398a4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r0, [r7, #0x270]
    mov r6, r2
    cmp r0, #0x0
    beq .L_020398cc
    ldrb r0, [r0, #0x10]
    tst r0, #0x1
    bne .L_02039a34
.L_020398cc:
    ldr r0, [r7, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02039a34
    ldr r0, [r7, #0xd0]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02039a0c
    cmp r1, #0x0
    ble .L_020399ec
    ldr r0, .L_02039a3c
    rsb r4, r1, #0x0
    ldr r0, [r0, #0x0]
    mov r1, r4
    mov r2, #0x0
    bl func_02010c00
    ldr r1, .L_02039a40
    ldr r3, .L_02039a44
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02039974
    ldr r0, .L_02039a48
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov ip, #0x2000
    mov r1, r0
    mov r0, r5
    mov r2, r7
    mov r3, r4
    str ip, [sp, #0x0]
    sub r4, ip, #0x20c0
    str r4, [sp, #0x4]
    bl func_02022cb0
    mov r5, r0
.L_02039974:
    ldr r0, .L_02039a48
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r0, [r6, #0x1fc]
    ldrsh r0, [r0, #0x0]
    cmp r0, #0x21
    cmpne r0, #0x22
    cmpne r0, #0x2e
    cmpne r0, #0x2f
    cmpne r0, #0x40
    bne .L_020399e4
    mov r0, r7
    bl func_0203811c
    mov r0, r7
    mov r1, #0x26
    mov r2, #0x0
    bl func_020349b8
    ldr r0, [r6, #0x1fc]
    ldrsb r0, [r0, #0x2c]
    cmp r0, #0x4
    ldr r0, [r7, #0x230]
    orreq r0, r0, #0x400000
    streq r0, [r7, #0x230]
    orrne r0, r0, #0x200000
    strne r0, [r7, #0x230]
.L_020399e4:
    mov r0, r7
    bl func_02039bb0
.L_020399ec:
    ldr r1, [r6, #0x1fc]
    mvn r0, #0x0
    ldrsh r1, [r1, #0x2e]
    cmp r1, r0
    beq .L_02039a34
    mov r0, r7
    bl func_02038ecc
    b .L_02039a34
.L_02039a0c:
    cmp r1, #0x0
    ble .L_02039a34
    ldr r0, .L_02039a4c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4c]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xc8]
    blx r2
.L_02039a34:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02039a3c: .word gLupyContext
.L_02039a40: .word data_020df4a4
.L_02039a44: .word gHeapContext
.L_02039a48: .word data_021052fc
.L_02039a4c: .word gSceneManager
    .size func_020398a4, . - func_020398a4
