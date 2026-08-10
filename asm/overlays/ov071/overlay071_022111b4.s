.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern GameWork_TestFlag
.extern data_020cd470
.extern data_ov071_0221223c
.extern func_0200500c
.extern func_02005058
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_0209a2ac
.extern func_0209b7a0
.extern func_0209d640
.extern func_020b0880
.extern func_020befec
.extern func_ov071_02211e98
.extern gGameWork

.global func_ov071_022111b4
func_ov071_022111b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r9, r1
    mov r8, r2
    mov r10, r0
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xc0]
    mov r1, r9
    add r0, r0, #0x1
    str r0, [r10, #0xc0]
    ldr r0, [r10, #0xec]
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0xf0]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x1f4]
    cmp r0, #0x0
    beq .L_02211220
    ldr r0, [r10, #0xf4]
    mov r1, r9
    mov r2, #0x1
    bl func_0209a2ac
.L_02211220:
    ldr r5, .L_02211388
    add r4, sp, #0x10
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    ldr r0, .L_0221138c
    ldr r1, .L_02211390
    ldr r0, [r0, #0x0]
    ldr r4, [r10, #0xd8]
    mov r5, #0x0
    bl GameWork_TestFlag
    cmp r0, #0x0
    addne r0, r4, r4, lsr #0x1f
    movne r4, r0, asr #0x1
    mov r7, #0x0
    add r11, sp, #0x10
.L_02211264:
    ldr r6, [r11, r7, lsl #0x2]
    mov r0, r4
    mov r1, r6
    bl func_020befec
    cmp r0, #0x0
    bne .L_02211284
    cmp r7, #0x6
    bne .L_02211288
.L_02211284:
    mov r5, #0x1
.L_02211288:
    cmp r5, #0x0
    addeq r0, r10, r7, lsl #0x2
    ldreq r1, [r0, #0x6c]
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    beq .L_022112cc
    mul r3, r0, r6
    add r1, r10, r7, lsl #0x2
    ldr r2, [r1, #0x6c]
    and r1, r0, #0xff
    ldr r0, [r2, #0xc]
    sub r4, r4, r3
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r10, r7, lsl #0x2
    ldr r1, [r0, #0x6c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
.L_022112cc:
    add r7, r7, #0x1
    strh r0, [r1, #0x42]
    cmp r7, #0x7
    blt .L_02211264
    ldr r1, [r10, #0x6c]
    ldr r0, [r10, #0x88]
    ldrh r1, [r1, #0x42]
    mov r4, #0x0
    mov r5, #0x1
    strh r1, [r0, #0x42]
    ldr r1, [r10, #0x78]
    ldr r0, [r10, #0x8c]
    ldrh r1, [r1, #0x42]
    strh r1, [r0, #0x42]
.L_02211304:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x6c]
    mov r1, r9
    mov r2, r5
    bl func_0209a2ac
    add r4, r4, #0x1
    cmp r4, #0xa
    blt .L_02211304
    ldr r0, [r10, #0x48]
    mov r1, r9
    ldr r0, [r0, #0x20]
    bl func_0209b7a0
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    ldr r0, [r10, #0x48]
    add r3, sp, #0x0
    ldr r0, [r0, #0x20]
    mov r2, r8
    mov r1, #0x0
    bl func_0209d640
    ldr r1, .L_02211394
    ldrsh r0, [r1, #0x70]
    ldrsh r1, [r1, #0x72]
    bl func_020b0880
    ldr r0, [r10, #0xe8]
    bl func_ov071_02211e98
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02211388: .word data_ov071_0221223c
.L_0221138c: .word gGameWork
.L_02211390: .word 0x306
.L_02211394: .word data_020cd470
.size func_ov071_022111b4, . - func_ov071_022111b4
