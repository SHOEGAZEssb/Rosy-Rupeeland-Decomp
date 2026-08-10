; Matching retail form; see src/game/actor_derived_type1_record_teardown.c.
.text
.extern Heap_Alloc
.extern data_020df4a4
.extern func_0201f864
.extern func_020349b8
.extern ActorDerivedType1_ApplyResourceIndex
.extern func_0205940c
.extern gHeapContext
.extern gSoundContext

    .global ActorDerivedType1_TeardownActiveRecord
    .type ActorDerivedType1_TeardownActiveRecord, @function
ActorDerivedType1_TeardownActiveRecord: ; 0x020390c8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_0203922c
    ldr r1, [r4, #0x27c]
    ldrb r0, [r1, #0x8]
    sub r0, r0, #0x73
    cmp r0, #0x1
    bhi .L_0203917c
    ldrh r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_02039160
    ldr r1, .L_02039234
    ldr r3, .L_02039238
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02039160
    ldr r6, [r4, #0x27c]
    mov lr, #0x0
    ldrh r1, [r6, #0x16]
    sub ip, lr, #0x4
    sub r3, lr, #0x1
    str r1, [sp, #0x0]
    ldrh r5, [r6, #0x18]
    mov r2, #0x1
    add r1, r4, #0x18
    stmib sp, {r5, lr}
    str ip, [sp, #0xc]
    str r3, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r2, [r4, #0x54]
    ldrh r3, [r6, #0x14]
    ldr r2, [r2, #0x0]
    bl func_0201f864
.L_02039160:
    ldr r0, [r4, #0x27c]
    ldrh r1, [r0, #0x1a]
    cmp r1, #0x0
    beq .L_0203917c
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
.L_0203917c:
    ldr r0, [r4, #0x27c]
    ldrh r2, [r0, #0x2e]
    cmp r2, #0x0
    beq .L_020391a0
    ldr r0, .L_0203923c
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_020391a0:
    mov r0, r4
    mov r1, #0x0
    bl ActorDerivedType1_ApplyResourceIndex
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_020391c4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020391c4:
    mov r0, #0x0
    str r0, [r4, #0x274]
    str r0, [r4, #0x27c]
    ldr r0, [r4, #0x230]
    bic r0, r0, #0xf800
    str r0, [r4, #0x230]
    ldr r0, [r4, #0x278]
    cmp r0, #0x0
    beq .L_02039200
    ldr ip, [r0, #0x0]
    ldrb r1, [r4, #0xd4]
    ldr ip, [ip, #0xd0]
    mov r2, #0x80
    mov r3, #0x1000
    blx ip
.L_02039200:
    mov r1, #0x0
    str r1, [r4, #0x278]
    add r0, r4, #0x200
    strh r1, [r0, #0x64]
    strh r1, [r0, #0x80]
    strh r1, [r0, #0x82]
    mov r0, r4
    strb r1, [r4, #0x26b]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_0203922c:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02039234: .word data_020df4a4
.L_02039238: .word gHeapContext
.L_0203923c: .word gSoundContext
    .size ActorDerivedType1_TeardownActiveRecord, . - ActorDerivedType1_TeardownActiveRecord
