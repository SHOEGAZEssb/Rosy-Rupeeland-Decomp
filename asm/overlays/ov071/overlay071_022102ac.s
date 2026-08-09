.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern GameWork_TestFlag
.extern func_02072b68
.extern func_0209a07c
.extern func_0209a0d8
.extern gGameWork

.global func_ov071_022102ac
func_ov071_022102ac:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xec]
    bl func_0209a07c
    ldr r0, .L_02210348
    ldr r1, .L_0221034c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldr r0, [r4, #0x48]
    ldr r1, .L_02210350
    ldr r2, [r0, #0x0]
    mov r0, #0x2
    beq .L_02210304
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xec]
    sub r2, r1, #0x3
    add r3, r1, #0x1
    bl func_0209a0d8
    b .L_0221031c
.L_02210304:
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xec]
    sub r2, r1, #0x5
    add r3, r1, #0x1
    bl func_0209a0d8
.L_0221031c:
    ldr r0, [r4, #0xec]
    mov r1, #0x4
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0xec]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02210348: .word gGameWork
.L_0221034c: .word 0x306
.L_02210350: .word 0x10b1
.size func_ov071_022102ac, . - func_ov071_022102ac
