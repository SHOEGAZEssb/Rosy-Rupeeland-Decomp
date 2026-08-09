.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern func_02032a94
.extern func_0203b9dc
.extern func_0204cfa4
.extern func_020593ac
.extern func_020adc90
.extern gSoundContext

.global func_ov087_02218110
func_ov087_02218110:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r3, [r7, #0x10]
    mov r6, r1
    mov r5, r2
    tst r3, #0x1000000
    beq .L_02218138
    bl func_0203b9dc
    b .L_02218258
.L_02218138:
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_02218248
    ldr r3, [r6, #0x1c]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r7, #0x20]
    sub r4, r3, r2
    sub r9, r1, r0
    mov r0, r4
    mov r1, r9
    bl func_0204cfa4
    mov r8, r0
    cmp r8, #0x1000
    ble .L_022181e4
    mov r0, r4
    mov r1, r8
    bl func_020adc90
    mov r4, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    ldr r1, [r7, #0xd0]
    ldr r2, [r7, #0x9c]
    tst r1, #0x10
    addne r1, r4, r4, lsr #0x1f
    movne r4, r1, asr #0x1
    add r1, r4, r4, lsr #0x1f
    sub r1, r2, r1, asr #0x1
    addne r0, r0, r0, lsr #0x1f
    str r1, [r7, #0x9c]
    movne r0, r0, asr #0x1
    ldr r2, [r7, #0xa0]
    add r1, r0, r0, lsr #0x1f
    sub r1, r2, r1, asr #0x1
    str r1, [r7, #0xa0]
    ldr r1, [r6, #0x8c]
    add r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    add r0, r1, r0
    str r0, [r6, #0x90]
.L_022181e4:
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x24]
    cmp r0, #0x1
    bne .L_02218228
    ldr r0, [r7, #0x22c]
    mov r2, #0x0
    cmp r0, #0x0
    str r2, [sp, #0x0]
    movgt r3, #0x20
    ldr r0, .L_02218260
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    movle r3, #0x7f
    mov r1, #0x67
    bl func_020593ac
    mov r0, #0xa
    str r0, [r7, #0x22c]
.L_02218228:
    add r0, r7, #0x200
    ldrsh r1, [r0, #0x1e]
    cmp r1, #0x0
    bne .L_02218248
    ldrsh r1, [r0, #0x1c]
    cmp r1, #0x0
    movgt r1, #0xf
    strgth r1, [r0, #0x1e]
.L_02218248:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_02032a94
.L_02218258:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02218260: .word gSoundContext
.size func_ov087_02218110, . - func_ov087_02218110
