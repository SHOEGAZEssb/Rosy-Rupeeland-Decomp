.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */
.extern data_020f4e14
.extern data_ov025_02202ef8
.extern data_ov025_02202f60
.extern func_02075598
.extern func_02075e48
.extern func_02075ecc
.extern func_020befec
.extern func_ov025_021fde58
.extern gSystemState


    .global func_ov025_021fdc60
func_ov025_021fdc60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r2, L_021fde40
    mov r8, r0
    ldrb r4, [r2, #0x5f]
    mov r0, r8
    mov r7, r1
    cmp r4, #0x6
    movge r4, #0x5
    bl func_ov025_021fde58
    ldr r0, [r8, #0x74]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, L_021fde44
    ldr r1, [r8, #0x30]
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r1, [r8, #0x78]
    mov r0, #0x3c
    mul r0, r1, r0
    ldr r1, [r8, #0xc]
    add r6, r0, #0x14
    ldr r0, [r1, #0x18]
    mov r10, #0x0
    sub r9, r0, #0x18
    mov r5, #0xe
    ldr r11, L_021fde44
    b L_021fdcfc
L_021fdccc:
    bl func_02075ecc
    str r5, [sp, #0x0]
    mov r1, r0
    ldr r0, [r11, #0x0]
    mov r2, r9
    add r3, r7, r6
    bl func_02075e48
    cmp r0, #0x0
    addeq r9, r9, #0x5
    addne r0, r0, #0x1
    addne r9, r9, r0
    add r10, r10, #0x1
L_021fdcfc:
    cmp r10, #0x8
    bge L_021fdd14
    add r0, r8, r10, lsl #0x1
    ldrh r0, [r0, #0x54]
    cmp r0, #0x0
    bne L_021fdccc
L_021fdd14:
    ldr r0, [r8, #0x88]
    ldr r1, [r8, #0x34]
    cmp r0, #0x0
    ldr r0, L_021fde44
    mov r5, #0x3
    ldr r0, [r0, #0x0]
    addeq r5, r5, #0x2
    bl func_02075598
    ldr r10, [r8, #0x84]
    mov r6, #0x0
    cmp r10, #0x0
    ldr r0, L_021fde48
    movlt r10, r6
    cmp r10, r0
    movgt r10, r0
    ldr r1, [r8, #0x78]
    mov r0, #0x3c
    mul r0, r1, r0
    ldr r1, [r8, #0xc]
    add r0, r0, #0x25
    add r8, r7, r0
    cmp r4, #0x0
    ldr r11, [r1, #0x18]
    ldr r7, L_021fde4c
    subne r8, r8, #0x2
    mov r9, #0x0
    mov r4, r4, lsl #0x1
L_021fdd80:
    cmp r9, #0x1
    cmpne r9, #0x5
    bne L_021fddc0
    cmp r6, #0x0
    beq L_021fde30
    ldr r0, L_021fde50
    str r5, [sp, #0x0]
    ldr r1, [r0, r9, lsl #0x2]
    ldr r0, L_021fde44
    add r2, r11, r1
    ldr r1, L_021fde54
    ldr r0, [r0, #0x0]
    ldrh r1, [r1, r4]
    mov r3, r8
    bl func_02075e48
    b L_021fde30
L_021fddc0:
    mov r0, r10
    mov r1, r7
    bl func_020befec
    cmp r0, #0x0
    cmpeq r6, #0x0
    bne L_021fdde0
    cmp r7, #0x1
    bne L_021fde20
L_021fdde0:
    add r1, r0, #0x10
    ldr r0, L_021fde50
    str r5, [sp, #0x0]
    ldr r2, [r0, r9, lsl #0x2]
    mov r0, r1, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, L_021fde44
    add r2, r11, r2
    ldr r0, [r0, #0x0]
    mov r3, r8
    mov r6, #0x1
    bl func_02075e48
    mov r0, r10
    mov r1, r7
    bl func_020befec
    mov r10, r1
L_021fde20:
    mov r0, r7
    mov r1, #0xa
    bl func_020befec
    mov r7, r0
L_021fde30:
    add r9, r9, #0x1
    cmp r9, #0x9
    blt L_021fdd80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fde40: .word gSystemState
L_021fde44: .word data_020f4e14
L_021fde48: .word 0x98967f
L_021fde4c: .word 0xf4240
L_021fde50: .word data_ov025_02202f60
L_021fde54: .word data_ov025_02202ef8
.size func_ov025_021fdc60, .-func_ov025_021fdc60

