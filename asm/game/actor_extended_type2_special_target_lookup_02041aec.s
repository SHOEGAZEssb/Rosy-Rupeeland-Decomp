; Matching retail form; see src/game/actor_extended_type2_special_target_lookup.c.
.text
.extern data_020df9e8
.extern func_020536b8
.global ActorExtendedType2_LookupSpecialTarget65
.type ActorExtendedType2_LookupSpecialTarget65, @function
ActorExtendedType2_LookupSpecialTarget65: ; 0x02041aec
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    bic r1, r2, #0x1
    bic r1, r1, #0x20
    str r1, [r5, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x7
    strneb r0, [r5, #0x24c]
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02041b50
    ldr r1, .L_02041c14
    mov r0, #0x0
    ldr r2, [r1, #0x248]
    ldr r1, [r1, #0x24c]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldmia sp!, {r3, r4, r5, pc}
.L_02041b50:
    mov r1, #0x7
    mov r0, r5
    strb r1, [r5, #0x24c]
    bl func_020536b8
    movs r1, r0
    beq .L_02041bf0
    str r1, [r5, #0x228]
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x65
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02041c0c
    ldr r3, [r5, #0x20]
    ldr r2, [r1, #0x20]
    ldrsh r0, [r4, #0xe]
    sub r2, r3, r2
    mov r3, r2, asr #0xc
    mul r2, r3, r3
    ldr r4, [r5, #0x1c]
    ldr r3, [r1, #0x1c]
    smulbb r0, r0, r0
    sub r3, r4, r3
    mov r3, r3, asr #0xc
    mla r2, r3, r3, r2
    cmp r2, r0
    mov r0, r5
    ble .L_02041bdc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x54]
    b .L_02041c0c
.L_02041bdc:
    ldr r2, [r0, #0x0]
    add r1, r1, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    b .L_02041c0c
.L_02041bf0:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x54]
.L_02041c0c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02041c14: .word data_020df9e8
.size ActorExtendedType2_LookupSpecialTarget65, . - ActorExtendedType2_LookupSpecialTarget65
