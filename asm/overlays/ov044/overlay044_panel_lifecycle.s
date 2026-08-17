.text
.extern GraphicsSpriteGroup_Destroy
.extern func_020c0c24
.extern func_020927b8
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern func_ov044_0220baa0
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern func_ov044_0220bb48
.extern func_02073e48
.extern InventoryCell_Destroy

    .global func_ov044_0220b8e4
func_ov044_0220b8e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_0220b90c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220b90c:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_0220b928
    ldr r3, .L_0220b940
    mov r1, #0x20
    mov r2, #0x8
    bl func_020c0c24
.L_0220b928:
    add r0, r4, #0x14
    bl func_020927b8
    add r0, r4, #0x8
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220b940: .word InventoryCell_Destroy
.size func_ov044_0220b8e4, . - func_ov044_0220b8e4

    .global func_ov044_0220b944
func_ov044_0220b944:
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0x38]
    cmp lr, #0x0
    ldmeqia sp!, {r3, pc}
    ldr ip, [r0, #0x40]
    ldr r3, [r0, #0x3c]
    cmp ip, r3
    ldmgeia sp!, {r3, pc}
    add r3, lr, ip, lsl #0x5
    str r1, [r3, #0xc]
    ldr ip, [r0, #0x40]
    mov r1, #0x18
    mul r1, ip, r1
    ldr r3, [r0, #0x38]
    mov r1, r1, lsl #0x10
    add ip, r3, ip, lsl #0x5
    mov r3, #0x0
    str r3, [ip, #0x14]
    mov r1, r1, asr #0x10
    str r1, [ip, #0x18]
    ldr r3, [r0, #0x38]
    ldr r1, [r0, #0x40]
    add r1, r3, r1, lsl #0x5
    ldr ip, [r1, #0xc]
    cmp ip, #0x0
    ldrne r3, [ip, #0x20]
    movne r1, r2, lsl #0x10
    orrne r1, r3, r1, lsr #0x10
    strne r1, [ip, #0x20]
    ldr r1, [r0, #0x40]
    add r1, r1, #0x1
    str r1, [r0, #0x40]
    ldmia sp!, {r3, pc}
.size func_ov044_0220b944, . - func_ov044_0220b944

    .global func_ov044_0220b9c8
func_ov044_0220b9c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r3, #0x1
    str r3, [r4, #0x48]
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_0220b9fc
    ldr r2, [r4, #0x44]
    ldmib r2, {r0, r1}
    cmp r1, r0
    ldrlt r0, [r2, #0x50]
    strlt r3, [r0, #0x20]
    b .L_0220ba08
.L_0220b9fc:
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
.L_0220ba08:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldmia sp!, {r4, pc}
.size func_ov044_0220b9c8, . - func_ov044_0220b9c8

    .global func_ov044_0220ba18
func_ov044_0220ba18:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r4, pc}
.size func_ov044_0220ba18, . - func_ov044_0220ba18

    .global func_ov044_0220ba40
func_ov044_0220ba40:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x44]
    mov r0, #0x18
    ldr r2, [r1, #0xc]
    ldr r1, [r4, #0x4]
    mul r0, r2, r0
    rsb r0, r0, #0x20
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x44]
    ldr r5, [r0, #0xc]
    b .L_0220ba80
.L_0220ba70:
    mov r0, r4
    mov r1, r5
    bl func_ov044_0220baa0
    add r5, r5, #0x1
.L_0220ba80:
    ldr r0, [r4, #0x44]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble .L_0220ba70
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov044_0220ba40, . - func_ov044_0220ba40

    .global func_ov044_0220baa0
func_ov044_0220baa0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r6, r1
    mov r7, r0
    beq .L_0220bb40
    ldr r0, [r7, #0x40]
    cmp r6, r0
    bge .L_0220bb40
    ldr r0, [r7, #0x38]
    add r0, r0, r6, lsl #0x5
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    bne .L_0220bb40
    ldr r0, [r7, #0x4]
    add r1, r7, #0x8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r1, [r7, #0x38]
    mov r4, r0
    add r0, r1, r6, lsl #0x5
    str r4, [r0, #0x10]
    ldr r0, [r7, #0x38]
    mov r1, #0x1
    add r0, r0, r6, lsl #0x5
    sub r5, r6, #0x1
    bl func_ov044_0220bb48
    cmp r0, #0x0
    ldr r1, [r7, #0x38]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    add r0, r1, r6, lsl #0x5
    addeq r5, r5, #0x32
    ldr r2, [r0, #0x14]
    ldr r3, [r0, #0x18]
    mov r0, r4
    mov r1, r5
    bl func_02073e48
.L_0220bb40:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.size func_ov044_0220baa0, . - func_ov044_0220baa0

