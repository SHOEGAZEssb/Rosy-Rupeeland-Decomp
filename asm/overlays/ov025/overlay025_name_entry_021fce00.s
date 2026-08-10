.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov025_02202f40
.extern data_ov025_02202fc0
.extern data_ov025_022030f4
.extern func_02071ea4
.extern func_02071ee0
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern gSystemState

    .global func_ov025_021fce00
func_ov025_021fce00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x4
    bl func_02071ea4
    mov r8, #0x0
    ldr r1, L_021fd020
    str r8, [r10, #0x17c]
    ldr r0, L_021fd024
    str r1, [r10, #0x178]
    ldrb r0, [r0, #0x5f]
    ldr r3, L_021fd028
    cmp r0, #0x0
    ldrne r0, L_021fd02c
    sub r2, r3, #0x2
    strne r0, [r10, #0x178]
    str r3, [sp, #0x0]
    ldr r0, L_021fd030
    sub r3, r3, #0x1
    ldr r1, [r0, #0x0]
    add r0, r10, #0x4
    movne r8, #0x1
    bl func_02071ee0
    ldr r0, L_021fd034
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    mov r1, #0x0
    str r0, [r10, #0x0]
    mov r9, r1
L_021fce74:
    add r0, r10, r1, lsl #0x1
    add r0, r0, #0x100
    add r1, r1, #0x1
    strh r9, [r0, #0x80]
    cmp r1, #0x10
    blt L_021fce74
    mov r11, #0x1
    mov r7, #0x2
    mov r6, #0x100
    mov r5, r11
    mov r4, #0x16
L_021fcea0:
    ldr r0, [r10, #0x0]
    mov r2, r11
    add r1, r10, #0x4
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r9, lsl #0x2
    mul r2, r9, r4
    str r0, [r1, #0x10]
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    ldr r0, [r1, #0x10]
    mov r1, #0x5
    add r2, r2, #0x33
    mov r3, #0xd
    bl func_02073e48
    add r9, r9, #0x1
    cmp r9, #0x8
    blt L_021fcea0
    ldr r0, L_021fd038
    mov r5, #0x0
    mov r4, #0x1
    add r6, r0, r8, lsl #0x4
    mov r9, #0x2
    mov r8, #0x100
    mov r7, r5
    mov r11, r4
L_021fcf08:
    ldr r0, [r10, #0x0]
    mov r2, r4
    add r1, r10, #0x4
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r10, r5, lsl #0x2
    str r0, [r1, #0x30]
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    str r7, [sp, #0x8]
    add r2, r6, r5, lsl #0x2
    ldr r0, [r1, #0x30]
    ldrsh r2, [r2, #0x2]
    mov r1, r11
    mov r3, #0xb3
    bl func_02073e48
    mov r1, r5, lsl #0x2
    ldrh r0, [r1, r6]
    add r5, r5, #0x1
    cmp r0, #0x0
    addeq r0, r10, r1
    ldreq r1, [r0, #0x30]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    cmp r5, #0x4
    blt L_021fcf08
    mov r7, #0x0
    mvn r4, #0x1
    mov r11, #0x2
L_021fcf7c:
    mov r0, #0xb
    mul r1, r7, r0
    mov r0, #0x14
    mul r6, r7, r0
    mov r9, #0x0
    and r8, r7, #0x1
    add r5, r10, r1, lsl #0x2
L_021fcf98:
    ldr r0, [r10, #0x0]
    add r1, r10, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r3, #0x16
    mul r3, r9, r3
    add r1, r5, r9, lsl #0x2
    str r0, [r1, #0x40]
    cmp r8, #0x0
    movne r2, #0x2
    str r11, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    add r0, r5, r9, lsl #0x2
    moveq r2, r4
    add r3, r3, #0x13
    add r2, r3, r2
    ldr r0, [r0, #0x40]
    mov r1, #0x0
    add r3, r6, #0x24
    bl func_02073e48
    add r9, r9, #0x1
    cmp r9, #0xb
    blt L_021fcf98
    add r7, r7, #0x1
    cmp r7, #0x7
    blt L_021fcf7c
    mov r1, #0x0
    mov r0, r10
    str r1, [r10, #0x174]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd020: .word data_ov025_022030f4
L_021fd024: .word gSystemState
L_021fd028: .word 0x4008
L_021fd02c: .word data_ov025_02202fc0
L_021fd030: .word data_020f4e18
L_021fd034: .word data_020f4e14
L_021fd038: .word data_ov025_02202f40
.size func_ov025_021fce00, .-func_ov025_021fce00

