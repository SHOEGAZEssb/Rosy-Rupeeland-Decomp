.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_020c9670
.extern data_ov089_02219ae8
.extern data_ov089_02219aec
.extern data_ov089_02219b48
.extern data_ov089_02219b4c
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorDerivedRuntime_ForwardTouchPoint
.extern GraphicsSpriteState_AdvanceAnimation
.extern func_ov089_02217c14

.global func_ov089_02218a5c
func_ov089_02218a5c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r1
    bl ActorDerivedRuntime_ForwardTouchPoint
    add r0, r5, #0x200
    ldrh r1, [r0, #0x36]
    ldr r3, .L_02218c30
    cmp r1, #0x1f4
    subhi r1, r1, #0xa
    strhih r1, [r0, #0x36]
    add r0, r5, #0x200
    ldrh r1, [r0, #0x36]
    cmp r1, #0x1f4
    movlo r1, #0x1f4
    strloh r1, [r0, #0x36]
    ldr r0, [r5, #0x238]
    cmp r0, #0x1800
    subgt r0, r0, #0xcd
    strgt r0, [r5, #0x238]
    ldr r0, [r5, #0x238]
    cmp r0, #0x1800
    addlt r0, r0, #0xcd
    strlt r0, [r5, #0x238]
    add r0, r5, #0x200
    ldrh r2, [r0, #0x34]
    ldrh r1, [r0, #0x36]
    add r1, r2, r1
    strh r1, [r0, #0x34]
    ldrh r0, [r0, #0x34]
    ldr r2, [r5, #0x238]
    ldr r1, [r5, #0x54]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r3, [r3, r0]
    ldrsh r0, [r1, #0x2e]
    smull r4, r2, r3, r2
    adds r3, r4, #0x800
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r0, r0, r3, asr #0xc
    strh r0, [r1, #0x2e]
    ldr r0, [r5, #0x240]
    mov r4, r3, asr #0xc
    cmp r0, #0x0
    ldrne r0, [r0, #0x14]
    cmpne r0, #0x0
    beq .L_02218b98
    add r0, sp, #0x10
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, [r5, #0x240]
    mov r0, #0xc
    ldrb r2, [r1, #0x1a]
    ldr r1, .L_02218c34
    ldr r3, [sp, #0x14]
    smulbb r2, r2, r0
    ldr r2, [r1, r2]
    ldr r1, [sp, #0x1c]
    add r2, r3, r2
    str r2, [sp, #0x14]
    ldr r3, [r5, #0x240]
    ldr r2, .L_02218c38
    ldrb r3, [r3, #0x1a]
    ldr ip, [sp, #0x18]
    sub r1, r1, r4, lsl #0xc
    smulbb r0, r3, r0
    ldr r0, [r2, r0]
    str r1, [sp, #0x1c]
    add r0, ip, r0
    str r0, [sp, #0x18]
    ldr r0, [r5, #0x240]
    add r1, sp, #0x10
    bl func_ov089_02217c14
    ldr r0, [r5, #0x240]
    ldr r0, [r0, #0x4]
    bl GraphicsSpriteState_AdvanceAnimation
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_02218b98:
    ldr r0, [r5, #0x244]
    cmp r0, #0x0
    ldrne r0, [r0, #0x14]
    cmpne r0, #0x0
    beq .L_02218c28
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, [r5, #0x244]
    mov r0, #0xc
    ldrb r2, [r1, #0x1a]
    ldr r1, .L_02218c3c
    ldr r3, [sp, #0x4]
    smulbb r2, r2, r0
    ldr r2, [r1, r2]
    ldr r1, [sp, #0xc]
    add r2, r3, r2
    str r2, [sp, #0x4]
    ldr r3, [r5, #0x244]
    ldr r2, .L_02218c40
    ldrb r3, [r3, #0x1a]
    sub r1, r1, r4, lsl #0xc
    ldr r4, [sp, #0x8]
    smulbb r0, r3, r0
    ldr r0, [r2, r0]
    str r1, [sp, #0xc]
    add r0, r4, r0
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x244]
    add r1, sp, #0x0
    bl func_ov089_02217c14
    ldr r0, [r5, #0x244]
    ldr r0, [r0, #0x4]
    bl GraphicsSpriteState_AdvanceAnimation
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02218c28:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_02218c30: .word data_020c9670
.L_02218c34: .word data_ov089_02219b48
.L_02218c38: .word data_ov089_02219b4c
.L_02218c3c: .word data_ov089_02219ae8
.L_02218c40: .word data_ov089_02219aec
.size func_ov089_02218a5c, . - func_ov089_02218a5c
