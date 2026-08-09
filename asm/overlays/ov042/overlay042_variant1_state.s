.text
.extern func_02072b68
.global func_ov042_02207f58
func_ov042_02207f58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x60
    mvn r10, #0x81
    sub r9, r10, #0x28
    add ip, sp, #0x50
    mov r4, r0
    mov r0, #0xe0
    add r11, sp, #0x8
    mov r2, #0x78
    mov r7, #0x82
    add r8, sp, #0x38
    mov lr, #0x46
    str r10, [sp, #0x30]
    str r10, [ip, #0x0]
    str r9, [ip, #0x4]
    str r9, [sp, #0x34]
    add r10, sp, #0x10
    stmia r8, {r7, r9}
    sub r8, lr, #0xbe
    add r3, sp, #0x58
    add r5, sp, #0x48
    add r6, sp, #0x40
    str r8, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [r11, #0x4]
    str r2, [r11, #0x0]
    str r8, [r10, #0x0]
    str r7, [r10, #0x4]
    add r0, sp, #0x18
    stmia r0, {r2, r7}
    add ip, sp, #0x20
    str r9, [r5, #0x4]
    str lr, [r5, #0x0]
    str r9, [r6, #0x4]
    str r9, [r3, #0x4]
    sub r9, r2, #0xd2
    str r7, [r3, #0x0]
    sub r3, r7, #0xc8
    str r3, [r6, #0x0]
    and r3, r1, #0xff
    stmia ip, {r8, r9}
    add r5, sp, #0x28
    stmia r5, {r2, r9}
    strb r1, [r4, #0x8a]
    cmp r3, #0x4
    blo .L_02208028
    ldr r0, [r4, #0x8c]
    add r0, r3, r0
    strb r0, [r4, #0x8a]
    ldr r0, [r4, #0x8c]
    eor r0, r0, #0x1
    str r0, [r4, #0x8c]
.L_02208028:
    ldrb r2, [r4, #0x8a]
    add r1, sp, #0x30
    mov r0, #0x0
    ldr r2, [r1, r2, lsl #0x3]
    mov r1, #0x18
    mov r2, r2, lsl #0xc
    str r2, [r4, #0x6c]
    str r0, [r4, #0x70]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    mov r0, #0x0
    str r0, [r4, #0x74]
    ldrb r2, [r4, #0x8a]
    add r1, sp, #0x30
    add r5, sp, #0x34
    ldr r1, [r1, r2, lsl #0x3]
    add r3, sp, #0x0
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x54]
    ldrb r6, [r4, #0x8a]
    add r2, sp, #0x4
    mov r1, #0xa
    ldr r5, [r5, r6, lsl #0x3]
    mov r5, r5, lsl #0xc
    str r5, [r4, #0x58]
    ldrb r5, [r4, #0x8a]
    ldr r3, [r3, r5, lsl #0x3]
    mov r3, r3, lsl #0xc
    str r3, [r4, #0x60]
    ldrb r3, [r4, #0x8a]
    ldr r2, [r2, r3, lsl #0x3]
    mov r2, r2, lsl #0xc
    str r2, [r4, #0x64]
    str r1, [r4, #0x7c]
    str r0, [r4, #0x84]
    str r0, [r4, #0x80]
    ldr r1, [r4, #0x4c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov042_02207f58, . - func_ov042_02207f58
