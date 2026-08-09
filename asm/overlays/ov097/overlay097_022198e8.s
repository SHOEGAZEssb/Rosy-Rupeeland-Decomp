.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02005030
.extern func_02005058
.extern func_ov078_02213c3c

.global func_ov097_022198e8
func_ov097_022198e8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r2, [r4, #0x2b0]
    cmp r2, #0x0
    beq .L_02219958
    add r0, sp, #0x0
    add r1, r2, #0x18
    bl func_02005030
    ldr r2, [sp, #0xc]
    ldr r1, [r4, #0x2b4]
    ldr r0, [r4, #0x24]
    add r1, r2, r1
    cmp r0, r1
    strlt r1, [r4, #0x24]
    movlt r0, #0x1800
    strlt r0, [r4, #0x44]
    ldr r1, [sp, #0x4]
    add r0, sp, #0x0
    str r1, [r4, #0x2c]
    str r1, [r4, #0x1c]
    ldr r2, [sp, #0x8]
    mov r1, #0x0
    str r2, [r4, #0x30]
    str r2, [r4, #0x20]
    strb r1, [r4, #0x24c]
    bl func_02005058
    b .L_0221995c
.L_02219958:
    bl func_ov078_02213c3c
.L_0221995c:
    ldr r0, [r4, #0x260]
    orr r0, r0, #0xa
    str r0, [r4, #0x260]
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov097_022198e8, . - func_ov097_022198e8
