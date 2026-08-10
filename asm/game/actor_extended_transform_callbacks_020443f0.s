; Matching retail form; see src/game/actor_extended_transform_callbacks.c.
.text
.extern func_0200b2c0
.extern Actor_IsAtCachedTerrainHeight
.extern ActorExtendedType2_GetDescriptorValue2A
.extern ActorExtendedType2_ApplyMotionImpulseIfEnabled
.global func_020443f0
.type func_020443f0, @function
.global func_02044434
.type func_02044434, @function
.global func_020444b4
.type func_020444b4, @function
func_020443f0: ; 0x020443f0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r1, #0x0
    add r0, r6, #0x200
    mov r4, r2
    strh r1, [r0, #0x98]
    mov r2, r1
    mov r3, r1
    add r0, r6, #0x29c
    str r1, [r6, #0x44]
    bl func_0200b2c0
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorExtendedType2_ApplyMotionImpulseIfEnabled
    ldmia sp!, {r4, r5, r6, pc}

.size func_020443f0, . - func_020443f0
func_02044434: ; 0x02044434
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_02044478
    ldr r1, [r5, #0x0]
    ldr r2, [r4, #0x0]
    add r0, r6, #0x29c
    mov r3, #0x0
    bl func_0200b2c0
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2A
    mov r0, r0, lsl #0x4
    str r0, [r6, #0x44]
    ldmia sp!, {r4, r5, r6, pc}
.L_02044478:
    ldr r0, [r5, #0x0]
    ldr r2, [r6, #0x2a0]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, r2, lsr #0x1f
    mov r1, r1, asr #0x1
    add r0, r1, r0, asr #0x1
    str r0, [r5, #0x0]
    ldr r0, [r4, #0x0]
    ldr r2, [r6, #0x2a4]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, r2, lsr #0x1f
    mov r1, r1, asr #0x1
    add r0, r1, r0, asr #0x1
    str r0, [r4, #0x0]
    ldmia sp!, {r4, r5, r6, pc}

.size func_02044434, . - func_02044434
func_020444b4: ; 0x020444b4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_02044510
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x98]
    ldrsh r1, [r0, #0x9a]
    cmp r2, r1
    bge .L_02044510
    mov r1, #0x0
    add ip, r2, #0x1
    strh ip, [r0, #0x98]
    mov ip, #0x1
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x29c
    strh ip, [r4, #0xd6]
    bl func_0200b2c0
    mov r0, #0x0
    str r0, [r4, #0x44]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02044510:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_020444b4, . - func_020444b4
