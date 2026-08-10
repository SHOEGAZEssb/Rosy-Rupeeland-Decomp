; Matching retail form; see src/game/actor_derived_type1_lifecycle.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020df3c8
.extern func_02005058
.extern func_02031488
.extern ActorDerivedRuntime_DestroyAlternate
.extern func_0204cd7c
.extern func_0206c978
.extern gGameWork

    .global ActorDerivedType1_DestroyAndFree
    .type ActorDerivedType1_DestroyAndFree, @function
ActorDerivedType1_DestroyAndFree: ; 0x02035290
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02035394
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r5, [r4, #0x26c]
    cmp r5, #0x0
    beq .L_020352d0
    beq .L_020352c0
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_020352c0:
    ldr r0, .L_02035398
    ldr r1, .L_0203539c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_020352d0:
    ldr r0, [r4, #0x270]
    cmp r0, #0x0
    beq .L_020352e8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020352e8:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    mov r5, #0x0
.L_02035304:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_02035320
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02035320:
    add r5, r5, #0x1
    cmp r5, #0x9
    blt .L_02035304
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    beq .L_02035344
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02035344:
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_0203535c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203535c:
    add r0, r4, #0x2a8
    bl func_0204cd7c
    add r0, r4, #0x284
    bl func_02005058
    add r0, r4, #0x254
    bl func_02005058
    add r0, r4, #0x238
    bl func_02005058
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02035394: .word data_020df3c8
.L_02035398: .word gGameWork
.L_0203539c: .word 0x3ee
    .size ActorDerivedType1_DestroyAndFree, . - ActorDerivedType1_DestroyAndFree

    .global ActorDerivedType1_InitializeResources

