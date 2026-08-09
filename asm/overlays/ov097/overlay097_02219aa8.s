.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_ov097_02217fec
.extern func_ov097_0221818c

.global func_ov097_02219aa8
func_ov097_02219aa8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov097_02217fec
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov097_0221818c
    ldr r0, [r4, #0x2b0]
    cmp r0, #0x0
    beq .L_02219b18
    ldr r1, [r4, #0x24]
    ldr r0, [r0, #0x24]
    cmp r1, r0
    moveq r0, #0x3000
    streq r0, [r4, #0x44]
.L_02219b18:
    ldr r1, [r4, #0x10]
    mov r0, #0x10000
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r1, [r4, #0x14]
    rsb r0, r0, #0x0
    orr r1, r1, #0x2000000
    str r1, [r4, #0x14]
    ldr r2, [r4, #0x5c]
    mov r1, #0x0
    and r0, r2, r0
    str r0, [r4, #0x5c]
    str r1, [r4, #0x2b0]
    ldmia sp!, {r4, pc}
.size func_ov097_02219aa8, . - func_ov097_02219aa8
