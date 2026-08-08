.text

/* Exact fallback; see src/overlays/ov032/overlay032_text_helpers.c for documented portable C. */
.extern func_02076004
.extern func_02092e9c
.extern func_02093360
.extern func_020939c8
.extern func_020befec
.extern gSystemState

    .global func_ov032_021fe2f0
func_ov032_021fe2f0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x40
    mov r8, #0xa
    mov r6, r0
    mov r4, #0x0
    mov r5, #0x1
    mov r7, r8
    b L_021fe330
L_021fe310:
    mul r1, r5, r8
    ldr r0, [r6, #0xc20]
    bl func_020befec
    cmp r0, #0x0
    beq L_021fe338
    mul r0, r5, r7
    mov r5, r0
    add r4, r4, #0x1
L_021fe330:
    cmp r4, #0x8
    blt L_021fe310
L_021fe338:
    ldr r1, [r6, #0xc20]
    add r0, sp, #0x0
    mov r2, r5
    mov r3, #0x0
    bl func_02076004
    ldr r1, L_021fe43c
    mov r0, #0x2c
    ldrb r1, [r1, #0x5f]
    mov r3, r0
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_021fe380
L_021fe368: ; jump table
    b L_021fe380 ; case 0
    b L_021fe380 ; case 1
    b L_021fe388 ; case 2
    b L_021fe388 ; case 3
    b L_021fe390 ; case 4
    b L_021fe390 ; case 5
L_021fe380:
    mov r3, #0x2e
    b L_021fe394
L_021fe388:
    mov r0, #0x20
    b L_021fe394
L_021fe390:
    mov r0, #0x2e
L_021fe394:
    cmp r5, #0x1
    add r2, r4, #0x1
    moveq r0, #0x30
    streqh r3, [sp, #0x2]
    streqh r0, [sp, #0x4]
    moveq r2, #0x3
    beq L_021fe3f8
    cmp r5, #0x3e8
    blt L_021fe3f8
    sub r1, r2, #0x1
    mov r8, r1, lsl #0x1
    add r7, sp, #0x0
    sub r1, r2, #0x2
    mov r5, r1, lsl #0x1
    ldrh r4, [r7, r8]
    mov r3, r2, lsl #0x1
    sub r1, r2, #0x3
    strh r4, [r7, r3]
    ldrh r4, [r7, r5]
    mov r3, r1, lsl #0x1
    add r2, r2, #0x1
    strh r4, [r7, r8]
    ldrh r1, [r7, r3]
    strh r1, [r7, r5]
    strh r0, [r7, r3]
L_021fe3f8:
    add r0, r2, #0x1
    add r1, sp, #0x0
    mov r2, r2, lsl #0x1
    mov r3, #0x6d
    strh r3, [r1, r2]
    mov r0, r0, lsl #0x1
    mov r2, #0x0
    strh r2, [r1, r0]
    ldr r0, [r6, #0x14]
    bl func_02092e9c
    ldr r0, [r6, #0x14]
    bl func_020939c8
    ldr r0, [r6, #0x14]
    mov r1, #0x0
    bl func_02093360
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fe43c: .word gSystemState
.size func_ov032_021fe2f0, .-func_ov032_021fe2f0

