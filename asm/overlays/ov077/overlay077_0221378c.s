.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_02105310
.extern func_0200b04c
.extern func_02032a94
.extern func_0204cfa4
.extern func_020adc90

.global func_ov077_0221378c
func_ov077_0221378c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r0, .L_02213870
    mov r6, r1
    mov r5, r2
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_0221385c
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
    ble .L_0221385c
    mov r0, r4
    mov r1, r8
    bl func_020adc90
    mov r4, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    ldrb r1, [r6, #0x4d]
    cmp r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02213844
    ldr r1, [r7, #0x8c]
    sub r1, r1, r4
    str r1, [r7, #0x8c]
    ldr r1, [r7, #0x90]
    sub r1, r1, r0
    str r1, [r7, #0x90]
    ldr r1, [r6, #0x8c]
    add r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    add r0, r1, r0
    str r0, [r6, #0x90]
    b .L_0221385c
.L_02213844:
    ldr r1, [r7, #0x9c]
    sub r1, r1, r4
    str r1, [r7, #0x9c]
    ldr r1, [r7, #0xa0]
    sub r0, r1, r0
    str r0, [r7, #0xa0]
.L_0221385c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_02032a94
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02213870: .word data_02105310
.size func_ov077_0221378c, . - func_ov077_0221378c
