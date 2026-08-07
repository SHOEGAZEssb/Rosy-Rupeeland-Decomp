    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_runtime.c. */
    .extern data_020f4e14
    .extern data_021f3ecc
    .extern func_02075598
    .extern func_02076148
    .extern func_02076428
    .extern func_02079f3c
    .extern gSystemState

.global func_ov022_021fdb38
func_ov022_021fdb38:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    ldr r2, L_021fdc24
    str r1, [sp, #0x4]
    mov r10, r0
    ldr r0, [r2, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl func_02076428
    ldr r0, [r10, #0x2c]
    cmp r0, #0x0
    beq L_021fdc1c
    ldr r0, L_021fdc28
    ldr r1, [r10, #0x0]
    ldrb r0, [r0, #0x5f]
    mvn r7, #0x1
    cmp r0, #0x4
    ldr r0, L_021fdc24
    addeq r7, r7, #0x1
    ldr r0, [r0, #0x0]
    bl func_02075598
    mov r8, #0x0
    mov r11, #0xe
    mov r6, #0x8
    ldr r5, L_021fdc24
    mov r4, #0x18
    b L_021fdc14
L_021fdbb0:
    ldr r1, [r10, #0x30]
    ldr r0, [r10, #0x2c]
    ldr r1, [r1, #0xc]
    add r2, r8, r1
    cmp r2, r0
    bge L_021fdc1c
    ldr r1, [r10, #0x24]
    mov r9, r11
    add r0, r1, r2, lsl #0x3
    ldr r1, [r1, r2, lsl #0x3]
    ldr r0, [r0, #0x4]
    ldrh r1, [r1, #0x0]
    cmp r0, #0x0
    ldr r0, L_021fdc2c
    movne r9, #0x5
    bl func_02079f3c
    mul r3, r8, r4
    str r9, [sp, #0x0]
    stmib sp, {r6, r7}
    add r1, r0, #0x2
    ldr r0, [r5, #0x0]
    mov r2, #0x40
    add r3, r3, #0x13
    bl func_02076148
    add r8, r8, #0x1
L_021fdc14:
    cmp r8, #0x4
    blt L_021fdbb0
L_021fdc1c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fdc24: .word data_020f4e14
L_021fdc28: .word gSystemState
L_021fdc2c: .word data_021f3ecc
.size func_ov022_021fdb38, . - func_ov022_021fdb38
