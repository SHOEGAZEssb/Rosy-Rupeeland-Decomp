.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern Sound_Play
.extern data_ov071_022123e0
.extern func_ov023_021fdf70
.extern func_ov042_021fd924
.extern func_ov042_0220a93c
.extern func_ov071_022119f4
.extern gSoundContext

.global func_ov071_02211a10
func_ov071_02211a10:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    ldr r0, [r10, #0x0]
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x8]
    mov r9, r2
    ldr r0, [r0, #0xc8]
    mov r8, r3
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    ldr r7, [sp, #0x38]
    movne r0, #0x0
    bne .L_02211c90
    mov r0, #0x14000
    str r0, [sp, #0x10]
    mov r0, #0x3c
    cmp r8, #0x6
    sub r6, r0, #0x1
    rsb r0, r9, #0x0
    streq r9, [sp, #0x10]
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x10]
    mov r5, #0x0
    rsb r0, r0, #0x0
    str r0, [sp, #0x4]
    add r4, r10, #0x4
.L_02211a84:
    add r0, r10, r6, lsl #0x2
    ldr r0, [r0, #0x964]
    cmp r0, #0x0
    blt .L_02211ba0
    mov r0, #0xc
    mul r11, r6, r0
    ldr r1, [sp, #0x0]
    add r0, r10, r11
    ldr r2, [r1, #0x4]
    ldr r1, [r0, #0x8]
    sub r2, r2, r1
    ldr r1, [sp, #0x8]
    str r2, [sp, #0xc]
    cmp r2, r1
    ble .L_02211ba0
    mov r1, r2
    cmp r1, r9
    bge .L_02211ba0
    ldr r1, [r0, #0xc]
    ldr r0, [sp, #0x0]
    ldr r0, [r0, #0x8]
    sub r1, r0, r1
    ldr r0, [sp, #0x4]
    cmp r1, r0
    ble .L_02211ba0
    ldr r0, [sp, #0x10]
    cmp r1, r0
    bge .L_02211ba0
    add r5, r5, #0x1
    mov r0, r10
    mov r1, r6
    bl func_ov071_022119f4
    cmp r8, #0x3
    bne .L_02211b20
    add r1, r4, r11
    ldr r0, [r10, #0x0]
    ldr r0, [r0, #0x14]
    bl func_ov023_021fdf70
    b .L_02211b80
.L_02211b20:
    mov r0, #0xc
    mul r11, r6, r0
    cmp r8, #0x4
    mov r1, #0x0
    bne .L_02211b5c
    ldr r0, [r10, #0x0]
    add r2, r4, r11
    ldr r0, [r0, #0x14]
    bl func_ov042_021fd924
    ldr r0, [r10, #0x0]
    add r1, r4, r11
    ldr r0, [r0, #0x18]
    mov r2, #0x80
    bl func_ov042_0220a93c
    b .L_02211b80
.L_02211b5c:
    ldr r0, [r10, #0x0]
    add r2, r4, r11
    ldr r0, [r0, #0x14]
    bl func_ov042_021fd924
    ldr r0, [r10, #0x0]
    add r1, r4, r11
    ldr r0, [r0, #0x18]
    mov r2, #0x100
    bl func_ov042_0220a93c
.L_02211b80:
    cmp r7, #0x0
    beq .L_02211ba0
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movgt r0, #0x1
    strgt r0, [r7, #0x0]
    movle r0, #0x2
    strle r0, [r7, #0x0]
.L_02211ba0:
    subs r6, r6, #0x1
    bpl .L_02211a84
    cmp r5, #0x0
    beq .L_02211c8c
    ldr r0, .L_02211c98
    cmp r8, #0x0
    ldr r1, [r0, #0x4]
    cmpne r8, #0x5
    eor r1, r1, #0x1
    str r1, [r0, #0x4]
    bne .L_02211c08
    ldr r0, .L_02211c98
    ldr r1, .L_02211c9c
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_02211bf4
    ldr r0, .L_02211ca0
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_02211c8c
.L_02211bf4:
    ldr r0, .L_02211ca0
    mov r2, #0xb
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_02211c8c
.L_02211c08:
    cmp r8, #0x1
    bne .L_02211c28
    ldr r0, .L_02211ca0
    ldr r1, .L_02211c9c
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    b .L_02211c8c
.L_02211c28:
    cmp r8, #0x2
    cmpne r8, #0x6
    bne .L_02211c4c
    ldr r0, .L_02211ca0
    ldr r1, .L_02211c9c
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl Sound_Play
    b .L_02211c8c
.L_02211c4c:
    cmp r8, #0x3
    bne .L_02211c6c
    ldr r0, .L_02211ca0
    ldr r1, .L_02211c9c
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    b .L_02211c8c
.L_02211c6c:
    cmp r8, #0x4
    cmpne r8, #0x7
    bne .L_02211c8c
    ldr r0, .L_02211ca0
    ldr r1, .L_02211c9c
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl Sound_Play
.L_02211c8c:
    mov r0, r5
.L_02211c90:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02211c98: .word data_ov071_022123e0
.L_02211c9c: .word 0x1d7
.L_02211ca0: .word gSoundContext
.size func_ov071_02211a10, . - func_ov071_02211a10
