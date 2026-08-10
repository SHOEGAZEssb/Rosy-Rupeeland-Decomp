.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern data_020f4e14
.extern GraphicsSpriteRenderer_SetFontResource
.extern func_020760c0
.extern func_020761f8
.extern func_02091aa8

.global func_ov058_0220ed64
func_ov058_0220ed64:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x54
    ldr r1, .L_0220eee8
    mov r10, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r10, #0x88]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r2, #0x0
    ldr r11, .L_0220eeec
    ldr r4, .L_0220eee8
    mov r8, r2
    mov r9, #0x1
    mov r6, r2
    add r5, sp, #0x4
    add r7, sp, #0x14
.L_0220eda0:
    ldr r1, [r10, #0xa8]
    mov r0, r9, lsl #0x1
    ldrh r0, [r1, r0]
    mov ip, r2, lsl #0x1
    add r9, r9, #0x1
    strh r0, [r7, ip]
    cmp r0, #0xee00
    bne .L_0220ede8
    ldr r0, [r4, #0x0]
    mov r1, r7
    mov r2, #0x4
    mov r3, #0x1
    strh r6, [r7, ip]
    bl func_020761f8
    str r0, [r5, r8, lsl #0x2]
    mov r2, #0x0
    add r8, r8, #0x1
    b .L_0220eda0
.L_0220ede8:
    cmp r0, r11
    bne .L_0220ee1c
    ldr r0, .L_0220eee8
    mov r4, #0x0
    ldr r0, [r0, #0x0]
    mov r1, r7
    mov r2, #0x4
    mov r3, #0x1
    strh r4, [r7, ip]
    bl func_020761f8
    add r4, sp, #0x4
    str r0, [r4, r8, lsl #0x2]
    b .L_0220ee24
.L_0220ee1c:
    add r2, r2, #0x1
    b .L_0220eda0
.L_0220ee24:
    mov r0, #0xc
    mul r0, r8, r0
    ldr r2, [sp, #0x4]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, r2, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r2, #0x86
    rsb r6, r0, #0x80
    sub r5, r2, r1, asr #0x1
    mov r8, #0x1
    mov r9, #0x0
    mov r11, #0x2
.L_0220ee54:
    ldr r1, [r10, #0xa8]
    mov r0, r8, lsl #0x1
    ldrh r7, [r1, r0]
    add r8, r8, #0x1
    cmp r7, #0xee00
    addeq r9, r9, #0x1
    ldreq r0, [r4, r9, lsl #0x2]
    addeq r5, r5, #0xc
    addeq r0, r0, r0, lsr #0x1f
    moveq r0, r0, asr #0x1
    rsbeq r6, r0, #0x80
    beq .L_0220ee54
    ldr r0, .L_0220eeec
    cmp r7, r0
    addeq r0, r1, r8, lsl #0x1
    streq r0, [r10, #0xa8]
    beq .L_0220eee0
    mov r0, #0x0
    mov r1, #0x6
    mov r2, #0x80
    sub r3, r6, #0x40
    bl func_02091aa8
    add r3, r5, r0
    ldr r0, .L_0220eee8
    str r11, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, r7
    mov r2, r6
    bl func_020760c0
    cmp r0, #0x0
    blt .L_0220ee54
    addgt r0, r0, #0x1
    addgt r6, r6, r0
    addle r6, r6, #0x5
    b .L_0220ee54
.L_0220eee0:
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220eee8: .word data_020f4e14
.L_0220eeec: .word 0xee01
.size func_ov058_0220ed64, . - func_ov058_0220ed64
