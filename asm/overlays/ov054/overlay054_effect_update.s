.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern VecFx32Object_Destroy
.extern func_02056f00
.extern func_020adc40
.extern gGameWork

.global func_ov054_0220e560
func_ov054_0220e560:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r10, r1
    add r0, sp, #0x0
    mov r1, r2
    bl func_02056f00
    ldr r0, .L_0220e688
    ldr r5, [r4, #0x1a4]
    ldr r0, [r0, #0x0]
    mov r9, #0x0
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x18]
    ldr r2, [sp, #0x8]
    ldr r1, [r4, #0x19c]
    mov r0, r0, lsl #0xc
    smull r6, r5, r0, r5
    adds r0, r6, #0x800
    adc r5, r5, #0x0
    mov r0, r0, lsr #0xc
    orr r0, r0, r5, lsl #0x14
    smull r6, r5, r0, r0
    adds r6, r6, #0x800
    add r7, r2, r1
    ldr r2, [r4, #0x198]
    adc r1, r5, #0x0
    mov r8, r6, lsr #0xc
    ldr r3, [sp, #0x4]
    sub r5, r7, r0
    add r6, r3, r2
    add r4, r7, r0
    orr r8, r8, r1, lsl #0x14
    mov r11, r9
.L_0220e5e4:
    cmp r9, r5, asr #0xc
    ble .L_0220e5f4
    cmp r9, r4, asr #0xc
    ble .L_0220e600
.L_0220e5f4:
    mov r0, r9, lsl #0x1
    strh r11, [r10, r0]
    b .L_0220e66c
.L_0220e600:
    rsb r0, r7, r9, lsl #0xc
    smull r2, r1, r0, r0
    mov r0, #0x800
    adds r2, r2, r0
    mov r0, #0x0
    adc r0, r1, r0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r8, r1
    bl func_020adc40
    sub r1, r6, r0
    cmp r1, #0x1000
    movlt r1, #0x1000
    blt .L_0220e640
    cmp r1, #0xff000
    movgt r1, #0xff000
.L_0220e640:
    add r0, r6, r0
    cmp r0, #0x1000
    movlt r0, #0x1000
    blt .L_0220e658
    cmp r0, #0xff000
    movgt r0, #0xff000
.L_0220e658:
    mov r2, r1, asr #0xc
    mov r0, r0, asr #0xc
    add r1, r10, r9, lsl #0x1
    strb r2, [r1, #0x1]
    strb r0, [r10, r9, lsl #0x1]
.L_0220e66c:
    add r9, r9, #0x1
    cmp r9, #0xc0
    blt .L_0220e5e4
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220e688: .word gGameWork
.size func_ov054_0220e560, . - func_ov054_0220e560
