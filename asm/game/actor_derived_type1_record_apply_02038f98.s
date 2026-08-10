; Matching retail form; see src/game/actor_derived_type1_record_apply.c.
.text
.extern Heap_Alloc
.extern data_020df48c
.extern func_02005580
.extern ActorDerivedType1_TeardownActiveRecord
.extern gHeapContext

    .global ActorDerivedType1_ApplyActiveRecord
    .type ActorDerivedType1_ApplyActiveRecord, @function
ActorDerivedType1_ApplyActiveRecord: ; 0x02038f98
    stmdb sp!, {r4, lr}
    ldr r1, .L_020390c0
    mov r4, r0
    ldr r3, .L_020390c4
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02038fd0
    ldr r3, [r4, #0x27c]
    ldrh r1, [r3, #0x20]
    ldrh r2, [r3, #0x22]
    ldrh r3, [r3, #0x24]
    bl func_02005580
.L_02038fd0:
    str r0, [r4, #0x274]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r4, #0x230]
    orr r0, r0, #0x800
    str r0, [r4, #0x230]
    ldr r1, [r4, #0x27c]
    ldr r0, [r4, #0xd0]
    ldrb r1, [r1, #0x8]
    tst r0, #0x4000
    moveq r0, #0x1
    sub r1, r1, #0x69
    movne r0, #0x0
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b .L_020390a0
.L_02039018:
    b .L_02039048
    b .L_02039058
    b .L_020390a0
    b .L_020390a0
    b .L_02039084
    b .L_020390a0
    b .L_02039068
    b .L_020390a0
    b .L_020390a0
    b .L_020390a0
    b .L_02039078
    b .L_02039078
.L_02039048:
    ldr r1, [r4, #0x230]
    orr r1, r1, #0x1000
    str r1, [r4, #0x230]
    b .L_020390a0
.L_02039058:
    ldr r1, [r4, #0x230]
    orr r1, r1, #0x2000
    str r1, [r4, #0x230]
    b .L_020390a0
.L_02039068:
    ldr r1, [r4, #0x230]
    orr r1, r1, #0x4000
    str r1, [r4, #0x230]
    b .L_020390a0
.L_02039078:
    mov r0, #0x0
    strb r0, [r4, #0x2a1]
    mov r0, #0x1
.L_02039084:
    ldr r2, [r4, #0x27c]
    add r1, r4, #0x200
    ldrsh r2, [r2, #0x1e]
    strh r2, [r1, #0x82]
    ldr r1, [r4, #0x230]
    orr r1, r1, #0x8000
    str r1, [r4, #0x230]
.L_020390a0:
    add r1, r4, #0x200
    mov r2, #0x0
    strh r2, [r1, #0xa2]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl ActorDerivedType1_TeardownActiveRecord
    ldmia sp!, {r4, pc}
.L_020390c0: .word data_020df48c
.L_020390c4: .word gHeapContext
    .size ActorDerivedType1_ApplyActiveRecord, . - ActorDerivedType1_ApplyActiveRecord
