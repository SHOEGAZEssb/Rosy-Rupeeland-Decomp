; Matching retail form; see src/game/type7_actor_random_motion.c.
.text
.extern data_020c9670
.extern VecFx32Object_Assign
.extern Actor_GetCachedTerrainHeight
.extern Type7Actor_UpdateMotionTowardTransform
.extern Type7Actor_ResetInteractionState
.extern Type7Actor_TryCancelDistantTarget
.extern Type7Actor_TryInstallGlobalTargetCallback
.extern Type7Actor_TryAcquireTarget
.extern func_020ada8c
.extern genrand_int32
.global Type7Actor_UpdateRandomMotionState
.type Type7Actor_UpdateRandomMotionState, @function

Type7Actor_UpdateRandomMotionState: ; 0x02048fe4
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    add r0, r4, #0x200
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    ldr r1, [r4, #0xd0]
    bic r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldrsh r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_0204909c
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl VecFx32Object_Assign
    bl genrand_int32
    ldr r1, [r4, #0x29c]
    mov r0, r0, lsl #0x10
    ldrb r1, [r1, #0x54]
    mov r5, r0, lsr #0x10
    cmp r1, #0x2
    movne r6, #0x18
    moveq r6, #0x80
    bl genrand_int32
    mov r1, r6
    bic r0, r0, #0x80000000
    bl func_020ada8c
    mov r1, r5, asr #0x4
    mov ip, r1, lsl #0x1
    add r1, ip, #0x1
    mov r2, r1, lsl #0x1
    ldr r3, .L_02049144
    mov r1, ip, lsl #0x1
    ldrsh r2, [r3, r2]
    ldr ip, [r4, #0x7c]
    ldrsh r1, [r3, r1]
    mla r2, r0, r2, ip
    str r2, [r4, #0x7c]
    ldr r2, [r4, #0x80]
    mla r1, r0, r1, r2
    mov r0, r4
    str r1, [r4, #0x80]
    bl Actor_GetCachedTerrainHeight
    str r0, [r4, #0x84]
    mov r0, #0x0
    str r0, [r4, #0x210]
.L_0204909c:
    mov r0, r4
    bl Type7Actor_TryInstallGlobalTargetCallback
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl Type7Actor_TryCancelDistantTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, #0x1
    bl Type7Actor_TryAcquireTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x64]
    cmp r0, #0x0
    ble .L_020490fc
    add r0, r4, #0x78
    add r1, r4, #0x18
    bl VecFx32Object_Assign
    b .L_02049114
.L_020490fc:
    ldr r0, [r4, #0x268]
    tst r0, #0x4
    beq .L_02049114
    add r0, r4, #0x78
    add r1, r4, #0x224
    bl VecFx32Object_Assign
.L_02049114:
    mov r0, r4
    add r1, r4, #0x78
    bl Type7Actor_UpdateMotionTowardTransform
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_0204913c
    mov r0, r4
    bl Type7Actor_ResetInteractionState
.L_0204913c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02049144: .word data_020c9670

.size Type7Actor_UpdateRandomMotionState, . - Type7Actor_UpdateRandomMotionState

