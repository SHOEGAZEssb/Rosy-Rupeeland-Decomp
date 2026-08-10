; Matching retail form; see src/game/actor_extended_type2_terminal_update.c.
.text
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Actor_RestoreSavedFlags
.extern PresentationBackedActor_SpawnSplitAmount
.extern PresentationBackedActor_SpawnTripleVariant
.extern func_0204f7e4
.extern func_02062864
.extern func_020695f4
.global ActorExtendedType2_ResetTerminalAttachmentState
.type ActorExtendedType2_ResetTerminalAttachmentState, @function
ActorExtendedType2_ResetTerminalAttachmentState: ; 0x0204157c
    ldr r2, [r0, #0x260]
    mov r1, #0x0
    bic r2, r2, #0x3
    str r2, [r0, #0x260]
    strb r1, [r0, #0x24c]
    ldr r2, [r0, #0x54]
    mov r0, r1
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bx lr
.size ActorExtendedType2_ResetTerminalAttachmentState, . - ActorExtendedType2_ResetTerminalAttachmentState

.global ActorExtendedType2_UpdateTerminalState18
.type ActorExtendedType2_UpdateTerminalState18, @function
ActorExtendedType2_UpdateTerminalState18: ; 0x020415a8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r0, #0x12
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x3
    str r0, [r4, #0x260]
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    ldreq r1, [r4, #0x24]
    ldreq r0, [r4, #0x1dc]
    cmpeq r1, r0
    bne .L_020416d0
    ldr r0, [r4, #0x260]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_020416a0
    add r1, sp, #0x0
    mov r0, r4
    bl func_020695f4
    mov r7, r0
    add r0, sp, #0x4
    add r1, r4, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x10]
    cmp r7, #0x0
    add r0, r0, #0x14000
    str r0, [sp, #0x10]
    beq .L_02041668
    mov r0, r7
    mov r1, #0x1
    ldrh r8, [r7, #0x4]
    bl func_02062864
    mov r9, #0x0
    add r6, sp, #0x4
    mov r5, #0x12c
    b .L_0204165c
.L_02041648:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_0204f7e4
    add r9, r9, #0x1
.L_0204165c:
    cmp r9, r8
    blt .L_02041648
    b .L_02041698
.L_02041668:
    ldr r0, [sp, #0x0]
    cmp r0, #0x0
    ble .L_02041698
    cmp r0, #0x3e8
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    add r2, sp, #0x4
    mov r0, #0x12c
    bgt .L_02041694
    bl PresentationBackedActor_SpawnSplitAmount
    b .L_02041698
.L_02041694:
    bl PresentationBackedActor_SpawnTripleVariant
.L_02041698:
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
.L_020416a0:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    mov r0, r4
    bl Actor_RestoreSavedFlags
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
    b .L_02041704
.L_020416d0:
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x5a]
    ldr r1, [r4, #0x54]
    tst r0, #0x4
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x24]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x5a]
    add r1, r1, #0x1
    strh r1, [r0, #0x5a]
.L_02041704:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.size ActorExtendedType2_UpdateTerminalState18, . - ActorExtendedType2_UpdateTerminalState18
