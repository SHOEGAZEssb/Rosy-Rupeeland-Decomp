.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern func_ov078_02213574

.global func_ov095_02217c40
func_ov095_02217c40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x314]
    mov r9, r1
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_02217d44
    mov r11, #0x1
    mov r7, #0x0
    mov r8, r7
    mov r5, r11
    mov r6, r11
    ldr r4, .L_02217d54
    b .L_02217d1c
.L_02217c78:
    ldr r0, [r4, #0x0]
    mov r1, r6
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    cmpne r0, r10
    beq .L_02217d18
    ldrb r2, [r0, #0x4d]
    cmp r2, #0x3
    moveq r1, r11
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02217cc8
    ldrh r1, [r0, #0x4e]
    cmp r1, #0x5
    bne .L_02217cc8
    ldr r1, [r10, #0x300]
    cmp r1, #0x0
    streq r0, [r10, #0x300]
    b .L_02217d18
.L_02217cc8:
    cmp r2, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02217d18
    cmp r7, #0x4
    bge .L_02217d18
    ldrb r2, [r0, #0x27e]
    mov r1, #0x0
    add r2, r2, #0xff
    and r2, r2, #0xff
    cmp r2, #0x1f
    bhi .L_02217d08
    mov r2, r5, lsl r2
    tst r2, #0x90000007
    movne r1, r5
.L_02217d08:
    cmp r1, #0x0
    addne r1, r10, r7, lsl #0x2
    strne r0, [r1, #0x304]
    addne r7, r7, #0x1
.L_02217d18:
    add r8, r8, #0x1
.L_02217d1c:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r8, r0
    blt .L_02217c78
    ldr r0, [r10, #0x314]
    bic r0, r0, #0x1
    str r0, [r10, #0x314]
.L_02217d44:
    mov r0, r10
    mov r1, r9
    bl func_ov078_02213574
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217d54: .word data_021052fc
.size func_ov095_02217c40, . - func_ov095_02217c40
