.text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern func_0209a2ac
    .extern func_0200500c
    .extern func_02076428
    .extern func_020befec
    .extern func_02072b68
    .extern func_02005058
    .extern gDebugFont

    .global func_ov040_02202cb4
func_ov040_02202cb4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r1, [r5, #0x50]
    cmp r1, #0x1
    beq .L_02202e84
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    mov r1, #0x0
    add r0, sp, #0x8
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    ldr r0, [r5, #0x58]
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x5c]
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x60]
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x64]
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x68]
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x6c]
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    mov r2, #0x90
    ldr r4, [r0, #0xb2c]
    mov r0, #0xa7
    str r0, [sp, #0x0]
    cmp r4, #0x0
    movlt r4, #0x0
    rsb r6, r4, #0x6f
    ldr r0, .L_02202e8c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    bl func_02076428
    cmp r4, #0x0
    ble .L_02202db8
    mov r0, #0xa7
    str r0, [sp, #0x0]
    mov r1, #0x4
    ldr r0, .L_02202e8c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r6
    mov r2, #0x90
    mov r3, #0x6f
    bl func_02076428
.L_02202db8:
    mov r0, r4
    mov r1, #0x26
    bl func_020befec
    ldr r1, [r5, #0x5c]
    rsb r2, r0, #0x5
    ldr r0, [r1, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202de4
    and r1, r2, #0xff
    bl func_02072b68
.L_02202de4:
    ldr r0, [r5, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    mov r2, #0x90
    ldr r4, [r0, #0xb28]
    mov r0, #0xa7
    str r0, [sp, #0x0]
    ldr r0, .L_02202e8c
    str r1, [sp, #0x4]
    cmp r4, #0x0
    movlt r4, #0x0
    ldr r0, [r0, #0x0]
    add r1, r4, #0x90
    mov r3, #0x100
    bl func_02076428
    cmp r4, #0x0
    ble .L_02202e50
    mov r0, #0xa7
    str r0, [sp, #0x0]
    mov r2, #0x4
    mov r1, #0x90
    ldr r0, .L_02202e8c
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, r1
    add r3, r4, #0x90
    bl func_02076428
.L_02202e50:
    mov r0, r4
    mov r1, #0x26
    bl func_020befec
    ldr r1, [r5, #0x58]
    rsb r2, r0, #0x2
    ldr r0, [r1, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202e7c
    and r1, r2, #0xff
    bl func_02072b68
.L_02202e7c:
    add r0, sp, #0x8
    bl func_02005058
.L_02202e84:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02202e8c: .word gDebugFont
    .size func_ov040_02202cb4, .-func_ov040_02202cb4

