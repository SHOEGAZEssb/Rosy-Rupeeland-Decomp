; Matching retail form; see src/game/actor_extended_type2_lifecycle.c.
.text
.extern Heap_Free
.extern data_020dfee4
.extern data_020df9e8
.extern data_020dfec0
.extern func_02004ac8
.extern func_02005058
.extern func_02031488
.extern ActorDerivedRuntime_DestroyAlternate
.extern func_0204cd7c
.extern func_020c0c24
    .global ActorExtendedType2_ResetRuntimeState
    .type ActorExtendedType2_ResetRuntimeState, @function
ActorExtendedType2_ResetRuntimeState: ; 0x0203e214
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x200
    mov lr, #0x0
    strh lr, [r1, #0x4e]
    strh lr, [r1, #0x54]
    ldr r2, .L_0203e294
    strb lr, [r4, #0x24c]
    ldr ip, [r2, #0xb0]
    ldr r3, [r2, #0xb4]
    str ip, [r4, #0x218]
    str r3, [r4, #0x21c]
    ldr r3, [r2, #0x98]
    ldr r2, [r2, #0x9c]
    str r3, [r4, #0x220]
    str r2, [r4, #0x224]
    ldr r2, [r4, #0x260]
    bic r2, r2, #0x3
    str r2, [r4, #0x260]
    strh lr, [r1, #0x58]
    strh lr, [r1, #0x5a]
    strh lr, [r1, #0x56]
    strh lr, [r1, #0x5c]
    strb lr, [r4, #0x24d]
    str lr, [r4, #0x228]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xcc]
    blx r1
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x70]
    ldmia sp!, {r4, pc}
.L_0203e294: .word data_020df9e8
    .size ActorExtendedType2_ResetRuntimeState, . - ActorExtendedType2_ResetRuntimeState

    .global ActorExtendedType2_DestroyComplete
    .type ActorExtendedType2_DestroyComplete, @function

ActorExtendedType2_DestroyComplete: ; 0x0203e298
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0203e36c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_0203e2b8
    bl Heap_Free
.L_0203e2b8:
    ldr r0, [r4, #0x278]
    cmp r0, #0x0
    beq .L_0203e2d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e2d0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    mov r5, #0x0
.L_0203e2ec:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_0203e308
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e308:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0203e2ec
    ldr r0, [r4, #0x210]
    cmp r0, #0x0
    beq .L_0203e32c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e32c:
    ldr r0, [r4, #0x214]
    cmp r0, #0x0
    beq .L_0203e344
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203e344:
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
.L_0203e36c: .word data_020dfee4
    .size ActorExtendedType2_DestroyComplete, . - ActorExtendedType2_DestroyComplete

    .global ActorExtendedRecordArray_DestroyAndFree
    .type ActorExtendedRecordArray_DestroyAndFree, @function

ActorExtendedRecordArray_DestroyAndFree: ; 0x0203e370
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203e3ac
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0203e39c
    mov r1, #0x8
    ldr r3, .L_0203e3b0
    mov r2, r1
    bl func_020c0c24
.L_0203e39c:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203e3ac: .word data_020dfec0
.L_0203e3b0: .word func_02004ac8
    .size ActorExtendedRecordArray_DestroyAndFree, . - ActorExtendedRecordArray_DestroyAndFree

