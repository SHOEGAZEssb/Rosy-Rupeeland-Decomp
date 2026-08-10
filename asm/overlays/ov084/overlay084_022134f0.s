.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_020e6f94
.extern data_ov084_02214108
.extern Actor_SaveAndForceFlags
.extern func_02033f44
.extern func_020349b8
.extern func_02045184
.extern func_ov084_022131fc

.global func_ov084_022134f0
func_ov084_022134f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    add r1, r4, #0x200
    bic r2, r2, #0x200
    str r2, [r4, #0xd0]
    mov r2, #0x0
    strh r2, [r1, #0x4e]
    bl Actor_SaveAndForceFlags
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_02213528
    mov r1, r4
    bl func_02045184
.L_02213528:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov084_022131fc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov084_022131fc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov084_022131fc
    ldr r0, .L_022135fc
    ldr r1, .L_02213600
    ldr r2, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldrh r0, [r4, #0x4e]
    mov r0, r0, lsl #0x1
    ldrh r1, [r1, r0]
    cmp r1, #0x0
    beq .L_0221359c
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
.L_0221359c:
    ldr r0, [r4, #0x14]
    add r1, r4, #0x200
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x10]
    ldr r2, .L_02213604
    orr r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldrh r3, [r1, #0xa0]
    mov r0, r4
    bic r3, r3, #0x1
    strh r3, [r1, #0xa0]
    ldr r1, [r4, #0x260]
    and r1, r1, r2
    orr r1, r1, #0x4000
    str r1, [r4, #0x260]
    ldr r1, [r4, #0x14]
    bic r1, r1, #0x40
    str r1, [r4, #0x14]
    bl func_02033f44
    str r0, [r4, #0x24]
    mov r0, #0x11
    strh r0, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_022135fc: .word data_ov084_02214108
.L_02213600: .word data_020e6f94
.L_02213604: .word 0xfffff7fc
.size func_ov084_022134f0, . - func_ov084_022134f0
