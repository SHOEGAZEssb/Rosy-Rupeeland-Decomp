.text
.extern func_ov044_0220bb60
.extern func_ov044_0220baa0
.extern func_ov044_0220bba4

    .global func_ov044_0220bdac
func_ov044_0220bdac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x44]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne .L_0220be2c
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0220be24
    mov r0, #0x18
    mul r1, r3, r0
    ldr r0, [r4, #0x4]
    rsb r1, r1, #0x20
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x44]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl func_ov044_0220bb60
    ldr r1, [r4, #0x44]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl func_ov044_0220baa0
    mov r0, r4
    bl func_ov044_0220bba4
.L_0220be24:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0220be2c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov044_0220bdac, . - func_ov044_0220bdac

    .global func_ov044_0220be34
func_ov044_0220be34:
    bx lr
.size func_ov044_0220be34, . - func_ov044_0220be34

    .global func_ov044_0220be38
func_ov044_0220be38:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
.size func_ov044_0220be38, . - func_ov044_0220be38
