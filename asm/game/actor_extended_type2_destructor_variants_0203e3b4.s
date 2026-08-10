; Matching retail form; see src/game/actor_extended_type2_destructor_variants.c.
.text
.extern Heap_Free
.extern data_020dfee4
.extern func_02005058
.extern func_02031488
.extern ActorDerivedRuntime_DestroyAlternate
.extern func_0204cd7c
    .global ActorExtendedType2_DestroyAndFree
    .type ActorExtendedType2_DestroyAndFree, @function
ActorExtendedType2_DestroyAndFree: ; 0x0203e3b4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0203e490
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_0203e3d4
    bl Heap_Free
.L_0203e3d4:
    ldr r0, [r4, #0x278]
    cmp r0, #0x0
    beq .L_0203e3ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e3ec:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    mov r5, #0x0
.L_0203e408:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_0203e424
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e424:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0203e408
    ldr r0, [r4, #0x210]
    cmp r0, #0x0
    beq .L_0203e448
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e448:
    ldr r0, [r4, #0x214]
    cmp r0, #0x0
    beq .L_0203e460
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e460:
    add r0, r4, #0x284
    bl func_0204cd7c
    add r0, r4, #0x23c
    bl func_02005058
    add r0, r4, #0x22c
    bl func_02005058
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0203e490: .word data_020dfee4
    .size ActorExtendedType2_DestroyAndFree, . - ActorExtendedType2_DestroyAndFree

    .global ActorExtendedType2_Destroy
    .type ActorExtendedType2_Destroy, @function

ActorExtendedType2_Destroy: ; 0x0203e494
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0203e568
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_0203e4b4
    bl Heap_Free
.L_0203e4b4:
    ldr r0, [r4, #0x278]
    cmp r0, #0x0
    beq .L_0203e4cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e4cc:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    mov r5, #0x0
.L_0203e4e8:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_0203e504
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e504:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0203e4e8
    ldr r0, [r4, #0x210]
    cmp r0, #0x0
    beq .L_0203e528
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e528:
    ldr r0, [r4, #0x214]
    cmp r0, #0x0
    beq .L_0203e540
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e540:
    add r0, r4, #0x284
    bl func_0204cd7c
    add r0, r4, #0x23c
    bl func_02005058
    add r0, r4, #0x22c
    bl func_02005058
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0203e568: .word data_020dfee4
    .size ActorExtendedType2_Destroy, . - ActorExtendedType2_Destroy

