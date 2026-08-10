; Matching retail form; see src/game/actor_collision_corner_response.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorCollision_TestPoint
.extern Actor_GetCollisionBounds
.extern Actor_GetCachedTerrainHeight
.global ActorCollision_ResolveCornerContacts
ActorCollision_ResolveCornerContacts: ; 0x0200a3b8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    ldr r6, [r10, #0x24]
    mov r0, r10
    cmp r6, #0x0
    mov r9, r1
    sublt r6, r6, #0xf000
    bl Actor_GetCollisionBounds
    ldrsb r1, [r0, #0x0]
    mov r0, r10
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x10]
    bl Actor_GetCollisionBounds
    ldrsb r1, [r0, #0x1]
    mov r0, r10
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x14]
    bl Actor_GetCollisionBounds
    ldrsb r1, [r0, #0x2]
    mov r0, r10
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x18]
    bl Actor_GetCollisionBounds
    ldrsb r3, [r0, #0x3]
    mov r7, #0x0
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x10]
    mov r2, r3, lsl #0xc
    sub r0, r1, r0
    add r4, r0, r0, lsr #0x1f
    ldr r0, [r10, #0x1c]
    str r2, [sp, #0x1c]
    ldr r1, [sp, #0x14]
    str r0, [sp, #0xc]
    add r2, r0, r4, asr #0x1
    rsb r0, r1, r3, lsl #0xc
    add r5, r0, r0, lsr #0x1f
    add r0, r2, #0xff
    add r0, r0, #0xf00
    mov r0, r0, asr #0x10
    ldr r11, [r10, #0x20]
    str r0, [sp, #0x4]
    ldr r0, L_0200a634
    add r1, r11, r5, asr #0x1
    add r0, r1, r0
    mov r0, r0, asr #0x10
    str r0, [sp, #0x8]
    mov r0, r10
    mov r8, r7
    bl Actor_GetCachedTerrainHeight
    ldr r1, [sp, #0xc]
    ldr r3, L_0200a638
    sub r2, r11, r5, asr #0x1
    sub r1, r1, r4, asr #0x1
    mov r4, r0, asr #0x10
    mov r0, r6, asr #0xf
    add r0, r6, r0, lsr #0x10
    add r2, r2, r3
    mov r6, r2, asr #0x10
    add r2, r3, #0x1000
    add r1, r1, r2
    mov r5, r0, asr #0x10
    mov r11, r1, asr #0x10
    mov r0, r9
    mov r1, r11
    mov r2, r6
    mov r3, r5
    str r4, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    subeq r7, r7, #0x33
    subeq r8, r8, #0x33
    ldr r1, [sp, #0x4]
    subeq r7, r7, #0x1300
    mov r0, r9
    mov r2, r6
    mov r3, r5
    subeq r8, r8, #0x1300
    str r4, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    addeq r0, r7, #0x33
    subeq r8, r8, #0x33
    addeq r7, r0, #0x1300
    ldr r2, [sp, #0x8]
    mov r0, r9
    mov r1, r11
    mov r3, r5
    subeq r8, r8, #0x1300
    str r4, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    subeq r7, r7, #0x33
    addeq r0, r8, #0x33
    subeq r7, r7, #0x1300
    addeq r8, r0, #0x1300
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x8]
    mov r0, r9
    mov r3, r5
    str r4, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    addeq r0, r7, #0x33
    addeq r1, r8, #0x33
    addeq r7, r0, #0x1300
    addeq r8, r1, #0x1300
    cmp r7, #0x0
    cmpeq r8, #0x0
    beq L_0200a5ec
    cmp r7, #0x0
    ble L_0200a588
    ldr r0, [r10, #0x3c]
    cmp r0, #0x0
    ble L_0200a59c
L_0200a588:
    cmp r7, #0x0
    bge L_0200a5b0
    ldr r0, [r10, #0x3c]
    cmp r0, #0x0
    blt L_0200a5b0
L_0200a59c:
    ldr r1, [r10, #0x9c]
    mov r0, #0x0
    add r1, r1, r7
    str r1, [r10, #0x9c]
    str r0, [r10, #0x8c]
L_0200a5b0:
    cmp r8, #0x0
    ble L_0200a5c4
    ldr r0, [r10, #0x40]
    cmp r0, #0x0
    ble L_0200a5d8
L_0200a5c4:
    cmp r8, #0x0
    bge L_0200a5ec
    ldr r0, [r10, #0x40]
    cmp r0, #0x0
    blt L_0200a5ec
L_0200a5d8:
    ldr r1, [r10, #0xa0]
    mov r0, #0x0
    add r1, r1, r8
    str r1, [r10, #0xa0]
    str r0, [r10, #0x90]
L_0200a5ec:
    cmp r7, #0x0
    ldrgtb r0, [r10, #0x4b]
    orrgt r0, r0, #0x1
    strgtb r0, [r10, #0x4b]
    bgt L_0200a60c
    ldrltb r0, [r10, #0x4b]
    orrlt r0, r0, #0x2
    strltb r0, [r10, #0x4b]
L_0200a60c:
    cmp r8, #0x0
    ldrgtb r0, [r10, #0x4b]
    orrgt r0, r0, #0x4
    strgtb r0, [r10, #0x4b]
    bgt L_0200a62c
    ldrltb r0, [r10, #0x4b]
    orrlt r0, r0, #0x8
    strltb r0, [r10, #0x4b]
L_0200a62c:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_0200a634: .word 0xfffff001
L_0200a638: .word 0xffffe001
    .size ActorCollision_ResolveCornerContacts, .-ActorCollision_ResolveCornerContacts
