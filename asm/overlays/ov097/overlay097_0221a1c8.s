.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_02105310
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollection
.extern func_02034a60
.extern func_02050260
.extern func_02050560
.extern func_ov097_02219228
.extern func_ov097_0221a004

.global func_ov097_0221a1c8
func_ov097_0221a1c8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, .L_0221a3ac
    mov r5, r1
    mov r4, #0x0
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0221a304
    cmp r5, #0x0
    beq .L_0221a304
    add r0, sp, #0x0
    add r1, r6, #0x38
    mov r4, #0x1
    bl VecFx32Object_InitCopy
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r1, [r6, #0x1fc]
    add r0, sp, #0x0
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl func_ov097_0221a004
    ldrb r2, [r5, #0x4d]
    mov r1, #0x0
    cmp r2, #0x1
    moveq r0, r4
    movne r0, r1
    cmp r0, #0x0
    ldr r0, [r6, #0x1fc]
    beq .L_0221a254
    ldrsh r0, [r0, #0xc]
    mov r4, #0x1
    cmp r0, #0x0
    movgt r1, #0x1
    b .L_0221a2d8
.L_0221a254:
    ldrsh r0, [r0, #0xe]
    cmp r0, #0x0
    movgt r1, #0x1
    cmp r2, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221a2d8
    ldr r0, [r6, #0x200]
    mov r4, #0x0
    cmp r0, #0x0
    bne .L_0221a2bc
    add r0, r5, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x1d
    moveq r0, #0x1
    movne r0, r4
    cmp r0, #0x0
    beq .L_0221a2bc
    mov r0, r5
    mov r1, r6
    bl func_ov097_02219228
    mov r0, #0x1
    str r0, [r6, #0x200]
    mov r1, #0x0
    b .L_0221a2d8
.L_0221a2bc:
    add r0, r5, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x1d
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    movne r4, #0x1
.L_0221a2d8:
    cmp r1, #0x0
    beq .L_0221a2f8
    mov r0, r5
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
.L_0221a2f8:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_0221a30c
.L_0221a304:
    cmp r5, #0x0
    moveq r4, #0x1
.L_0221a30c:
    cmp r4, #0x0
    beq .L_0221a380
    adds r0, r6, #0x38
    addne r0, r0, #0x4
    mov r4, #0x0
    str r4, [r0, #0x0]
    str r4, [r0, #0x4]
    str r4, [r0, #0x8]
    add r1, r6, #0x100
    ldrh r3, [r1, #0xf0]
    sub r0, r4, #0x8000
    ldr r2, .L_0221a3b0
    and r0, r3, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    ldr r3, [r6, #0x10]
    mov r0, r6
    orr r3, r3, #0x1f0000
    str r3, [r6, #0x10]
    strh r4, [r1, #0xf8]
    ldr r1, [r6, #0x14]
    and r1, r1, r2
    str r1, [r6, #0x14]
    bl Actor_GetCollection
    mov r1, r6
    bl ActorCollection_QueueActorForRemoval
    mov r0, r6
    bl func_02050260
    b .L_0221a398
.L_0221a380:
    cmp r5, #0x0
    beq .L_0221a398
    ldr r1, .L_0221a3b4
    mov r0, r6
    mov r2, #0x0
    bl func_02034a60
.L_0221a398:
    mov r0, r6
    mov r1, r5
    bl func_02050560
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0221a3ac: .word data_02105310
.L_0221a3b0: .word 0xff7fffbf
.L_0221a3b4: .word 0xf686
.size func_ov097_0221a1c8, . - func_ov097_0221a1c8
