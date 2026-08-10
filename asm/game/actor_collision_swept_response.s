; Matching retail form; see src/game/actor_collision_swept_response.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorCollision_ScanDirectionalRange
.extern ActorCollision_ResolveRangeOverlap
.extern ActorBounds_GetWidth
.extern ActorBounds_GetHeight
.extern Actor_GetCollisionBounds
.extern Actor_GetCachedTerrainHeight
.global ActorCollision_ResolveSweptMovement
ActorCollision_ResolveSweptMovement:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x48
    mov r10, r0
    ldr r4, [r10, #0x24]
    ldr r6, [r10, #0x1c]
    ldr r5, [r10, #0x2c]
    ldr r3, [r10, #0x20]
    ldr r2, [r10, #0x30]
    mov r11, r1
    mov r4, r4, asr #0x10
    sub r5, r6, r5
    sub r6, r3, r2
    bl Actor_GetCollisionBounds
    bl ActorBounds_GetWidth
    mov r7, r0, lsl #0xc
    mov r0, r10
    bl Actor_GetCollisionBounds
    bl ActorBounds_GetHeight
    mov r8, r0, lsl #0xc
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    cmp r6, #0x0
    mov r9, r0, asr #0x10
    beq L_0200acfc
    ldr r1, [r10, #0x2c]
    add r0, r7, r7, lsr #0x1f
    sub r1, r1, r0, asr #0x1
    add r0, r1, r7
    str r1, [sp, #0x28]
    str r0, [sp, #0x30]
    ldr r1, [r10, #0x30]
    add r0, r8, r8, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r1, r6, r0
    add r0, r1, r8
    str r1, [sp, #0x2c]
    str r0, [sp, #0x34]
    cmp r6, #0x0
    bge L_0200accc
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r1, r11
    mov r3, #0x4
    stmia sp, {r4, r9}
    bl ActorCollision_ScanDirectionalRange
    b L_0200ace8
L_0200accc:
    ble L_0200ace8
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r1, r11
    mov r3, #0x8
    stmia sp, {r4, r9}
    bl ActorCollision_ScanDirectionalRange
L_0200ace8:
    add r3, sp, #0x38
    mov r0, r10
    mov r2, r6
    mov r1, #0x0
    bl ActorCollision_ResolveRangeOverlap
L_0200acfc:
    cmp r5, #0x0
    beq L_0200ad88
    ldr r1, [r10, #0x2c]
    add r0, r7, r7, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    add r1, r5, r0
    add r0, r1, r7
    str r0, [sp, #0x10]
    str r1, [sp, #0x8]
    ldr r1, [r10, #0x30]
    add r0, r8, r8, lsr #0x1f
    sub r1, r1, r0, asr #0x1
    add r0, r1, r8
    str r1, [sp, #0xc]
    str r0, [sp, #0x14]
    ble L_0200ad58
    add r0, sp, #0x18
    add r2, sp, #0x8
    mov r1, r11
    mov r3, #0x2
    stmia sp, {r4, r9}
    bl ActorCollision_ScanDirectionalRange
    b L_0200ad74
L_0200ad58:
    bge L_0200ad74
    add r0, sp, #0x18
    add r2, sp, #0x8
    mov r1, r11
    mov r3, #0x1
    stmia sp, {r4, r9}
    bl ActorCollision_ScanDirectionalRange
L_0200ad74:
    add r3, sp, #0x18
    mov r0, r10
    mov r1, r5
    mov r2, #0x0
    bl ActorCollision_ResolveRangeOverlap
L_0200ad88:
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size ActorCollision_ResolveSweptMovement, . - ActorCollision_ResolveSweptMovement
