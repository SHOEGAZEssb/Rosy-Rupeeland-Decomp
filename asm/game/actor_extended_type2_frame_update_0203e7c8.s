; Matching retail form; see src/game/actor_extended_type2_frame_update.c.
.text
.extern data_020c9670
.extern data_020df9e8
.extern data_020dfa40
.extern data_020dfa48
.extern data_020dfaf0
.extern data_020dfaf8
.extern data_020dfb08
.extern data_020dfb78
.extern data_020e6f94
.extern data_020e8380
.extern data_021052fc
.extern func_02005058
.extern func_020066a4
.extern func_02007f0c
.extern func_02032228
.extern func_02032370
.extern Actor_UpdateAnimationState
.extern Actor_SaveAndForceFlags
.extern func_020349b8
.extern AttachmentController_SetEnabled
.extern Actor_UpdateGroundContactProbe
.extern func_02045184
.extern func_0204ced8
.extern func_0204cf28
.extern func_0204cfa4
.extern func_0204cff4
.extern func_020ae024
    .global ActorExtendedType2_UpdateFrame
    .type ActorExtendedType2_UpdateFrame, @function
ActorExtendedType2_UpdateFrame: ; 0x0203e7c8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r6, r0
    ldr r0, [r6, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203ef24
    ldr r0, [r6, #0xd0]
    tst r0, #0x4000
    beq .L_0203e810
    ldr r0, [r6, #0x260]
    tst r0, #0x20000
    movne r1, #0x3c
    moveq r1, #0x1e
    add r0, r6, #0x200
    strh r1, [r0, #0x52]
.L_0203e810:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r5, #0x0
    add r0, r6, #0x200
    ldrh r1, [r0, #0x72]
    mov r0, r5
    mov ip, r5
    tst r1, #0x400
    ldrb r4, [r6, #0x24c]
    beq .L_0203e878
    ldr r1, .L_0203ef2c
    ldr r3, [r6, #0x218]
    ldr r1, [r1, #0x120]
    mov lr, #0x1
    cmp r3, r1
    ldr r1, .L_0203ef30
    bne .L_0203e870
    ldr r2, [r6, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq lr, #0x0
.L_0203e870:
    cmp lr, #0x0
    movne ip, #0x1
.L_0203e878:
    cmp ip, #0x0
    beq .L_0203e890
    ldr r2, [r6, #0x1dc]
    ldr r1, [r6, #0x24]
    cmp r2, r1
    moveq r0, #0x1
.L_0203e890:
    cmp r0, #0x0
    beq .L_0203e8c4
    ldr r0, .L_0203ef34
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r5, #0x1
.L_0203e8c4:
    cmp r5, #0x0
    beq .L_0203e934
    ldr r0, [r6, #0x274]
    cmp r0, #0x0
    beq .L_0203e8e0
    mov r1, r6
    bl func_02045184
.L_0203e8e0:
    ldr r0, .L_0203ef2c
    ldr r1, .L_0203ef38
    ldr r2, [r0, #0x118]
    ldr r0, [r0, #0x11c]
    str r2, [r6, #0x218]
    str r0, [r6, #0x21c]
    ldrh r0, [r6, #0x4e]
    mov r0, r0, lsl #0x1
    ldrh r1, [r1, r0]
    cmp r1, #0x0
    beq .L_0203e918
    mov r0, r6
    mov r2, #0x0
    bl func_020349b8
.L_0203e918:
    mov r0, #0x11
    strh r0, [r6, #0xd6]
    ldr r1, [r6, #0x260]
    mov r0, r6
    bic r1, r1, #0x3
    str r1, [r6, #0x260]
    bl Actor_SaveAndForceFlags
.L_0203e934:
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, sp, #0x10
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r6, #0x26c]
    cmp r0, #0x0
    beq .L_0203e9c8
    add r0, r6, #0x200
    ldrh r0, [r0, #0x6a]
    mov r3, #0x0
    cmp r0, #0x0
    beq .L_0203e9a0
    ldr r0, .L_0203ef2c
    ldr r2, [r6, #0x218]
    ldr r0, [r0, #0x108]
    mov r5, #0x1
    cmp r2, r0
    ldr r0, .L_0203ef3c
    bne .L_0203e998
    ldr r1, [r6, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r5, #0x0
.L_0203e998:
    cmp r5, #0x0
    moveq r3, #0x1
.L_0203e9a0:
    cmp r3, #0x0
    beq .L_0203e9c8
    add r1, r6, #0x200
    ldrh r2, [r1, #0x6a]
    mov r0, r6
    sub r2, r2, #0x1
    strh r2, [r1, #0x6a]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x138]
    blx r1
.L_0203e9c8:
    add r0, r6, #0x200
    ldrh r1, [r0, #0x5c]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r6, #0x24d]
    beq .L_0203e9f4
    sub r1, r1, #0x1
    strh r1, [r0, #0x5c]
    ldrh r0, [sp, #0x2a]
    orr r0, r0, #0x2
    strh r0, [sp, #0x2a]
.L_0203e9f4:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1a4]
    blx r1
    cmp r0, #0x0
    beq .L_0203edac
    mov r5, #0x1
    strh r5, [r6, #0xd6]
    ldr r0, .L_0203ef2c
    ldr r2, [r6, #0x218]
    ldr r0, [r0, #0x58]
    ldr r3, .L_0203ef40
    cmp r2, r0
    bne .L_0203ea40
    ldr r1, [r6, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r5, #0x0
.L_0203ea40:
    cmp r5, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x40]
    strne r0, [r6, #0x3c]
    mov r0, #0x0
    strb r0, [r6, #0x24c]
    add r0, r6, #0x200
    ldrh r1, [r0, #0x56]
    cmp r1, #0x77
    addlo r1, r1, #0x1
    strloh r1, [r0, #0x56]
    ldr r0, [r6, #0xd0]
    bic r0, r0, #0x2
    str r0, [r6, #0xd0]
    ldr r0, [r6, #0x21c]
    tst r0, #0x1
    add r0, r6, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r6, #0x218]
    ldrne r2, [r2, r1]
    add r1, sp, #0x10
    ldreq r2, [r6, #0x218]
    blx r2
    ldr r0, .L_0203ef2c
    mov r3, #0x0
    ldr r2, [r6, #0x218]
    ldr r0, [r0, #0x190]
    mov r5, r3
    cmp r2, r0
    mov ip, #0x1
    ldr r0, .L_0203ef44
    bne .L_0203ead4
    ldr r1, [r6, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_0203ead4:
    cmp ip, #0x0
    ldrnesh r0, [r6, #0xd6]
    cmpne r0, #0x16
    movne r5, #0x1
    cmp r5, #0x0
    beq .L_0203eaf8
    ldr r0, [r6, #0x260]
    tst r0, #0x400
    moveq r3, #0x1
.L_0203eaf8:
    cmp r3, #0x0
    beq .L_0203eba8
    ldr r0, [r6, #0x228]
    cmp r0, #0x0
    beq .L_0203eb84
    ldr r0, .L_0203ef2c
    ldr r2, [r6, #0x218]
    ldr r0, [r0, #0x110]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_0203ef48
    bne .L_0203eb3c
    ldr r1, [r6, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0203eb3c:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203eb5c
    ldr r0, [r6, #0x260]
    tst r0, #0x20
    beq .L_0203eb84
.L_0203eb5c:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x144]
    blx r1
    ldr r1, [r6, #0x228]
    mov r2, r0
    mov r0, r6
    add r1, r1, #0x18
    bl func_02032370
    b .L_0203eba8
.L_0203eb84:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x140]
    blx r1
    mov r3, r0
    ldr r1, [r6, #0x3c]
    ldr r2, [r6, #0x40]
    mov r0, r6
    bl func_02032228
.L_0203eba8:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x52]
    cmp r1, #0x0
    ble .L_0203ebd0
    mov r1, #0x0
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    ldrsh r1, [r0, #0x52]
    sub r1, r1, #0x1
    strh r1, [r0, #0x52]
.L_0203ebd0:
    ldrb r0, [r6, #0x268]
    cmp r0, #0x0
    beq .L_0203ed64
    ldr r0, [r6, #0x264]
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r6, #0x268]
    beq .L_0203ed64
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0203ec30
    mov r1, #0x0
    strb r1, [r6, #0x268]
    mov r0, r6
    strb r1, [r6, #0x269]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x13c]
    blx r2
    b .L_0203ed64
.L_0203ec30:
    ldrh r2, [r6, #0x4e]
    ldr r1, .L_0203ef4c
    mov r0, #0x30
    mla r0, r2, r0, r1
    ldrh r2, [r0, #0x1e]
    ldr r1, [r6, #0x264]
    add r0, sp, #0x0
    mov r3, r2, lsl #0x10
    add r1, r1, #0x18
    add r2, r6, #0x18
    mov r5, r3, lsr #0x12
    bl func_020066a4
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    bl func_0204cfa4
    cmp r0, #0x4000
    ble .L_0203ed30
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b .L_0203ecb0
.L_0203ec80: ; jump table
    b .L_0203ec90 ; case 0
    b .L_0203ec98 ; case 1
    b .L_0203eca0 ; case 2
    b .L_0203eca8 ; case 3
.L_0203ec90:
    ldr r5, .L_0203ef50
    b .L_0203ecb4
.L_0203ec98:
    mov r5, #0x1ec
    b .L_0203ecb4
.L_0203eca0:
    ldr r5, .L_0203ef54
    b .L_0203ecb4
.L_0203eca8:
    ldr r5, .L_0203ef54
    b .L_0203ecb4
.L_0203ecb0:
    mov r5, #0xcd
.L_0203ecb4:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r2, .L_0203ef58
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r0]
    mov r0, r3, lsl #0x1
    ldrsh r0, [r2, r0]
    smull r2, r3, r1, r5
    adds ip, r2, #0x800
    smull r2, r1, r0, r5
    adc r0, r3, #0x0
    adds r2, r2, #0x800
    mov r3, ip, lsr #0xc
    ldr r5, [r6, #0x8c]
    orr r3, r3, r0, lsl #0x14
    add r0, r5, r3
    str r0, [r6, #0x8c]
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r6, #0x90]
    orr r1, r1, r0, lsl #0x14
    add r3, r2, r1
    add r0, r6, #0x8c
    add r1, r6, #0x90
    mov r2, #0x6000
    str r3, [r6, #0x90]
    bl func_0204cff4
.L_0203ed30:
    ldrb r0, [r6, #0x268]
    sub r0, r0, #0x1
    strb r0, [r6, #0x268]
    tst r0, #0xff
    bne .L_0203ed5c
    mov r1, #0x0
    mov r0, r6
    strb r1, [r6, #0x269]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x13c]
    blx r2
.L_0203ed5c:
    add r0, sp, #0x0
    bl func_02005058
.L_0203ed64:
    ldr r0, .L_0203ef2c
    ldr r2, [r6, #0x218]
    ldr r0, [r0, #0x60]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_0203ef5c
    bne .L_0203ed94
    ldr r1, [r6, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0203ed94:
    cmp r3, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x40]
    streq r0, [r6, #0x3c]
    moveq r0, #0x7
    streqh r0, [r6, #0xd6]
.L_0203edac:
    ldr r0, [r6, #0xd0]
    tst r0, #0x4
    bne .L_0203edc0
    mov r0, r6
    bl Actor_UpdateGroundContactProbe
.L_0203edc0:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r6
    bl Actor_UpdateAnimationState
    ldr r0, [r6, #0x260]
    tst r0, #0x40
    bne .L_0203ef14
    ldrb r0, [r6, #0x24c]
    cmp r0, #0x0
    beq .L_0203ee20
    ldr r0, [r6, #0x288]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203ee20
    add r0, r6, #0x284
    mov r1, #0x1
    bl AttachmentController_SetEnabled
.L_0203ee20:
    ldrb r0, [r6, #0x24c]
    cmp r0, r4
    beq .L_0203ef04
    cmp r0, #0xb
    mvn r4, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_0203eeb8
.L_0203ee3c: ; jump table
    b .L_0203eeb8 ; case 0
    b .L_0203ee6c ; case 1
    b .L_0203ee74 ; case 2
    b .L_0203ee7c ; case 3
    b .L_0203ee84 ; case 4
    b .L_0203eeb8 ; case 5
    b .L_0203ee8c ; case 6
    b .L_0203ee94 ; case 7
    b .L_0203ee9c ; case 8
    b .L_0203eeac ; case 9
    b .L_0203eea4 ; case 10
    b .L_0203eeb4 ; case 11
.L_0203ee6c:
    mov r4, #0x0
    b .L_0203eeb8
.L_0203ee74:
    mov r4, #0x1
    b .L_0203eeb8
.L_0203ee7c:
    mov r4, #0x18
    b .L_0203eeb8
.L_0203ee84:
    mov r4, #0x2
    b .L_0203eeb8
.L_0203ee8c:
    mov r4, #0xb
    b .L_0203eeb8
.L_0203ee94:
    mov r4, #0x4
    b .L_0203eeb8
.L_0203ee9c:
    mov r4, #0x17
    b .L_0203eeb8
.L_0203eea4:
    mov r4, #0x19
    b .L_0203eeb8
.L_0203eeac:
    mov r4, #0xd
    b .L_0203eeb8
.L_0203eeb4:
    mov r4, #0x1a
.L_0203eeb8:
    mvn r0, #0x0
    cmp r4, r0
    beq .L_0203eef8
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x92]
    cmp r0, #0x0
    beq .L_0203eedc
    add r0, r6, #0x284
    bl func_0204cf28
.L_0203eedc:
    add r0, r6, #0x284
    and r1, r4, #0xff
    bl func_0204ced8
    add r0, r6, #0x284
    mov r1, #0x1
    bl AttachmentController_SetEnabled
    b .L_0203ef04
.L_0203eef8:
    add r0, r6, #0x284
    mov r1, #0x0
    bl AttachmentController_SetEnabled
.L_0203ef04:
    add r0, r6, #0x284
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0203ef14:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_0203ef24:
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
.L_0203ef2c: .word data_020df9e8
.L_0203ef30: .word data_020dfb08
.L_0203ef34: .word data_021052fc
.L_0203ef38: .word data_020e6f94
.L_0203ef3c: .word data_020dfaf0
.L_0203ef40: .word data_020dfa40
.L_0203ef44: .word data_020dfb78
.L_0203ef48: .word data_020dfaf8
.L_0203ef4c: .word data_020e8380
.L_0203ef50: .word 0x333
.L_0203ef54: .word 0x11f
.L_0203ef58: .word data_020c9670
.L_0203ef5c: .word data_020dfa48
    .size ActorExtendedType2_UpdateFrame, . - ActorExtendedType2_UpdateFrame
