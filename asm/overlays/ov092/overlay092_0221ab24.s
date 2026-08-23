.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern ActorModeNibble_HandleContactFromField1FC
.extern Fx32Vector2_Magnitude
.extern TrackedResourceActor_EmitRecordEffects
.extern TrackedResourceActor_DispatchTargetInteraction
.extern func_020adc90
.extern func_ov092_02217930
.extern func_ov092_0221ad28

.global func_ov092_0221ab24
func_ov092_0221ab24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    movs r8, r1
    mov r9, r0
    beq .L_0221acbc
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0221ab78
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0221ab78
    cmp r0, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_0221abc8
.L_0221ab78:
    add r0, sp, #0x0
    add r1, r9, #0x38
    bl VecFx32Object_InitCopy
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r1, [r9, #0x1fc]
    add r0, sp, #0x0
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl func_ov092_0221ad28
    mov r0, r8
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    add r0, sp, #0x0
    mov r5, #0x4000
    bl VecFx32Object_Destroy
    b .L_0221ac38
.L_0221abc8:
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221ac38
    ldrh r0, [r8, #0x4e]
    cmp r0, #0x13
    cmpne r0, #0x10
    bne .L_0221ac38
    add r0, r9, #0x88
    bl VecFx32Object_GetMagnitude
    cmp r0, #0x2000
    ble .L_0221ac34
    ldrsh r0, [r8, #0xd6]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0221ac34
    mov r0, r8
    mov r1, r9
    mov r2, #0x0
    bl ActorModeNibble_HandleContactFromField1FC
    mov r0, #0x3000
    str r0, [r8, #0x44]
    mov r0, #0x1
    str r0, [r8, #0x104]
.L_0221ac34:
    mov r5, #0x2000
.L_0221ac38:
    ldr r1, [r8, #0x1c]
    ldr r0, [r9, #0x1c]
    ldr r2, [r8, #0x20]
    sub r0, r1, r0
    ldr r1, [r9, #0x20]
    add r0, r0, r0, lsr #0x1f
    mov r6, r0, asr #0x1
    sub r7, r2, r1
    mov r0, r6
    mov r1, r7
    bl Fx32Vector2_Magnitude
    mov r4, r0
    cmp r4, #0x1000
    ble .L_0221aca4
    mov r0, r6
    mov r1, r4
    bl func_020adc90
    mvn r1, #0x0
    mul r6, r0, r1
    mov r0, r7
    mov r1, r4
    bl func_020adc90
    mvn r1, #0x0
    mul r1, r0, r1
    str r6, [r9, #0x8c]
    str r1, [r9, #0x90]
    b .L_0221acd4
.L_0221aca4:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r9, #0x88
    bl func_ov092_02217930
    b .L_0221acd4
.L_0221acbc:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r9, #0x88
    bl func_ov092_02217930
    mov r5, #0x1000
.L_0221acd4:
    add r1, r9, #0x100
    mov r2, #0x0
    mov r0, r9
    strh r2, [r1, #0xf8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    mov r1, #0x0
    mov r2, r1
    mov r3, r5
    add r0, r9, #0x38
    bl func_ov092_02217930
    mov r1, #0x1
    mov r0, r9
    strh r1, [r9, #0xd6]
    bl TrackedResourceActor_EmitRecordEffects
    mov r0, r9
    mov r1, r8
    bl TrackedResourceActor_DispatchTargetInteraction
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov092_0221ab24, . - func_ov092_0221ab24
