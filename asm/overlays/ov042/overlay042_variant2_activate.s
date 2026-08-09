.text
.extern func_020befec
.extern func_02072b68
.global func_ov042_022088fc
func_ov042_022088fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x20
    mvn r9, #0x3b
    add r8, r9, #0x2e
    add r7, sp, #0x8
    mov r6, #0x0
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    stmia r7, {r6, r8}
    add lr, sp, #0x10
    mov ip, #0x3c
    add r4, sp, #0x18
    mov r3, #0x78
    str ip, [lr, #0x0]
    str r8, [lr, #0x4]
    stmia r4, {r3, r8}
    mov r5, r0
    strb r1, [r5, #0x8a]
    strh r6, [r5, #0x88]
    ldrb r0, [r5, #0x8a]
    mov r1, #0x3
    mov r4, r2
    bl func_020befec
    ldr r0, [r5, #0x4c]
    mov r1, r1, lsl #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl func_02072b68
    ldr r0, [r5, #0x4c]
    mov r3, #0x100
    ldr lr, [r0, #0xc]
    mov ip, r6
    ldrh r0, [lr, #0x24]
    add r2, sp, #0x0
    add r1, sp, #0x4
    bic r0, r0, #0x2
    strh r0, [lr, #0x24]
    ldr lr, [r5, #0x4c]
    mov r0, #0xa
    strh r3, [lr, #0x3c]
    strh r3, [lr, #0x3e]
    str ip, [r5, #0x74]
    str r4, [r5, #0x84]
    ldrb r3, [r5, #0x8a]
    ldr r2, [r2, r3, lsl #0x3]
    mov r2, r2, lsl #0xc
    str r2, [r5, #0x54]
    ldrb r2, [r5, #0x8a]
    ldr r1, [r1, r2, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r5, #0x58]
    str r0, [r5, #0x7c]
    str ip, [r5, #0x80]
    ldr r1, [r5, #0x4c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov042_022088fc, . - func_ov042_022088fc
