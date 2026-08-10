.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern data_020c9670
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_ov050_0220d9c4
.extern func_ov050_0220db40
.extern func_ov050_0220e168
.extern func_ov050_0220e204
.extern func_ov050_0220e224
.extern func_ov050_0220e26c
.extern gGameWork

.global func_ov050_0220ddf0
func_ov050_0220ddf0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r6, r0
    bl func_ov050_0220e224
    cmp r0, #0x0
    ldr r1, .L_0220e158
    beq .L_0220de1c
    ldr r0, .L_0220e15c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    b .L_0220de28
.L_0220de1c:
    ldr r0, .L_0220e15c
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_0220de28:
    ldr r0, .L_0220e15c
    ldr r1, .L_0220e160
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_0220e150
    ldr r0, .L_0220e15c
    mov r1, #0x244
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220de70
    mov r1, #0x0
    mov r0, r6
    str r1, [r6, #0x40]
    bl func_ov050_0220e26c
    b .L_0220e054
.L_0220de70:
    mov r0, r6
    mov r1, #0x1
    bl func_ov050_0220e26c
    ldr r0, .L_0220e15c
    ldr r0, [r0, #0x0]
    ldrsh r0, [r0, #0x78]
    cmp r0, #0x2
    bne .L_0220dec0
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_0220dea4
    cmp r0, #0x1
    b .L_0220e054
.L_0220dea4:
    mov r0, r6
    mov r1, #0xc00
    bl func_ov050_0220e204
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
    b .L_0220e054
.L_0220dec0:
    cmp r0, #0x3
    bne .L_0220df00
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_0220dedc
    cmp r0, #0x1
    b .L_0220e054
.L_0220dedc:
    mov r1, #0x40
    mov r0, r6
    str r1, [r6, #0x44]
    mov r1, #0x1400
    bl func_ov050_0220e204
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
    b .L_0220e054
.L_0220df00:
    cmp r0, #0x4
    bne .L_0220dffc
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_0220df28
    cmp r0, #0x1
    beq .L_0220df8c
    cmp r0, #0x2
    beq .L_0220dfc4
    b .L_0220e054
.L_0220df28:
    mov r0, r6
    mov r1, #0x1000
    bl func_ov050_0220e204
    mov r1, #0x100
    mov r0, #0x0
    str r1, [r6, #0x44]
    str r0, [r6, #0x5c]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0x1c]
    mov r3, #0x2000
    str r3, [r0, #0x30]
    ldr r0, [r6, #0x5c]
    mov r2, #0x96
    add r0, r0, #0x2
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0x1c]
    str r3, [r0, #0x30]
    str r2, [r6, #0x4c]
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
    b .L_0220e054
.L_0220df8c:
    ldr r0, [r6, #0x4c]
    sub r0, r0, #0x1
    str r0, [r6, #0x4c]
    cmp r0, #0x0
    bgt .L_0220e054
    mov r0, r6
    mov r1, #0x1000
    bl func_ov050_0220e204
    mov r0, #0x1e
    str r0, [r6, #0x4c]
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
    b .L_0220e054
.L_0220dfc4:
    ldr r0, [r6, #0x4c]
    sub r0, r0, #0x1
    str r0, [r6, #0x4c]
    cmp r0, #0x0
    bgt .L_0220e054
    ldr r0, [r6, #0x5c]
    mov r2, #0x0
    add r0, r0, #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    str r0, [r6, #0x5c]
    str r2, [r6, #0x40]
    b .L_0220e054
.L_0220dffc:
    cmp r0, #0x5
    bne .L_0220e054
    ldr r0, [r6, #0x40]
    cmp r0, #0x0
    beq .L_0220e018
    cmp r0, #0x1
    b .L_0220e054
.L_0220e018:
    mov r0, #0x80
    str r0, [r6, #0x44]
    ldr r0, [r6, #0x1c]
    mov r2, #0x1800
    str r2, [r0, #0x30]
    ldr r0, [r6, #0x20]
    mov r1, #0x2800
    str r1, [r0, #0x30]
    ldr r0, [r6, #0x24]
    str r2, [r0, #0x30]
    ldr r0, [r6, #0x28]
    str r1, [r0, #0x30]
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
.L_0220e054:
    ldr r1, [r6, #0x48]
    ldr r0, [r6, #0x44]
    ldr r11, .L_0220e164
    add r0, r1, r0
    mov r4, #0x0
    str r0, [r6, #0x48]
    mov r8, r0, lsl #0x10
    mov r7, #0x30000
.L_0220e074:
    mov r0, r4, lsl #0xe
    add r0, r0, r8, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    mov r1, r5, asr #0x4
    add r1, r11, r1, lsl #0x2
    ldrsh lr, [r1, #0x2]
    mov r2, #0x0
    mov r1, r2
    umull r10, r9, lr, r7
    mla r9, lr, r1, r9
    mov ip, lr, asr #0x1f
    mla r9, ip, r7, r9
    adds r10, r10, #0x800
    mov r1, r2
    adc r9, r9, r1
    mov r1, r10, lsr #0xc
    add r0, sp, #0x10
    mov r3, r2
    orr r1, r1, r9, lsl #0x14
    bl func_0200500c
    add r0, sp, #0x0
    add r1, r6, #0x30
    add r2, sp, #0x10
    bl func_ov050_0220e168
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x1c]
    add r1, sp, #0x0
    add r0, r0, #0x20
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x1c]
    ldr r1, [r6, #0x2c]
    bl func_ov050_0220d9c4
    add r0, r6, r4, lsl #0x2
    cmp r5, #0x8000
    ldr r0, [r0, #0x1c]
    bge .L_0220e128
    mov r1, #0x2
    bl func_ov050_0220db40
    b .L_0220e130
.L_0220e128:
    mov r1, #0x3
    bl func_ov050_0220db40
.L_0220e130:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_0220e074
    ldr r0, [r6, #0x14]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r6, #0x18]
    bl GraphicsSpriteGroup_AdvanceAnimations
    mov r0, #0x0
.L_0220e150:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220e158: .word 0x245
.L_0220e15c: .word gGameWork
.L_0220e160: .word 0x21b
.L_0220e164: .word data_020c9670
.size func_ov050_0220ddf0, . - func_ov050_0220ddf0
