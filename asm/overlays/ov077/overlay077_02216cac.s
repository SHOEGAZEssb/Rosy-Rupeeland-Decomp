.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern func_ov077_02213768
.extern func_ov090_0221c3dc
.extern func_ov090_0221ca34

.global func_ov077_02216cac
func_ov077_02216cac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r2, #0x0
    add r0, r4, #0x200
    strh r2, [r0, #0xee]
    mov r0, #0x12
    strh r0, [r4, #0xd6]
    ldrb r0, [r4, #0x2e4]
    mov r1, #0x10
    bic r0, r0, #0x80
    strb r0, [r4, #0x2e4]
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x3
    str r0, [r4, #0x260]
    str r2, [r4, #0x40]
    str r2, [r4, #0x3c]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x58]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x2c4]
    bl func_ov077_02213768
    ldr r0, [r4, #0x298]
    mov r1, #0x0
    bl func_ov090_0221c3dc
    mov r6, #0x0
    mov r5, r6
.L_02216d28:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x2d4]
    mov r1, r5
    bl func_ov090_0221ca34
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_02216d28
    ldr r1, [r4, #0x29c]
    mov r0, #0x0
    ldr r2, [r1, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov077_02216cac, . - func_ov077_02216cac
