.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern gActorRuntimeCollection
.extern VecFx32Object_Destroy
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern func_0201e0ec
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollection
.extern func_020349b8
.extern Fx32Vector2_Magnitude
.extern TrackedResourceActor_DispatchTargetInteraction
.extern EffectManager_SubmitPointEffect
.extern func_020adc90
.extern func_ov095_02217d58
.extern func_ov095_0221a208

.global func_ov095_0221c4a4
func_ov095_0221c4a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x24
    mov r6, r0
    ldr r0, .L_0221c688
    mov r5, r1
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0221c654
    cmp r5, #0x0
    beq .L_0221c654
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0221c648
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r4, r3, r2
    sub r8, r1, r0
    mov r0, r4
    mov r1, r8
    bl Fx32Vector2_Magnitude
    mov r7, r0
    cmp r7, #0x1000
    ble .L_0221c5bc
    mov r0, r4
    mov r1, r7
    bl func_020adc90
    mov r4, r0
    mov r0, r8
    mov r1, r7
    bl func_020adc90
    ldrb r1, [r5, #0x4d]
    cmp r1, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_0221c58c
    ldr r2, [r6, #0x8c]
    add r1, r4, r4, lsl #0x1
    sub r1, r2, r1
    str r1, [r6, #0x8c]
    ldr r2, [r6, #0x90]
    add r1, r0, r0, lsl #0x1
    sub r1, r2, r1
    str r1, [r6, #0x90]
    ldr r2, [r5, #0x8c]
    mov r1, #0xa
    add r2, r2, r4, lsl #0x1
    str r2, [r5, #0x8c]
    ldr r2, [r5, #0x90]
    add r0, r2, r0, lsl #0x1
    str r0, [r5, #0x90]
    strb r1, [r6, #0x200]
    b .L_0221c5bc
.L_0221c58c:
    ldr r1, [r6, #0x8c]
    sub r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    sub r1, r1, r0
    str r1, [r6, #0x90]
    ldr r1, [r5, #0x8c]
    add r1, r1, r4
    str r1, [r5, #0x8c]
    ldr r1, [r5, #0x90]
    add r0, r1, r0
    str r0, [r5, #0x90]
.L_0221c5bc:
    add r0, sp, #0x4
    add r1, r6, #0x18
    add r2, r5, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0x14
    add r1, sp, #0x4
    mov r2, #0x2000
    bl func_ov095_0221a208
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    ldr r0, .L_0221c68c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r3, [sp, #0x20]
    ldr r2, [sp, #0x18]
    ldr r4, [sp, #0x1c]
    mov r3, r3, asr #0xc
    rsb r3, r3, r4, asr #0xc
    mov r2, r2, asr #0xc
    sub r3, r3, #0x1c
    bl EffectManager_SubmitPointEffect
    ldr r0, [r6, #0x1fc]
    ldrh r1, [r0, #0x1c]
    cmp r1, #0x0
    beq .L_0221c63c
    mov r0, r6
    mov r2, #0x0
    bl func_020349b8
.L_0221c63c:
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    b .L_0221c654
.L_0221c648:
    mov r0, r6
    mov r1, r5
    bl TrackedResourceActor_DispatchTargetInteraction
.L_0221c654:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    ldr r1, [r6, #0x14]
    mov r0, r6
    bic r1, r1, #0x800000
    str r1, [r6, #0x14]
    bl Actor_GetCollection
    mov r1, r6
    bl ActorCollection_QueueActorForRemoval
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0221c688: .word gActorRuntimeCollection
.L_0221c68c: .word data_021052fc
.size func_ov095_0221c4a4, . - func_ov095_0221c4a4
