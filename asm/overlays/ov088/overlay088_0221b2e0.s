.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02030e50
.extern func_ov088_0221ad6c
.extern func_ov088_0221ad84
.extern func_ov088_0221b278

.global func_ov088_0221b2e0
func_ov088_0221b2e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r9, r1
    mov r8, r2
    str r3, [sp, #0x0]
    bl func_02030e50
    bl func_ov088_0221ad6c
    add r1, r0, r0, lsr #0x1f
    mov r0, r10
    mov r4, r1, asr #0x1
    bl func_02030e50
    bl func_ov088_0221ad84
    add r0, r0, r0, lsr #0x1f
    mvn r6, #0x0
    mov r5, r0, asr #0x1
    str r6, [sp, #0x4]
    b .L_0221b36c
.L_0221b328:
    mla r0, r6, r4, r9
    ldr r7, [sp, #0x4]
    mov r11, r0, asr #0x4
    b .L_0221b360
.L_0221b338:
    mla r2, r7, r5, r8
    ldr r3, [sp, #0x0]
    mov r0, r10
    mov r1, r11
    mov r2, r2, asr #0x4
    bl func_ov088_0221b278
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0221b378
    add r7, r7, #0x1
.L_0221b360:
    cmp r7, #0x1
    ble .L_0221b338
    add r6, r6, #0x1
.L_0221b36c:
    cmp r6, #0x1
    ble .L_0221b328
    mov r0, #0x1
.L_0221b378:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov088_0221b2e0, . - func_ov088_0221b2e0
