; Matching retail form; see src/game/actor_extended_type2_record_array.c.
.text
.extern data_020df9e0
.extern data_020dfec0
.extern Heap_AllocAlternateEntry
.extern ActorExtendedRecordArray_InitElementNoOp
.extern CxxArray_ConstructWithCookie
.extern gHeapContext
    .global ActorExtendedRecordArray_Init
    .type ActorExtendedRecordArray_Init, @function
ActorExtendedRecordArray_Init: ; 0x0203de48
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r2, .L_0203df38
    mov r5, r0
    mov r4, r1
    str r2, [r5, #0x0]
    mov r0, #0x0
    str r0, [r5, #0x8]
    mov r2, r4
    mvn r0, #0x0
.L_0203de70:
    ldrsh r1, [r2, #0x0]
    cmp r1, r0
    ldrne r1, [r5, #0x8]
    addne r2, r2, #0x8
    addne r1, r1, #0x1
    strne r1, [r5, #0x8]
    bne .L_0203de70
    ldr r7, [r5, #0x8]
    cmp r7, #0x0
    ble .L_0203df24
    mov r0, r7, lsl #0x3
    ldr r1, .L_0203df3c
    ldr r3, .L_0203df40
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq .L_0203ded8
    ldr r6, .L_0203df44
    mov r2, #0x8
    mov r1, r7
    mov r3, r2
    str r6, [sp, #0x0]
    mov r6, #0x0
    str r6, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
.L_0203ded8:
    str r0, [r5, #0x4]
    mov r7, #0x0
    b .L_0203df14
.L_0203dee4:
    ldrsh r6, [r4, #0x6]
    ldr r2, [r5, #0x4]
    ldrsh lr, [r4, #0x4]
    ldrsh ip, [r4, #0x2]
    ldrsh r0, [r4], #0x8
    mov r1, r7, lsl #0x3
    add r3, r2, r7, lsl #0x3
    strh r0, [r2, r1]
    strh ip, [r3, #0x2]
    strh lr, [r3, #0x4]
    strh r6, [r3, #0x6]
    add r7, r7, #0x1
.L_0203df14:
    ldr r0, [r5, #0x8]
    cmp r7, r0
    blt .L_0203dee4
    b .L_0203df2c
.L_0203df24:
    mov r0, #0x0
    str r0, [r5, #0x4]
.L_0203df2c:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0203df38: .word data_020dfec0
.L_0203df3c: .word data_020df9e0
.L_0203df40: .word gHeapContext
.L_0203df44: .word ActorExtendedRecordArray_InitElementNoOp
    .size ActorExtendedRecordArray_Init, . - ActorExtendedRecordArray_Init
