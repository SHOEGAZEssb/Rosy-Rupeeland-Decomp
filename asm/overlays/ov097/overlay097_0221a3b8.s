.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02033f44

.global func_ov097_0221a3b8
func_ov097_0221a3b8:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0xd0]
    blx r1
    cmp r0, #0x0
    beq .L_0221a410
    add r0, r4, #0x100
    ldrsh r0, [r0, #0xf8]
    cmp r0, #0x14
    ble .L_0221a410
    mov r0, r4
    bl func_02033f44
    ldr r1, [r4, #0x24]
    sub r0, r1, r0
    cmp r0, #0x18000
    ldr r0, [r4, #0x10]
    biclt r0, r0, #0x40000
    strlt r0, [r4, #0x10]
    orrge r0, r0, #0x40000
    strge r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_0221a410:
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x40000
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.size func_ov097_0221a3b8, . - func_ov097_0221a3b8
