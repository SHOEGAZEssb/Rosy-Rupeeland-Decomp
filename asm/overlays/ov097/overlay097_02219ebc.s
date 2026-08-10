.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02005058
.extern func_02005070
.extern func_020050a4
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020adae4
.extern func_020adc90
.extern func_020ae024
.extern func_ov097_02218d04
.extern func_ov097_0221a004

.global func_ov097_02219ebc
func_ov097_02219ebc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r6, r1
    mov r1, r2
    add r0, sp, #0x0
    add r2, r4, #0x18
    str r6, [r4, #0x1fc]
    bl func_ov097_02218d04
    add r1, sp, #0x0
    add r0, r4, #0x38
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add r0, r4, #0x38
    bl func_02005070
    mov r5, r0
    cmp r5, #0x4
    movlt r5, #0x4
    ldr r0, [r4, #0x3c]
    mov r1, r5
    bl func_020adc90
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    mov r1, r5
    bl func_020adc90
    str r0, [r4, #0x40]
    ldr r0, [r4, #0x44]
    mov r1, r5
    bl func_020adc90
    str r0, [r4, #0x44]
    ldrsh r1, [r6, #0xa]
    add r0, r4, #0x38
    mov r1, r1, lsl #0x4
    bl func_ov097_0221a004
    mov r0, #0x6000
    str r0, [r4, #0x44]
    ldrsh r0, [r6, #0xa]
    mov r1, #0x3
    bl func_020adae4
    ldr r2, [r4, #0x54]
    mov r1, #0x10000
    strh r0, [r2, #0x36]
    ldr r0, [r4, #0x5c]
    rsb r1, r1, #0x0
    and r0, r0, r1
    orr r0, r0, #0x8
    str r0, [r4, #0x5c]
    ldr r1, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    rsb r1, r1, #0x0
    bl func_020ae024
    add r0, r0, #0xc000
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r1, asr #0xc
    add r0, r1, r0, lsr #0x13
    mov r0, r0, asr #0xd
    and r1, r0, #0xff
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x14]
    mvn r1, #0x17
    orr r0, r0, #0x800000
    str r0, [r4, #0x14]
    ldr r2, [r4, #0xd0]
    mov r0, #0x18
    orr r2, r2, #0x2000
    str r2, [r4, #0xd0]
    ldr r2, [r4, #0x10]
    orr r2, r2, #0x1f0000
    bic r2, r2, #0x20000
    str r2, [r4, #0x10]
    ldr r2, [r4, #0x14]
    orr r2, r2, #0x2
    str r2, [r4, #0x14]
    strh r1, [r4, #0x68]
    strh r1, [r4, #0x6a]
    strh r0, [r4, #0x6c]
    strh r0, [r4, #0x6e]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov097_02219ebc, . - func_ov097_02219ebc
