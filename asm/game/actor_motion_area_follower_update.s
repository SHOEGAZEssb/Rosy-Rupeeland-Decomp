; Matching retail form; see src/game/actor_motion_area_follower_update.c for
; the documented portable implementation and recovered behavior.
.text
.extern GameWork_TestFlag
.extern gGamePhaseRuntime
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorMotionState_BuildOscillationOffset
.extern ActorMotionJitter_Update
.extern ActorMotionAreaFollower_QueryCrossingDirection
.extern ActorMotionAreaFollower_ClampToAreaBounds
.extern GamePhaseRegionTable_FindContainingRegion
.extern GamePhaseRegionTable_GetRegion
.extern Type7Actor_GetStateCode
.extern VecFx32Object_InitPlanarProjection
.extern func_020adcac
.extern gGameWork
.global ActorMotionAreaFollower_Update
ActorMotionAreaFollower_Update: ; 0x02009d80
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x50
    mov r4, r0
    ldr r7, [r4, #0x4]
    mov r9, r1
    add r0, sp, #0x40
    add r1, r7, #0x18
    bl VecFx32Object_InitPlanarProjection
    ldr r0, [sp, #0x48]
    ldr r1, [sp, #0x44]
    mov r2, r0, asr #0xc
    ldr r0, [r4, #0x68]
    mov r1, r1, asr #0xc
    sub r2, r2, #0x10
    bl GamePhaseRegionTable_FindContainingRegion
    ldr r1, L_0200a108
    mov r5, r0
    ldr r0, [r1, #0x0]
    ldr r1, L_0200a10c
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_02009eec
    cmp r5, #0x0
    blt L_02009eec
    mov r0, r4
    mov r1, r7
    mov r2, r5
    bl ActorMotionAreaFollower_QueryCrossingDirection
    mov r6, r0
    ldr r0, [r4, #0x68]
    mov r1, r5
    bl GamePhaseRegionTable_GetRegion
    mov r1, r0
    mov r0, r4
    bl ActorMotionJitter_Update
    mov r0, r4
    mov r1, r5
    mov r2, r9
    bl ActorMotionAreaFollower_ClampToAreaBounds
    ldr r1, [r4, #0x84]
    mvn r0, #0x0
    cmp r1, r0
    cmpne r1, r5
    beq L_02009ee4
    mov r0, #0x29
    str r0, [r4, #0x80]
    mov r1, #0x1
    str r1, [r4, #0x7c]
    ldrb r0, [r7, #0x4d]
    cmp r0, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    ldrne r0, L_0200a110
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r8, [r0, #0xea8]
    cmpne r8, #0x0
    beq L_02009ee4
    mov r0, r8
    bl Type7Actor_GetStateCode
    cmp r0, #0x3
    bne L_02009ee4
    add r0, sp, #0x30
    add r1, r7, #0x18
    bl VecFx32Object_InitCopy
    cmp r6, #0x1
    ldreq r0, [sp, #0x34]
    subeq r0, r0, #0x14000
    streq r0, [sp, #0x34]
    beq L_02009ed0
    cmp r6, #0x2
    ldreq r0, [sp, #0x34]
    addeq r0, r0, #0x14000
    streq r0, [sp, #0x34]
    beq L_02009ed0
    cmp r6, #0x3
    ldreq r0, [sp, #0x38]
    subeq r0, r0, #0x14000
    streq r0, [sp, #0x38]
    beq L_02009ed0
    cmp r6, #0x4
    ldreq r0, [sp, #0x38]
    addeq r0, r0, #0x14000
    streq r0, [sp, #0x38]
L_02009ed0:
    add r1, sp, #0x30
    add r0, r8, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
L_02009ee4:
    str r5, [r4, #0x84]
    b L_02009ef8
L_02009eec:
    mov r0, r4
    mov r1, r9
    bl ActorMotionJitter_Update
L_02009ef8:
    add r0, sp, #0x20
    add r1, r4, #0x8
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x24]
    ldrsh r1, [r9, #0x0]
    mov r2, r0, asr #0xc
    cmp r1, r0, asr #0xc
    movgt r0, r1, lsl #0xc
    strgt r0, [sp, #0x24]
    bgt L_02009f38
    ldrsh r1, [r9, #0x4]
    add r0, r2, #0x100
    cmp r0, r1
    subgt r0, r1, #0x100
    movgt r0, r0, lsl #0xc
    strgt r0, [sp, #0x24]
L_02009f38:
    ldrsh r1, [r9, #0x2]
    ldr r0, [sp, #0x28]
    cmp r1, r0, asr #0xc
    mov r0, r0, asr #0xc
    movgt r0, r1, lsl #0xc
    strgt r0, [sp, #0x28]
    bgt L_02009f6c
    ldrsh r1, [r9, #0x6]
    add r0, r0, #0xc0
    cmp r0, r1
    subgt r0, r1, #0xc0
    movgt r0, r0, lsl #0xc
    strgt r0, [sp, #0x28]
L_02009f6c:
    ldr r0, [r4, #0x7c]
    cmp r0, #0x0
    beq L_0200a064
    ldr r1, [r4, #0x80]
    ldr r3, [r4, #0x70]
    rsb r0, r1, #0x1000
    smull r5, r6, r3, r0
    adds r7, r5, #0x800
    ldr r2, [sp, #0x24]
    adc r6, r6, #0x0
    smull r5, r3, r2, r1
    adds r5, r5, #0x800
    mov r7, r7, lsr #0xc
    adc r2, r3, #0x0
    mov r3, r5, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    add r2, r7, r3
    str r2, [r4, #0x70]
    ldr r3, [r4, #0x74]
    ldr r2, [sp, #0x28]
    smull r5, r6, r3, r0
    adds r7, r5, #0x800
    smull r5, r3, r2, r1
    adc r6, r6, #0x0
    adds r5, r5, #0x800
    mov r7, r7, lsr #0xc
    adc r2, r3, #0x0
    mov r3, r5, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    add r2, r7, r3
    str r2, [r4, #0x74]
    ldr r3, [r4, #0x78]
    ldr r2, [sp, #0x2c]
    smull r0, r5, r3, r0
    adds r3, r0, #0x800
    smull r1, r0, r2, r1
    adc r2, r5, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [r4, #0x78]
    ldr r0, [r4, #0x80]
    add r1, sp, #0x20
    add r0, r0, #0xc
    str r0, [r4, #0x80]
    cmp r0, #0x200
    movgt r0, #0x200
    strgt r0, [r4, #0x80]
    adds r0, r4, #0x6c
    addne r0, r0, #0x4
    add r1, r1, #0x4
    bl func_020adcac
    cmp r0, #0x1000
    movlt r0, #0x0
    strlt r0, [r4, #0x7c]
    b L_0200a070
L_0200a064:
    add r1, sp, #0x20
    add r0, r4, #0x6c
    bl VecFx32Object_Assign
L_0200a070:
    add r0, r4, #0x8
    add r1, r4, #0x6c
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    add r1, r4, #0x44
    bl ActorMotionState_BuildOscillationOffset
    ldr r0, L_0200a108
    ldr r3, [r4, #0xc]
    ldr r1, [r0, #0x0]
    ldr r2, [sp, #0x14]
    add r1, r1, #0x200
    add r0, r3, r2
    mov r2, r0, asr #0xc
    add r2, r2, #0x80
    add r0, sp, #0x10
    strh r2, [r1, #0x2e]
    bl VecFx32Object_Destroy
    add r0, sp, #0x0
    add r1, r4, #0x44
    bl ActorMotionState_BuildOscillationOffset
    ldr r0, L_0200a108
    ldr r3, [r4, #0x10]
    ldr r1, [r0, #0x0]
    ldr r2, [sp, #0x8]
    add r1, r1, #0x200
    add r0, r3, r2
    mov r2, r0, asr #0xc
    add r2, r2, #0x60
    add r0, sp, #0x0
    strh r2, [r1, #0x30]
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    mov r0, #0x0
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_0200a108: .word gGameWork
L_0200a10c: .word 0x404
L_0200a110: .word gGamePhaseRuntime
    .size ActorMotionAreaFollower_Update, .-ActorMotionAreaFollower_Update

