.text
; Matching fallback for the portable implementation in src/overlays/ov101/overlay101_recovery.c.
.extern Sound_Play
.extern data_020ec568
.extern data_0210568c
.extern data_ov101_0221d684
.extern data_ov101_0221d6a0
.extern data_ov101_0221d6a8
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_02075858
.extern gDebugFont
.extern gSoundContext
.extern gSystemState

.global func_ov101_0221d470
func_ov101_0221d470:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0221d5c8
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, .L_0221d5cc
    ldrh r0, [r0, #0xa]
    tst r0, #0x2
    beq .L_0221d4b8
    cmp r4, #0x0
    beq .L_0221d4b0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221d4b0:
    mov r0, #0x1
    b .L_0221d5c0
.L_0221d4b8:
    tst r0, #0x1
    beq .L_0221d4f4
    ldrsh r2, [r4, #0x24]
    mov r0, #0x34
    ldr r1, .L_0221d5d0
    smulbb r3, r2, r0
    ldr r2, .L_0221d5d4
    ldr r0, [r1, #0x0]
    ldrsh ip, [r2, r3]
    ldr r3, .L_0221d5d8
    mov r1, #0x0
    mov r2, #0x29
    strh ip, [r3, #0x0]
    bl Sound_Play
    b .L_0221d548
.L_0221d4f4:
    tst r0, #0xf0
    beq .L_0221d548
    tst r0, #0x40
    beq .L_0221d524
    ldrsh r0, [r4, #0x24]
    add r0, r0, #0x1
    strh r0, [r4, #0x24]
    ldrsh r0, [r4, #0x24]
    cmp r0, #0x4a
    movge r0, #0x0
    strgeh r0, [r4, #0x24]
    b .L_0221d548
.L_0221d524:
    tst r0, #0x80
    beq .L_0221d548
    ldrsh r0, [r4, #0x24]
    sub r0, r0, #0x1
    strh r0, [r4, #0x24]
    ldrsh r0, [r4, #0x24]
    cmp r0, #0x0
    movlt r0, #0x4a
    strlth r0, [r4, #0x24]
.L_0221d548:
    ldr r0, .L_0221d5c8
    ldr r3, .L_0221d5dc
    ldr r0, [r0, #0x0]
    mov r1, #0x2
    mov r2, #0x11
    bl func_02075858
    ldrsh r2, [r4, #0x24]
    mov r0, #0x34
    ldr r1, .L_0221d5d4
    smulbb r0, r2, r0
    ldrsh r1, [r1, r0]
    ldr r0, .L_0221d5c8
    ldr r3, .L_0221d5e0
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x2
    mov r2, #0xe
    bl func_02075858
    ldr r0, .L_0221d5d8
    ldrsh r1, [r0, #0x0]
    cmp r1, #0x0
    blt .L_0221d5bc
    ldr r0, .L_0221d5c8
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, .L_0221d5e4
    mov r1, #0x2
    mov r2, #0xa
    bl func_02075858
.L_0221d5bc:
    mov r0, #0x0
.L_0221d5c0:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0221d5c8: .word gDebugFont
.L_0221d5cc: .word gSystemState
.L_0221d5d0: .word gSoundContext
.L_0221d5d4: .word data_020ec568
.L_0221d5d8: .word data_0210568c
.L_0221d5dc: .word data_ov101_0221d684
.L_0221d5e0: .word data_ov101_0221d6a0
.L_0221d5e4: .word data_ov101_0221d6a8
.size func_ov101_0221d470, . - func_ov101_0221d470
