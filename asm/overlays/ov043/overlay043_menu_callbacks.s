.text
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_ov043_0220b744
.extern func_02095860
.extern func_02092260
.extern func_ov043_0220bd24
.extern data_020f4e14
.extern gDebugFont
.extern data_ov043_0220c448
.extern data_ov043_0220c490
.extern data_ov043_0220c488
.extern data_ov043_0220c458

    .global func_ov043_0220bd58
func_ov043_0220bd58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_0220bda4
    ldr r0, .L_0220bdac
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, .L_0220bdb0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, .L_0220bdb4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
.L_0220bda4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220bdac: .word data_020f4e14
.L_0220bdb0: .word gDebugFont
.L_0220bdb4: .word data_ov043_0220c448
.size func_ov043_0220bd58, . - func_ov043_0220bd58

    .global func_ov043_0220bdb8
func_ov043_0220bdb8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0220bdd8
    cmp r0, #0x1
    beq .L_0220bde8
    b .L_0220beb8
.L_0220bdd8:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0220bde8:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq .L_0220beb8
    add r0, r4, #0x13c
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq .L_0220be3c
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    mov r0, #0x0
    ldr r1, .L_0220bec8
    str r0, [r4, #0x58]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    b .L_0220beb8
.L_0220be3c:
    add r0, r4, #0x1e8
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq .L_0220be80
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    mov r0, #0x1
    ldr r1, .L_0220becc
    str r0, [r4, #0x58]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    b .L_0220beb8
.L_0220be80:
    add r0, r4, #0x90
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq .L_0220beb8
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, .L_0220bed0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
.L_0220beb8:
    mov r0, r4
    bl func_ov043_0220bd24
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220bec8: .word data_ov043_0220c490
.L_0220becc: .word data_ov043_0220c488
.L_0220bed0: .word data_ov043_0220c458
.size func_ov043_0220bdb8, . - func_ov043_0220bdb8

