.text
.extern func_ov042_021ff2f8
.global func_ov042_022089e8
func_ov042_022089e8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mvn r6, #0x0
    mov ip, #0x0
    add lr, sp, #0x8
    sub r5, r6, #0x4
    sub r3, ip, #0x6
    add r2, sp, #0x10
    mov r1, #0x1
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    str ip, [lr, #0x0]
    str r3, [lr, #0x4]
    stmia r2, {r1, r5}
    mov r4, r0
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    bne .L_02208a88
    ldr r1, [r4, #0x48]
    add r0, r4, #0x50
    ldr r1, [r1, #0xc]
    add r1, r1, #0x160
    bl func_ov042_021ff2f8
    ldr r1, [r4, #0x58]
    add r0, sp, #0x0
    add r1, r1, #0x28000
    str r1, [r4, #0x64]
    ldrb r3, [r4, #0x8a]
    add r2, sp, #0x4
    mov r1, #0x1
    ldr r3, [r0, r3, lsl #0x3]
    mov r0, #0x0
    mov r3, r3, lsl #0xc
    str r3, [r4, #0x6c]
    ldrb r3, [r4, #0x8a]
    ldr r2, [r2, r3, lsl #0x3]
    mov r2, r2, lsl #0xc
    str r2, [r4, #0x70]
    str r1, [r4, #0x74]
    str r0, [r4, #0x80]
.L_02208a88:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov042_022089e8, . - func_ov042_022089e8
