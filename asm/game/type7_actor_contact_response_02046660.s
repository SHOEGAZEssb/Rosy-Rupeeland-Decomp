; Matching retail form; see src/game/type7_actor_contact_response.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020e16b0
.extern data_020e16d8
.extern data_020e1708
.extern data_020e1cfc
.extern data_02105310
.extern data_021f5ebc
.extern func_02005030
.extern func_02005058
.extern func_0200b294
.extern func_02032a94
.extern ActorDerivedType1_IsTargetStateEligible
.extern ActorDerivedType1_StartRecord
.extern ActorDerivedType1_IsSpecialRecordActive
.extern Type7Actor_HasSpecialCallbackPair
.extern Type7Actor_ApplyType2InteractionResponse
.extern func_020478dc
.extern func_020481dc
.extern func_0204b7bc
.extern func_0204c74c
.extern func_0204cfa4
.extern func_020593dc
.extern func_0206c68c
.extern func_0206c978
.extern func_0206cb04
.extern func_0206e590
.extern func_020828a0
.extern func_020adae4
.extern func_020adc90
.extern gGameWork
.extern gHeapContext
.extern gSoundContext
.global Type7Actor_HandleContact
.type Type7Actor_HandleContact, @function
Type7Actor_HandleContact: ; 0x02046660
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x18
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0204c74c
    cmp r0, #0x0
    beq .L_02046d48
    ldr r0, .L_02046d60
    bl func_0200b294
    cmp r0, #0x0
    bne .L_02046d48
    ldr r0, [r6, #0x280]
    cmp r0, #0x0
    beq .L_02046d48
    ldr r0, .L_02046d64
    mov r1, #0x40
    bl func_020828a0
    cmp r0, #0x0
    bne .L_02046d48
    ldr r0, [r6, #0x10]
    tst r0, #0x1000000
    bne .L_02046d48
    ldr r0, [r6, #0x280]
    cmp r0, #0x0
    beq .L_020467a0
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x0
    bne .L_020467a0
    ldr r0, [r6, #0x268]
    tst r0, #0xe0
    bne .L_020467a0
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020467a0
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1ac]
    blx r1
    cmp r0, #0x0
    beq .L_020467a0
    ldr r0, [r5, #0x10]
    tst r0, #0x1000000
    bne .L_020467a0
    ldr r7, [r6, #0x234]
    cmp r7, #0x0
    bne .L_0204678c
    beq .L_02046740
    mov r0, r7
    bl func_0206c978
    mov r0, r7
    bl Heap_Free
.L_02046740:
    ldr r1, .L_02046d68
    ldr r3, .L_02046d6c
    mov r0, #0xb4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02046764
    mov r1, r6
    bl func_0206c68c
.L_02046764:
    ldr r1, .L_02046d70
    str r0, [r6, #0x234]
    mov r0, r6
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bl func_020481dc
    ldr r0, .L_02046d74
    ldr r1, .L_02046d78
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_0204678c:
    ldr r0, [r6, #0x234]
    mov r1, r5
    mov r2, #0x1
    bl func_0206cb04
    b .L_02046d48
.L_020467a0:
    ldr r0, [r5, #0x14]
    tst r0, #0x10
    bne .L_02046c18
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_020467ec
    cmp r0, #0x1
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    bne .L_020467ec
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02046c18
.L_020467ec:
    cmp r1, #0x0
    beq .L_02046930
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x0
    bne .L_02046d48
    add r1, r5, #0x200
    mov r0, r5
    ldrsb r7, [r1, #0x7f]
    bl ActorDerivedType1_IsTargetStateEligible
    cmp r0, #0x0
    beq .L_02046850
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x9e]
    ldrsb r0, [r0, #0x7e]
    add r7, r7, r1
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02046850
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
.L_02046850:
    mov r0, r5
    bl ActorDerivedType1_IsTargetStateEligible
    cmp r0, #0x0
    bne .L_02046878
    ldrb r0, [r5, #0x24c]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0204690c
.L_02046878:
    ldr r0, [r6, #0x234]
    cmp r0, #0x0
    beq .L_020468e8
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0xf
    movs r1, r1, lsr #0x1f
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_020468e8
    mov r1, #0x0
    bl func_0206e590
    ldr r7, [r6, #0x234]
    cmp r7, #0x0
    beq .L_020468c4
    mov r0, r7
    bl func_0206c978
    mov r0, r7
    bl Heap_Free
.L_020468c4:
    ldr r0, .L_02046d74
    ldr r1, .L_02046d78
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r1, #0x0
    str r1, [r6, #0x234]
    add r0, r6, #0x200
    strh r1, [r0, #0x46]
    b .L_02046d48
.L_020468e8:
    ldr r1, [r6, #0x29c]
    mov r0, r6
    ldrh r2, [r1, #0x38]
    mov r1, r5
    mov r3, r7
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x17
    bl Type7Actor_ApplyType2InteractionResponse
    b .L_02046d48
.L_0204690c:
    ldr r1, [r6, #0x29c]
    mov r0, r6
    ldrh r2, [r1, #0x38]
    mov r1, r5
    mov r3, r7
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x17
    bl Type7Actor_ApplyType2InteractionResponse
    b .L_02046d48
.L_02046930:
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r7, r3, r2
    sub r9, r1, r0
    mov r0, r7
    mov r1, r9
    bl func_0204cfa4
    mov r8, r0
    cmp r8, #0x1000
    ble .L_02046d48
    mov r0, r7
    mov r1, r8
    bl func_020adc90
    mov r7, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    ldr r1, [r6, #0xd0]
    mov r8, r0
    tst r1, #0x10
    beq .L_020469ac
    mov r0, r7
    mov r1, #0x2
    bl func_020adae4
    mov r7, r0
    mov r0, r8
    mov r1, #0x2
    bl func_020adae4
    mov r8, r0
.L_020469ac:
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02046b14
    cmp r4, #0x0
    bne .L_02046a58
    ldr r0, [r6, #0x268]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02046a58
    mov r0, r6
    bl Type7Actor_HasSpecialCallbackPair
    cmp r0, #0x0
    bne .L_02046a58
    ldr r0, [r6, #0x268]
    tst r0, #0x8000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02046a58
    add r0, sp, #0x8
    add r1, r6, #0x18
    bl func_02005030
    mov r0, #0x14
    mov r1, #0x1e
    mul r2, r7, r0
    mul r0, r8, r1
    ldr r3, [sp, #0xc]
    ldr r1, [sp, #0x10]
    sub r9, r3, r2
    sub r3, r1, r0
    add r1, sp, #0x8
    mov r0, r6
    mov r2, #0x4b
    str r9, [sp, #0xc]
    str r3, [sp, #0x10]
    bl func_020478dc
    add r0, sp, #0x8
    bl func_02005058
.L_02046a58:
    add r0, r6, #0x200
    ldrh r0, [r0, #0x54]
    cmp r0, #0x0
    bne .L_02046a80
    ldr r0, [r6, #0x9c]
    sub r0, r0, r7
    str r0, [r6, #0x9c]
    ldr r0, [r6, #0xa0]
    sub r0, r0, r8
    str r0, [r6, #0xa0]
.L_02046a80:
    cmp r4, #0x0
    bne .L_02046b58
    ldr r1, [r5, #0x9c]
    mov r0, r6
    add r1, r1, r7
    str r1, [r5, #0x9c]
    ldr r1, [r5, #0xa0]
    add r1, r1, r8
    str r1, [r5, #0xa0]
    bl Type7Actor_HasSpecialCallbackPair
    cmp r0, #0x0
    beq .L_02046b58
    ldr r0, [r6, #0x210]
    cmp r0, r5
    bne .L_02046b58
    mov r0, r5
    bl ActorDerivedType1_IsSpecialRecordActive
    cmp r0, #0x0
    beq .L_02046b58
    mov r0, r5
    mov r1, #0x88
    bl ActorDerivedType1_StartRecord
    add r0, r5, #0x200
    mov r2, #0x0
    ldr r1, .L_02046d7c
    strh r2, [r0, #0x68]
    mov r0, r6
    mov r3, #0x1e
    ldmia r1, {r1, r2}
    bl func_020481dc
    ldrsh r0, [r6, #0xd6]
    cmp r0, #0x12
    beq .L_02046b58
    mov r0, r6
    mov r1, #0x2
    bl func_0204b7bc
    b .L_02046b58
.L_02046b14:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02046b58
    ldr r0, [r6, #0x9c]
    sub r0, r0, r7
    str r0, [r6, #0x9c]
    ldr r0, [r6, #0xa0]
    sub r0, r0, r8
    str r0, [r6, #0xa0]
    ldr r0, [r5, #0x8c]
    add r0, r0, r7
    str r0, [r5, #0x8c]
    ldr r0, [r5, #0x90]
    add r0, r0, r8
    str r0, [r5, #0x90]
.L_02046b58:
    cmp r4, #0x0
    bne .L_02046d48
    ldr r0, [r6, #0xd0]
    tst r0, #0x10
    addeq r0, r6, #0x200
    ldreqh r1, [r0, #0x54]
    cmpeq r1, #0x0
    bne .L_02046d48
    ldrh r1, [r0, #0x52]
    ldr r0, .L_02046d80
    cmp r1, r0
    beq .L_02046d48
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02046d48
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    beq .L_02046d48
    ldrsh r0, [r6, #0xd6]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_02046d48
    add r0, r6, #0x200
    ldrh r2, [r0, #0x52]
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02046d84
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
    add r0, r6, #0x200
    mov r1, #0xa
    strh r1, [r0, #0x54]
    b .L_02046d48
.L_02046c18:
    ldrb r1, [r5, #0x4d]
    cmp r1, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02046ca4
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x18
    bne .L_02046d48
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r8, r3, r2
    sub r9, r1, r0
    mov r0, r8
    mov r1, r9
    bl func_0204cfa4
    mov r7, r0
    cmp r7, #0x1000
    ble .L_02046d48
    mov r0, r8
    mov r1, r7
    bl func_020adc90
    add r1, r0, r0, lsl #0x1
    ldr r2, [r6, #0x9c]
    mov r0, r9
    sub r2, r2, r1
    mov r1, r7
    str r2, [r6, #0x9c]
    bl func_020adc90
    ldr r1, [r6, #0xa0]
    sub r0, r1, r0
    str r0, [r6, #0xa0]
    b .L_02046d48
.L_02046ca4:
    cmp r4, #0x0
    bne .L_02046d48
    ldr r0, [r6, #0x234]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02046d48
    cmp r1, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r6, #0x29c]
    ldrneh r0, [r0, #0x40]
    cmpne r0, #0x0
    beq .L_02046d48
    ldr r1, [r5, #0x24]
    ldr r0, [r6, #0x24]
    subs r0, r1, r0
    bmi .L_02046d48
    ldrh r0, [r6, #0x4e]
    cmp r0, #0x25c
    beq .L_02046d48
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x15
    blt .L_02046d48
    cmp r0, #0x26
    bgt .L_02046d48
    cmp r0, #0x20
    beq .L_02046d48
    ldr r1, .L_02046d88
    mov r0, r6
    mov r3, #0x1e
    ldmia r1, {r1, r2}
    bl func_020481dc
    ldrsh r0, [r6, #0xd6]
    cmp r0, #0x12
    beq .L_02046d48
    mov r0, r6
    mov r1, #0x2
    bl func_0204b7bc
.L_02046d48:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02032a94
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02046d60: .word data_02105310
.L_02046d64: .word data_021f5ebc
.L_02046d68: .word data_020e1cfc
.L_02046d6c: .word gHeapContext
.L_02046d70: .word data_020e16d8
.L_02046d74: .word gGameWork
.L_02046d78: .word 0x3fd
.L_02046d7c: .word data_020e16b0
.L_02046d80: .word 0xffff
.L_02046d84: .word gSoundContext
.L_02046d88: .word data_020e1708
.size Type7Actor_HandleContact, . - Type7Actor_HandleContact
