.text
.extern func_02091e28
.extern func_02092798
.extern func_02071ea4
.extern func_020957bc
.extern func_02006268
.extern func_02095820
.extern func_02092814
.extern func_ov043_0220ba28
.extern func_ov043_0220bc2c
.extern func_ov043_0220b744
.extern data_ov043_0220c4bc
.extern gGameWork
.extern data_ov043_0220c480

    .global func_ov043_0220b76c
func_ov043_0220b76c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02091e28
    ldr r1, .L_0220b854
    add r0, r4, #0x5c
    str r1, [r4, #0x0]
    bl func_02092798
    add r0, r4, #0x80
    bl func_02071ea4
    add r0, r4, #0x90
    bl func_020957bc
    add r0, r4, #0x13c
    bl func_020957bc
    add r0, r4, #0x1e8
    bl func_020957bc
    add r0, r4, #0x2dc
    bl func_02006268
    add r0, r4, #0x2e8
    bl func_02006268
    mov r0, #0x0
    str r0, [r4, #0x2f4]
    str r0, [r4, #0x8c]
    str r0, [r4, #0x58]
    str r0, [r4, #0x298]
    str r0, [r4, #0x294]
    ldr r1, .L_0220b858
    add r0, r4, #0x13c
    ldr r2, [r1, #0x0]
    mov r1, #0x48
    add r2, r2, #0x200
    ldrsh r3, [r2, #0x6]
    mov r2, #0x50
    str r3, [r4, #0x54]
    bl func_02095820
    add r0, r4, #0x1e8
    mov r1, #0xb8
    mov r2, #0x50
    bl func_02095820
    add r0, r4, #0x90
    mov r1, #0xe8
    mov r2, #0xa0
    bl func_02095820
    add r0, r4, #0x5c
    ldr r1, .L_0220b85c
    bl func_02092814
    mov r0, r4
    bl func_ov043_0220ba28
    mov r0, r4
    bl func_ov043_0220bc2c
    ldr r1, [r4, #0x20]
    mov r0, r4
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    ldr r1, .L_0220b860
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220b854: .word data_ov043_0220c4bc
.L_0220b858: .word gGameWork
.L_0220b85c: .word 0x7005
.L_0220b860: .word data_ov043_0220c480
.size func_ov043_0220b76c, . - func_ov043_0220b76c

