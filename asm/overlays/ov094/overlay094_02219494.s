.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern func_02072b68
.extern func_02094dd4

.global func_ov094_02219494
func_ov094_02219494:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x0
    beq .L_022194bc
    cmp r1, #0x1
    beq .L_02219510
    cmp r1, #0x2
    beq .L_02219530
    b .L_02219538
.L_022194bc:
    bl func_02094dd4
    cmp r0, #0x0
    beq .L_02219538
    ldr r2, [r4, #0x9c]
    mov r1, #0x7
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x9c]
    bl func_02072b68
    ldr r2, [r4, #0xa4]
    mov r1, #0x7
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0xa4]
    bl func_02072b68
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b .L_02219538
.L_02219510:
    ldr r0, [r4, #0x9c]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    addne r0, r1, #0x1
    strne r0, [r4, #0xa0]
    b .L_02219538
.L_02219530:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02219538:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov094_02219494, . - func_ov094_02219494
