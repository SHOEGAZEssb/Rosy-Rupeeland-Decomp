.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern PaletteBuffer_Write
.extern data_020c3850
.extern data_020c38ac
.extern data_020c3908
.extern data_020d8818
.extern data_020d887c
.extern data_020d8aac
.extern data_020f4e18
.extern gMainBgPaletteBuffer
.extern gSubBgPaletteBuffer
.extern func_02070874
.extern func_02070f34
.extern func_02071568
.extern func_020716bc
.extern func_020718dc
.extern func_02071bdc
.extern func_02071c38
.extern func_02071cf0
.extern func_020b17ec
.extern func_020b1924
.extern func_020b1b2c
.extern func_020b1c64
.extern func_020b44e8
.extern func_ov055_0220eee4

.global func_ov055_0220ebec
func_ov055_0220ebec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    str r0, [sp, #0x0]
    ldr r1, [r0, #0x2c]
    ldr r0, .L_0220eec0
    mov r6, #0x0
    ldr r5, [r0, r1, lsl #0x2]
.L_0220ec08:
    mov r0, #0x1c
    mul r3, r6, r0
    ldr r0, .L_0220eec4
    ldr r2, [r5, r3]
    ldr r1, .L_0220eec8
    add r10, r5, r3
    ldr r0, [r0, #0x0]
    ldr r1, [r1, r2, lsl #0x2]
    ldmib r10, {r4, r7}
    bl func_02071568
    ldr r2, .L_0220eecc
    ldr r1, .L_0220eec4
    mov r11, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r2, r4, lsl #0x2]
    bl func_020716bc
    ldr r2, .L_0220eed0
    ldr r1, .L_0220eec4
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x0]
    ldr r1, [r2, r7, lsl #0x2]
    bl func_020718dc
    mov r7, r0
    mov r4, #0x400
    ldr r8, [r7, #0x24]
    mov r9, #0x0
    rsb r4, r4, #0x0
    b .L_0220eca8
.L_0220ec78:
    mov r1, r9, lsl #0x1
    ldrh r0, [r8, r1]
    ldr r2, [r10, #0xc]
    add r9, r9, #0x1
    mov r3, r2, lsr #0x5
    and r2, r0, r4
    mov r2, r2, lsl #0x10
    and r0, r0, r4, lsr #0x16
    mov r0, r0, lsl #0x10
    add r0, r3, r0, lsr #0x10
    orr r0, r0, r2, lsr #0x10
    strh r0, [r8, r1]
.L_0220eca8:
    mov r0, r7
    bl func_ov055_0220eee4
    add r0, r0, r0, lsr #0x1f
    cmp r9, r0, asr #0x1
    blt .L_0220ec78
    ldr r1, [r10, #0x14]
    mov r0, r7
    bl func_02070f34
    bl func_020b44e8
    add r1, r6, r6, lsl #0x1
    ldr r0, [r7, #0x24]
    mov r1, r1, lsl #0x8
    mov r2, #0x300
    bl func_020b1c64
    ldr r0, [r11, #0x24]
    ldr r1, [r10, #0xc]
    ldr r2, [r10, #0x10]
    bl func_020b1924
    ldr r0, [sp, #0x8]
    bl func_02070874
    ldr r2, [r10, #0x14]
    ldr r3, [r10, #0x18]
    mov r1, r0
    ldr r0, .L_0220eed4
    mov r2, r2, lsl #0x5
    mov r3, r3, lsl #0x5
    bl PaletteBuffer_Write
    ldr r0, .L_0220eec4
    mov r1, r11
    ldr r0, [r0, #0x0]
    bl func_02071bdc
    ldr r0, .L_0220eec4
    ldr r1, [sp, #0x8]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, .L_0220eec4
    mov r1, r7
    ldr r0, [r0, #0x0]
    bl func_02071cf0
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0220ec08
    ldr r0, [sp, #0x0]
    ldr r0, [r0, #0x2c]
    cmp r0, #0x1
    ble .L_0220eeb8
    cmp r0, #0x2
    ldreq r10, .L_0220eed8
    mov r5, #0x0
    ldrne r10, .L_0220eedc
.L_0220ed70:
    mov r0, #0x1c
    mul r3, r5, r0
    ldr r0, .L_0220eec4
    ldr r2, [r10, r3]
    ldr r1, .L_0220eec8
    add r9, r10, r3
    ldr r0, [r0, #0x0]
    ldr r1, [r1, r2, lsl #0x2]
    ldmib r9, {r4, r6}
    bl func_02071568
    ldr r2, .L_0220eecc
    ldr r1, .L_0220eec4
    mov r11, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r2, r4, lsl #0x2]
    bl func_020716bc
    ldr r2, .L_0220eed0
    ldr r1, .L_0220eec4
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    ldr r1, [r2, r6, lsl #0x2]
    bl func_020718dc
    mov r6, r0
    mov r4, #0x400
    ldr r7, [r6, #0x24]
    mov r8, #0x0
    rsb r4, r4, #0x0
    b .L_0220ee10
.L_0220ede0:
    mov r0, r8, lsl #0x1
    ldrh r1, [r7, r0]
    ldr r3, [r9, #0xc]
    add r8, r8, #0x1
    and r2, r1, r4, lsr #0x16
    and r1, r1, r4
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsr #0x5
    add r2, r3, r2, lsr #0x10
    orr r1, r2, r1, lsr #0x10
    strh r1, [r7, r0]
.L_0220ee10:
    mov r0, r6
    bl func_ov055_0220eee4
    add r0, r0, r0, lsr #0x1f
    cmp r8, r0, asr #0x1
    blt .L_0220ede0
    ldr r1, [r9, #0x14]
    mov r0, r6
    bl func_02070f34
    bl func_020b44e8
    add r1, r5, r5, lsl #0x1
    ldr r0, [r6, #0x24]
    mov r1, r1, lsl #0x8
    mov r2, #0x300
    bl func_020b1b2c
    ldr r0, [r11, #0x24]
    ldr r1, [r9, #0xc]
    ldr r2, [r9, #0x10]
    bl func_020b17ec
    ldr r0, [sp, #0x4]
    bl func_02070874
    ldr r2, [r9, #0x14]
    ldr r3, [r9, #0x18]
    mov r1, r0
    ldr r0, .L_0220eee0
    mov r2, r2, lsl #0x5
    mov r3, r3, lsl #0x5
    bl PaletteBuffer_Write
    ldr r0, .L_0220eec4
    mov r1, r11
    ldr r0, [r0, #0x0]
    bl func_02071bdc
    ldr r0, .L_0220eec4
    ldr r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, .L_0220eec4
    mov r1, r6
    ldr r0, [r0, #0x0]
    bl func_02071cf0
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0220ed70
.L_0220eeb8:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220eec0: .word data_020d8818
.L_0220eec4: .word data_020f4e18
.L_0220eec8: .word data_020c38ac
.L_0220eecc: .word data_020c3850
.L_0220eed0: .word data_020c3908
.L_0220eed4: .word gMainBgPaletteBuffer
.L_0220eed8: .word data_020d887c
.L_0220eedc: .word data_020d8aac
.L_0220eee0: .word gSubBgPaletteBuffer
.size func_ov055_0220ebec, . - func_ov055_0220ebec
