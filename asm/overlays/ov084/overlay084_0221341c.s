.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_021052fc
.extern data_ov084_02214108
.extern func_020425d4

.global func_ov084_0221341c
func_ov084_0221341c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020425d4
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x40
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    bne .L_02213474
    add r0, r4, #0x200
    ldrh r2, [r0, #0xa0]
    mov r1, #0x0
    bic r2, r2, #0x1
    strh r2, [r0, #0xa0]
    str r1, [r4, #0x298]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_02213474:
    add r1, r4, #0x200
    ldrh r3, [r1, #0xa0]
    ldr r0, .L_022134e8
    ldr r2, .L_022134ec
    orr r3, r3, #0x1
    strh r3, [r1, #0xa0]
    ldr r0, [r0, #0x0]
    mov r3, #0x0
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x228]
    ldr ip, [r2, #0x48]
    ldr r0, [r2, #0x4c]
    str ip, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr ip, [r2, #0x0]
    ldr r0, [r2, #0x4]
    str ip, [r4, #0x220]
    str r0, [r4, #0x224]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    strh r3, [r1, #0xa2]
    strh r3, [r1, #0x9c]
    ldmia sp!, {r4, pc}
.L_022134e8: .word data_021052fc
.L_022134ec: .word data_ov084_02214108
.size func_ov084_0221341c, . - func_ov084_0221341c
