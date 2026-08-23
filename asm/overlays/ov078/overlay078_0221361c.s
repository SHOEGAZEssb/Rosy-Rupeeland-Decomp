.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern ActorContactState_AddContact
.extern Fx32Vector2_Magnitude
.extern func_020adc90
.extern func_ov078_02213838

.global func_ov078_0221361c
func_ov078_0221361c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x20
    mov r7, r0
    ldr r0, [r7, #0x260]
    mov r6, r1
    mov r5, r2
    tst r0, #0x8
    bne .L_0221366c
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221366c
    mov r0, r7
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0x1b4]
    blx r2
    b .L_0221381c
.L_0221366c:
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02213728
    mov r0, r6
    bl func_ov078_02213838
    cmp r0, #0x0
    beq .L_0221381c
    ldr r0, [r6, #0x2ac]
    cmp r0, #0x0
    bne .L_0221381c
    ldr r3, [r6, #0x1c]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r7, #0x20]
    sub r4, r3, r2
    sub r9, r1, r0
    mov r0, r4
    mov r1, r9
    bl Fx32Vector2_Magnitude
    mov r8, r0
    cmp r8, #0x1000
    ble .L_02213720
    mov r0, r4
    mov r1, r8
    bl func_020adc90
    mov r4, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    mov r2, r0
    add r0, sp, #0x10
    mov r1, r4
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x10
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_02213720:
    str r7, [r6, #0x2ac]
    b .L_0221381c
.L_02213728:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221381c
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1ac]
    blx r1
    cmp r0, #0x0
    bne .L_0221381c
    ldr r3, [r6, #0x1c]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r7, #0x20]
    sub r4, r3, r2
    sub r9, r1, r0
    mov r0, r4
    mov r1, r9
    bl Fx32Vector2_Magnitude
    mov r8, r0
    cmp r8, #0x1000
    ble .L_0221381c
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20c]
    blx r1
    mov r10, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    mov r9, r0
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20c]
    blx r1
    mov r1, r8
    mov r8, r0
    mov r0, r4
    bl func_020adc90
    smull r4, r1, r0, r8
    adds r4, r4, #0x800
    adc r0, r1, #0x0
    smull r3, r2, r9, r10
    mov r1, r4, lsr #0xc
    adds r3, r3, #0x800
    orr r1, r1, r0, lsl #0x14
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, sp, #0x0
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_0221381c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    str r6, [r7, #0x2ac]
    bl ActorContactState_AddContact
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.size func_ov078_0221361c, . - func_ov078_0221361c
