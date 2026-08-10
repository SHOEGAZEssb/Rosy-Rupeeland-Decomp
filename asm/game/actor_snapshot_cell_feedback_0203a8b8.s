; Matching retail form; see src/game/actor_snapshot_cell_feedback.c.
.text
.extern Heap_Alloc
.extern TouchPanelManager_GetPoint
.extern data_020df4f0
.extern data_021052fc
.extern data_021056e4
.extern func_0200500c
.extern func_02005058
.extern func_0201ded4
.extern func_0201f378
.extern Position_AdjustForTerrainHeight
.extern ActorFeedbackResources_GetResource
.extern func_020593ac
.extern gHeapContext
.extern gSoundContext
.extern gTouchPanelManager
.extern genrand_int32
    .global ActorFeedback_ProcessSnapshotCell
ActorFeedback_ProcessSnapshotCell: ; 0x0203a8b8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x38
    ldmib r0, {r1, r2}
    add r0, sp, #0x1c
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl func_0200500c
    add r0, sp, #0x1c
    bl Position_AdjustForTerrainHeight
    ldr r0, .L_0203aaac
    ldr r1, [sp, #0x20]
    ldr r0, [r0, #0x0]
    ldr r2, [sp, #0x24]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r1, r1, asr #0x10
    ldr r3, [r0, #0x0]
    mov r2, r2, asr #0x10
    ldr r3, [r3, #0x2c]
    blx r3
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    cmp r1, #0x1
    beq .L_0203a934
    add r0, sp, #0x1c
    bl func_02005058
    mov r0, #0x0
    b .L_0203aaa4
.L_0203a934:
    bl genrand_int32
    tst r0, #0x3
    movne r3, #0x0
    ldr r1, .L_0203aab0
    and r2, r0, #0x1
    ldr r0, [r1, #0x4]
    moveq r3, #0x2
    ldrh r5, [r0, #0x6]
    add r1, r2, r3
    and r4, r1, #0xff
    cmp r5, #0x0
    beq .L_0203a9f8
    ldr r1, .L_0203aab4
    add r0, sp, #0x2c
    ldr r1, [r1, #0x0]
    bl TouchPanelManager_GetPoint
    ldr r0, .L_0203aaac
    ldr ip, [sp, #0x30]
    ldr r0, [r0, #0x0]
    ldr r1, [sp, #0x24]
    add r0, r0, #0x2000
    ldr r3, [r0, #0xea4]
    mov r0, r1, asr #0xc
    ldr r1, [r3, #0x20]
    ldr r2, [sp, #0x20]
    rsb r1, r0, r1, asr #0xc
    mul r0, r1, r1
    ldr r3, [r3, #0x1c]
    mov r1, r2, asr #0xc
    rsb r1, r1, r3, asr #0xc
    mla r2, r1, r1, r0
    cmp r2, #0x4000
    sub ip, ip, #0x80
    movgt r3, #0x0
    bgt .L_0203a9d8
    mov r0, #0x78
    mul r1, r2, r0
    mov r0, r1, asr #0xd
    add r0, r1, r0, lsr #0x12
    mov r0, r0, asr #0xe
    rsb r3, r0, #0x78
.L_0203a9d8:
    str ip, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_0203aab8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r5, asr #0x7
    and r2, r5, #0x7f
    bl func_020593ac
.L_0203a9f8:
    mov r0, #0x1
    bl ActorFeedbackResources_GetResource
    movs r5, r0
    bne .L_0203aa18
    add r0, sp, #0x1c
    bl func_02005058
    mov r0, #0x1
    b .L_0203aaa4
.L_0203aa18:
    ldr r1, .L_0203aabc
    ldr r3, .L_0203aac0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0203aa84
    ldr r1, [r5, #0x4]
    mov r3, #0x0
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x8]
    sub r2, r3, #0x1
    str r1, [sp, #0x4]
    ldr r5, [r5, #0xc]
    ldr r1, .L_0203aaac
    str r5, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r2, [r1, #0x0]
    add r1, sp, #0x1c
    add r2, r2, #0x2000
    ldr r3, [r2, #0xea4]
    mov r2, r4
    ldr r3, [r3, #0x54]
    ldr r3, [r3, #0x0]
    bl func_0201f378
    mov r1, r0
.L_0203aa84:
    ldr r0, .L_0203aaac
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    add r0, sp, #0x1c
    bl func_02005058
    mov r0, #0x1
.L_0203aaa4:
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, pc}
.L_0203aaac: .word data_021052fc
.L_0203aab0: .word data_021056e4
.L_0203aab4: .word gTouchPanelManager
.L_0203aab8: .word gSoundContext
.L_0203aabc: .word data_020df4f0
.L_0203aac0: .word gHeapContext

    .global ActorInteractionRuntime_Init

    .size ActorFeedback_ProcessSnapshotCell, . - ActorFeedback_ProcessSnapshotCell
