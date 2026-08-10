.text
.extern func_ov042_021ff2f8
.extern func_020adc40
.extern func_020adc90
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_ov042_0220b6f4
.extern data_ov042_0220b6f8
.extern data_ov042_0220b704
.global func_ov042_022091f4
func_ov042_022091f4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r1, [r7, #0x48]
    add r0, r7, #0x50
    ldr r1, [r1, #0xc]
    add r1, r1, #0xa4
    bl func_ov042_021ff2f8
    ldrb r2, [r7, #0x8e]
    ldr r0, .L_02209338
    ldr r1, .L_0220933c
    ldr r2, [r0, r2, lsl #0x3]
    ldr r0, .L_02209340
    mov r2, r2, lsl #0xc
    str r2, [r7, #0x60]
    ldrb r2, [r7, #0x8e]
    ldr r1, [r1, r2, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r7, #0x64]
    ldr r1, [r7, #0x48]
    ldrb r2, [r7, #0x8e]
    ldr r1, [r1, #0xc]
    ldr r1, [r1, #0x150]
    add r1, r2, r1, lsl #0x1
    ldr r0, [r0, r1, lsl #0x3]
    mov r0, r0, lsl #0xc
    str r0, [r7, #0x74]
    ldr r3, [r7, #0x60]
    ldr r2, [r7, #0x54]
    ldr r1, [r7, #0x64]
    ldr r0, [r7, #0x58]
    sub r5, r3, r2
    sub r6, r1, r0
    smull r0, r2, r5, r5
    adds r3, r0, #0x800
    smull r1, r0, r6, r6
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r4, r0
    mov r0, r5
    mov r1, r4
    bl func_020adc90
    mov r1, r0, asr #0x1f
    mov r2, r1, lsl #0xe
    mov r1, #0x800
    adds r1, r1, r0, lsl #0xe
    mov r3, r1, lsr #0xc
    mov r1, r4
    orr r2, r2, r0, lsr #0x12
    adc r0, r2, #0x0
    orr r3, r3, r0, lsl #0x14
    str r3, [r7, #0x6c]
    mov r0, r6
    bl func_020adc90
    mov r1, r0, asr #0x1f
    mov r2, r1, lsl #0xe
    orr r2, r2, r0, lsr #0x12
    mov r1, #0x800
    adds r1, r1, r0, lsl #0xe
    adc r0, r2, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r7, #0x70]
    ldr r0, [r7, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x2
    str r0, [r7, #0x80]
    str r0, [r7, #0x78]
    mov r0, #0x0
    strh r0, [r7, #0x8c]
    str r0, [r7, #0x84]
    str r0, [r7, #0x88]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02209338: .word data_ov042_0220b6f4
.L_0220933c: .word data_ov042_0220b6f8
.L_02209340: .word data_ov042_0220b704
.size func_ov042_022091f4, . - func_ov042_022091f4
