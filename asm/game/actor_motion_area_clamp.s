; Matching retail form; see src/game/actor_motion_area_clamp.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern S16Rectangle_Translate
.extern GamePhaseRegionTable_GetRegion
.extern Actor_GetCollisionBounds
.global ActorMotionAreaFollower_ClampToAreaBounds
ActorMotionAreaFollower_ClampToAreaBounds: ; 0x0200a1a0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x20
    mov r9, r0
    mov r8, r1
    add r0, sp, #0x10
    add r1, r9, #0x8
    bl func_02005030
    ldr r0, [r9, #0x4]
    ldr r1, [r0, #0x20]
    ldr r5, [r0, #0x24]
    ldr r2, [r0, #0x1c]
    mov r1, r1, asr #0xc
    mov r4, r5, asr #0xc
    mov r7, r2, asr #0xc
    sub r6, r1, #0x10
    bl Actor_GetCollisionBounds
    rsb r2, r4, #0x0
    mov r4, r0
    ldrsb r1, [r4, #0x0]
    mvn r0, #0x29
    sub r3, r0, r5, asr #0xc
    strh r1, [sp, #0x8]
    ldrsb r5, [r4, #0x2]
    add r0, sp, #0x8
    mov r1, r7
    strh r2, [sp, #0xe]
    strh r5, [sp, #0xc]
    strh r3, [sp, #0xa]
    mov r2, r6
    bl S16Rectangle_Translate
    ldrsb r3, [r4, #0x0]
    mov r1, r7
    mov r2, r6
    strh r3, [sp, #0x0]
    ldrsb r3, [r4, #0x1]
    add r0, sp, #0x0
    sub r3, r3, #0x8
    strh r3, [sp, #0x2]
    ldrsb r3, [r4, #0x2]
    strh r3, [sp, #0x4]
    ldrsb r3, [r4, #0x3]
    strh r3, [sp, #0x6]
    bl S16Rectangle_Translate
    ldr r0, [r9, #0x68]
    mov r1, r8
    bl GamePhaseRegionTable_GetRegion
    ldrsh r2, [r0, #0x0]
    ldr r1, [sp, #0x14]
    cmp r2, r1, asr #0xc
    mov r1, r1, asr #0xc
    movgt r1, r2, lsl #0xc
    strgt r1, [sp, #0x14]
    bgt L_0200a28c
    ldrsh r2, [r0, #0x4]
    add r1, r1, #0x100
    cmp r1, r2
    subge r1, r2, #0x100
    movge r1, r1, lsl #0xc
    strge r1, [sp, #0x14]
L_0200a28c:
    ldrsh r3, [r0, #0x2]
    ldr r1, [sp, #0x18]
    cmp r3, r1, asr #0xc
    movgt r0, r3, lsl #0xc
    mov r2, r1, asr #0xc
    strgt r0, [sp, #0x18]
    bgt L_0200a2c0
    ldrsh r1, [r0, #0x6]
    add r0, r2, #0xc0
    cmp r0, r1
    subge r0, r1, #0xc0
    movge r0, r0, lsl #0xc
    strge r0, [sp, #0x18]
L_0200a2c0:
    add r1, sp, #0x10
    add r0, r9, #0x8
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size ActorMotionAreaFollower_ClampToAreaBounds, .-ActorMotionAreaFollower_ClampToAreaBounds
