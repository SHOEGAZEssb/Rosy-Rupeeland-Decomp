.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern func_02030acc
.extern Actor_GetCollection
.extern func_02072b68
.extern func_020740c8

.global func_ov078_02213280
func_ov078_02213280:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrsh r1, [r4, #0xd6]
    cmp r1, #0x1a
    beq .L_022132a0
    cmp r1, #0x1b
    beq .L_022132f8
    b .L_0221334c
.L_022132a0:
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl func_02030acc
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x15
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221334c
.L_022132f8:
    ldr r5, [r4, #0x208]
    bl Actor_GetCollection
    bl func_02030acc
    ldr r1, [r5, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x54]
    ldmib r5, {r2, r3}
    bl func_020740c8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x1d
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0221334c:
    ldr r0, [r4, #0x54]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    strh r1, [r0, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov078_02213280, . - func_ov078_02213280
