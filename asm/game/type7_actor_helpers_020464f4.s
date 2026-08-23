; Matching retail form; see src/game/type7_actor_helpers.c.
.text
.extern data_020e16b0
.extern data_020e16d0
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorRuntimeTriple_Assign
.extern Actor_UpdatePresentation
.extern Actor_RefreshTerrainHeight
.extern Actor_ApplyMotionImpulse
.extern ActorVector_DivideByScalar
.extern AuxiliaryInteraction_UpdateResourceFrame
.global Type7Actor_ResetBaseTransformAndMotion
.type Type7Actor_ResetBaseTransformAndMotion, @function
.global Type7Actor_ForwardHelperEvent
.type Type7Actor_ForwardHelperEvent, @function
.global Type7Actor_ApplyCallbackAdjustedMotionImpulse
.type Type7Actor_ApplyCallbackAdjustedMotionImpulse, @function
Type7Actor_ResetBaseTransformAndMotion: ; 0x020464f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x18
    add r1, r4, #0x214
    bl VecFx32Object_Assign
    mov r0, r4
    bl Actor_RefreshTerrainHeight
    mov r1, #0x0
    ldr r0, [r4, #0x1dc]
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x24]
    add r0, r4, #0x38
    bl ActorRuntimeTriple_Assign
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl ActorRuntimeTriple_Assign
    ldmia sp!, {r4, pc}

.size Type7Actor_ResetBaseTransformAndMotion, . - Type7Actor_ResetBaseTransformAndMotion
Type7Actor_ForwardHelperEvent: ; 0x02046544
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r4, r2
    bl Actor_UpdatePresentation
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldrsh r2, [r5, #0x6a]
    ldr r3, [sp, #0x8]
    ldr r1, .L_020465b4
    add r0, r5, #0x2a8
    smlabb r1, r2, r1, r3
    str r1, [sp, #0x8]
    ldr ip, [r0, #0x0]
    add r2, sp, #0x0
    ldr ip, [ip, #0xc]
    mov r1, r4
    mov r3, #0x0
    blx ip
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    beq .L_020465a4
    bl AuxiliaryInteraction_UpdateResourceFrame
.L_020465a4:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_020465b4: .word 0xb33

.size Type7Actor_ForwardHelperEvent, . - Type7Actor_ForwardHelperEvent
Type7Actor_ApplyCallbackAdjustedMotionImpulse: ; 0x020465b8
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    cmp r2, #0x0
    beq .L_020465dc
    ldr r0, [r4, #0x29c]
    ldrh r0, [r0, #0x40]
    cmp r0, #0x0
    beq .L_02046650
.L_020465dc:
    ldr r0, .L_02046658
    ldr ip, [r4, #0x208]
    ldr r0, [r0, #0x20]
    mov lr, #0x1
    cmp ip, r0
    ldr r0, .L_0204665c
    bne .L_0204660c
    ldr r3, [r4, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r3, r0
    cmpne ip, #0x0
    moveq lr, #0x0
.L_0204660c:
    cmp lr, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0204662c
    mov r0, r4
    bl Actor_ApplyMotionImpulse
    b .L_02046650
.L_0204662c:
    add r0, sp, #0x0
    mov r2, #0x2000
    bl ActorVector_DivideByScalar
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x0
    bl Actor_ApplyMotionImpulse
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02046650:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02046658: .word data_020e16b0
.L_0204665c: .word data_020e16d0
.size Type7Actor_ApplyCallbackAdjustedMotionImpulse, . - Type7Actor_ApplyCallbackAdjustedMotionImpulse
