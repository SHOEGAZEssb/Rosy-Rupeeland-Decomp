.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern gFx32CosSinTable
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Fx32Vector2_Magnitude
.extern TrackedResourceActorType21_Update
.extern func_020adae4
.extern func_020ae024
.extern func_ov092_0221ada4
.extern gSystemState

.global func_ov092_0221a908
func_ov092_0221a908:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r1, [r4, #0x20c]
    cmp r1, #0x0
    ble .L_0221a930
    subs r1, r1, #0x1
    str r1, [r4, #0x20c]
    bne .L_0221a930
    bl func_ov092_0221ada4
.L_0221a930:
    ldr r0, [r4, #0x210]
    cmp r0, #0x0
    ble .L_0221aaa4
    sub r0, r0, #0x1
    str r0, [r4, #0x210]
    ldr r0, [r4, #0xd0]
    tst r0, #0x10
    ldreq r1, [r4, #0x24]
    ldreq r0, [r4, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0221aaa4
    ldr r0, .L_0221ab1c
    ldrh r6, [r0, #0x1a]
    tst r6, #0xf0
    beq .L_0221aaa4
    add r0, sp, #0x10
    add r1, r4, #0x88
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x14]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    cmp r1, #0x0
    ldreq r0, [sp, #0x18]
    cmpeq r0, #0x0
    beq .L_0221aa9c
    ldr r0, [sp, #0x18]
    bl func_020ae024
    mov r5, r0
    add r0, sp, #0x0
    bl VecFx32Object_Init
    tst r6, #0x20
    movne r0, #0x1000
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x4]
    bne .L_0221a9d4
    tst r6, #0x10
    movne r0, #0x1000
    strne r0, [sp, #0x4]
.L_0221a9d4:
    tst r6, #0x40
    movne r0, #0x1000
    rsbne r0, r0, #0x0
    strne r0, [sp, #0x8]
    bne .L_0221a9f4
    tst r6, #0x80
    movne r0, #0x1000
    strne r0, [sp, #0x8]
.L_0221a9f4:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    cmp r5, r0
    addlt r5, r5, #0x10000
    sub r0, r5, r0
    cmp r0, #0x4000
    sublt r5, r5, #0x180
    blt .L_0221aa30
    cmp r0, #0x8000
    sublt r5, r5, #0x200
    blt .L_0221aa30
    cmp r0, #0xc000
    addlt r5, r5, #0x200
    addge r5, r5, #0x180
.L_0221aa30:
    mov r2, r5, lsl #0x10
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    mov r5, r2, lsr #0x10
    bl Fx32Vector2_Magnitude
    mov r1, r5, asr #0x4
    mov ip, r1, lsl #0x1
    add r1, ip, #0x1
    mov r2, r1, lsl #0x1
    ldr r3, .L_0221ab20
    mov r1, ip, lsl #0x1
    ldrsh r2, [r3, r2]
    ldrsh r1, [r3, r1]
    smull ip, r3, r2, r0
    smull r2, r0, r1, r0
    adds ip, ip, #0x800
    adc r1, r3, #0x0
    adds r2, r2, #0x800
    mov r3, ip, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    adc r1, r0, #0x0
    mov r2, r2, lsr #0xc
    add r0, sp, #0x0
    str r3, [r4, #0x8c]
    orr r2, r2, r1, lsl #0x14
    str r2, [r4, #0x90]
    bl VecFx32Object_Destroy
.L_0221aa9c:
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_0221aaa4:
    mov r0, r4
    bl TrackedResourceActorType21_Update
    ldr r0, [r4, #0x24]
    mov r5, #0x100
    cmp r0, #0x30000
    ble .L_0221aadc
    sub r0, r0, #0x30000
    mov r1, #0x60
    bl func_020adae4
    add r0, r5, r0, asr #0x4
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
    cmp r5, #0x200
    movgt r5, #0x200
.L_0221aadc:
    ldr r0, [r4, #0x54]
    strh r5, [r0, #0x32]
    strh r5, [r0, #0x34]
    ldr r1, [r4, #0x3c]
    ldr r0, [r4, #0x8c]
    ldr r3, [r4, #0x40]
    ldr r2, [r4, #0x90]
    add r1, r1, r0
    add r0, r3, r2
    rsb r1, r1, #0x0
    bl func_020ae024
    ldr r1, [r4, #0x54]
    add r0, r0, #0xc000
    strh r0, [r1, #0x30]
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_0221ab1c: .word gSystemState
.L_0221ab20: .word gFx32CosSinTable
.size func_ov092_0221a908, . - func_ov092_0221a908
