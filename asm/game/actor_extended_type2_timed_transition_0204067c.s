; Matching retail form; see src/game/actor_extended_type2_timed_transition.c.
.text
.extern GameWork_TestFlag
.extern data_020df9e8
.extern data_020e6b74
.extern data_020e71ec
.extern gGamePhaseRuntime
.extern Actor_AdjustPositionForTerrainHeight
.extern Actor_PlayHorizontalSpatialSound
.extern InteractionRecordAllocator_ReserveRandomRecord
.extern InteractionWaypointCursor_SelectNearest
.extern InteractionWaypointCursor_GetCurrentRecord
.extern InteractionWaypointCursor_GetCurrentYPointer
.extern InteractionWaypointCursor_GetCurrentDurationFrames
.extern gGameWork
.global ActorExtendedType2_UpdateTimedAttachmentTransition
.type ActorExtendedType2_UpdateTimedAttachmentTransition, @function
ActorExtendedType2_UpdateTimedAttachmentTransition: ; 0x0204067c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r2, #0x11
    strh r2, [r5, #0xd6]
    ldr r2, [r5, #0x260]
    mov r4, r1
    tst r2, #0x800
    bne .L_02040900
    ldr r1, [r5, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x10
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    bne .L_0204078c
    bic r1, r2, #0x3
    str r1, [r5, #0x260]
    ldrh r2, [r5, #0x4e]
    ldr r1, .L_02040a44
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_0204072c
    ldr r3, [r5, #0x54]
    ldrh r2, [r3, #0x24]
    and r1, r2, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    orr r1, r2, #0x14
    strh r1, [r3, #0x24]
    ldr r1, [r5, #0x14]
    mov r2, #0x100
    orr r1, r1, #0x10000000
    str r1, [r5, #0x14]
    ldr r3, [r5, #0x54]
    add r1, r5, #0x200
    strh r2, [r3, #0x32]
    strh r2, [r3, #0x34]
    mov r2, #0x0
    strh r2, [r1, #0x4e]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x118]
    blx r1
    b .L_0204078c
.L_0204072c:
    ldr r2, [r5, #0x54]
    ldrsh r1, [r2, #0x34]
    sub r1, r1, #0x10
    strh r1, [r2, #0x34]
    ldr r2, [r5, #0x54]
    ldrsh r1, [r2, #0x34]
    cmp r1, #0x10
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    mov r1, #0x100
    strh r1, [r2, #0x34]
    ldr ip, [r5, #0x54]
    add r1, r5, #0x200
    ldrh r3, [ip, #0x24]
    mov r2, #0x0
    orr r3, r3, #0x14
    strh r3, [ip, #0x24]
    ldr r3, [r5, #0x14]
    orr r3, r3, #0x10000000
    str r3, [r5, #0x14]
    strh r2, [r1, #0x4e]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x118]
    blx r1
.L_0204078c:
    ldr r0, [r5, #0x260]
    tst r0, #0x4000
    addeq r1, r5, #0x200
    ldreqsh r0, [r1, #0x50]
    cmpeq r0, #0x0
    bne .L_020407d0
    ldr r3, [r5, #0x54]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x17
    strh r2, [r3, #0x24]
    ldr r2, [r5, #0x14]
    orr r2, r2, #0x10000000
    str r2, [r5, #0x14]
    ldrh r2, [r4, #0x14]
    strh r2, [r1, #0x4e]
    ldmia sp!, {r3, r4, r5, pc}
.L_020407d0:
    add r0, r5, #0x200
    ldrh r0, [r0, #0x72]
    tst r0, #0x800
    beq .L_02040828
    ldr r0, .L_02040a48
    ldr r1, [r5, #0x1cc]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02040828
    ldr r0, [r5, #0x14]
    add r1, r5, #0x200
    orr r0, r0, #0x10000000
    str r0, [r5, #0x14]
    ldr r3, [r5, #0x54]
    mov r0, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x7
    strh r2, [r3, #0x24]
    ldrh r2, [r4, #0x14]
    strh r2, [r1, #0x4e]
    ldmia sp!, {r3, r4, r5, pc}
.L_02040828:
    add r0, r5, #0x200
    ldrh r1, [r0, #0x4e]
    add r1, r1, #0x1
    strh r1, [r0, #0x4e]
    ldrh r1, [r0, #0x4e]
    ldrh r0, [r4, #0x14]
    cmp r1, r0
    bls .L_02040a3c
    ldr r0, [r5, #0x274]
    cmp r0, #0x0
    beq .L_020408d4
    mov r1, r5
    bl InteractionRecordAllocator_ReserveRandomRecord
    ldrsh r1, [r0, #0x0]
    mov r1, r1, lsl #0xc
    str r1, [r5, #0x230]
    ldrsh r1, [r0, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0xc
    str r1, [r5, #0x234]
    bl Actor_AdjustPositionForTerrainHeight
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    beq .L_020408d4
    ldr r1, [r5, #0x230]
    ldr r2, [r5, #0x234]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl InteractionWaypointCursor_SelectNearest
    ldr r0, [r5, #0x26c]
    bl InteractionWaypointCursor_GetCurrentRecord
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x230]
    ldr r0, [r5, #0x26c]
    bl InteractionWaypointCursor_GetCurrentYPointer
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x234]
    ldr r0, [r5, #0x26c]
    bl InteractionWaypointCursor_GetCurrentDurationFrames
    add r1, r5, #0x200
    strh r0, [r1, #0x6a]
.L_020408d4:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xcc]
    blx r1
    ldrh r1, [r4, #0x14]
    add r0, r5, #0x200
    strh r1, [r0, #0x4e]
    ldr r0, [r5, #0x260]
    orr r0, r0, #0x800
    str r0, [r5, #0x260]
    b .L_02040a3c
.L_02040900:
    ldr r0, .L_02040a4c
    ldr r2, [r5, #0x10]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x72
    tst r2, #0x4
    add r1, r1, #0x2000
    add r2, r0, #0x200
    ldr r0, [r1, #0xea4]
    mov r4, #0x0
    ldrh r1, [r2, #0x0]
    beq .L_0204095c
    tst r1, #0x100
    beq .L_02040988
    tst r1, #0x400
    beq .L_02040954
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r4, #0x1
    b .L_02040988
.L_02040954:
    mov r4, #0x1
    b .L_02040988
.L_0204095c:
    tst r1, #0x200
    beq .L_02040988
    tst r1, #0x400
    beq .L_02040984
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r4, #0x1
    b .L_02040988
.L_02040984:
    mov r4, #0x1
.L_02040988:
    cmp r4, #0x0
    beq .L_02040a3c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r5, #0x1fc]
    mov r1, #0x13
    cmp r0, #0x0
    ldreq r0, [r5, #0x200]
    streq r0, [r5, #0x1fc]
    ldr r0, .L_02040a50
    strh r1, [r5, #0xd6]
    ldr r1, [r0, #0x2d0]
    ldr r0, [r0, #0x2d4]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x10000000
    str r0, [r5, #0x14]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x260]
    bic r0, r0, #0x800
    str r0, [r5, #0x260]
    tst r0, #0x4000
    bne .L_02040a10
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x50]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x50]
.L_02040a10:
    ldrh r1, [r5, #0x4e]
    ldr r0, .L_02040a54
    mov r1, r1, lsl #0x1
    ldrh r1, [r0, r1]
    cmp r1, #0x0
    beq .L_02040a34
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
.L_02040a34:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02040a3c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02040a44: .word data_020e6b74
.L_02040a48: .word gGameWork
.L_02040a4c: .word gGamePhaseRuntime
.L_02040a50: .word data_020df9e8
.L_02040a54: .word data_020e71ec
.size ActorExtendedType2_UpdateTimedAttachmentTransition, . - ActorExtendedType2_UpdateTimedAttachmentTransition
