.text
.extern func_020946a8
.extern func_02093ffc
.extern func_02092288
.extern func_ov044_0220bdac
.extern func_ov044_0220c700
.extern func_02093de4
.extern func_020946c8
.extern func_02092260
.extern func_02094738
.extern func_ov044_0220be38
.extern func_ov044_0220c880
.extern data_ov044_0220d2b0

    .global func_ov044_0220ce28
func_ov044_0220ce28:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x228]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0x0
    beq .L_0220ce58
    cmp r0, #0x1
    beq .L_0220ce78
    cmp r0, #0x2
    beq .L_0220cee4
    b .L_0220cf4c
.L_0220ce58:
    mov r0, r4
    mov r1, #0x4
    bl func_020946a8
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
.L_0220ce78:
    mov r0, r4
    bl func_02093ffc
    cmp r0, #0x0
    beq .L_0220cec8
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0220ceb0
    mov r0, r5
    mov r1, #0x8
    bl func_02092288
.L_0220ceb0:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b .L_0220cee4
.L_0220cec8:
    ldr r0, [r5, #0x228]
    bl func_ov044_0220bdac
    cmp r0, #0x0
    beq .L_0220cf4c
    mov r0, r5
    bl func_ov044_0220c700
    b .L_0220cf4c
.L_0220cee4:
    mov r0, r4
    bl func_02093de4
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq .L_0220cf34
    add r1, r5, #0x30
    bl func_020946c8
    cmp r0, #0x0
    beq .L_0220cf4c
    mov r0, r5
    mov r1, #0x8
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b .L_0220cf4c
.L_0220cf34:
    mov r1, #0x6
    bl func_02094738
    ldr r1, .L_0220cf5c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
.L_0220cf4c:
    mov r0, r5
    bl func_ov044_0220c880
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0220cf5c: .word data_ov044_0220d2b0
.size func_ov044_0220ce28, . - func_ov044_0220ce28
