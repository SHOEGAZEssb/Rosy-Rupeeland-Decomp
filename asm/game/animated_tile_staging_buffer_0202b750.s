; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text
.extern MI_CpuCopy8

    .global func_0202b750
    .type func_0202b750, @function
func_0202b750: ; 0x0202b750
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    add r3, r5, #0x1000
    mov r4, #0x3
    str r4, [r3, #0x80c]
    mov ip, #0x0
    str ip, [r3, #0x810]
    str ip, [r3, #0x814]
    mov r4, r2
    str ip, [r3, #0x818]
    ldr r2, [r4, #0x0]
    cmp r2, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r3, #0x818]
    mov r2, #0x800
    orr r0, r0, #0x1
    str r0, [r3, #0x818]
    ldr r6, [r1, #0x4]
    mov r1, r5
    add r0, r6, #0x6800
    bl MI_CpuCopy8
    add r0, r6, #0x7000
    add r1, r5, #0x800
    mov r2, #0x800
    bl MI_CpuCopy8
    add r0, r6, #0x7800
    add r1, r5, #0x1000
    mov r2, #0x800
    bl MI_CpuCopy8
    add r0, r5, #0x4
    add r1, r4, #0x4
    ldr r4, .L_0202b830
    mov r3, #0x0
    add r0, r0, #0x1800
.L_0202b7d8:
    mov r2, r3, lsl #0x1
    ldrsh ip, [r1, r2]
    ldrsh lr, [r0, r2]
    add r3, r3, #0x1
    mov ip, ip, lsl #0x1c
    mov ip, ip, asr #0x1c
    bic lr, lr, #0xf
    and ip, ip, #0xf
    orr ip, lr, ip
    strh ip, [r0, r2]
    ldrsh ip, [r1, r2]
    ldrsh lr, [r0, r2]
    cmp r3, #0x4
    mov ip, ip, lsl #0x10
    mov ip, ip, asr #0x14
    and lr, lr, r4
    mov ip, ip, lsl #0x14
    orr ip, lr, ip, lsr #0x10
    strh ip, [r0, r2]
    blt .L_0202b7d8
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
.L_0202b830: .word 0xffff000f
    .size func_0202b750, . - func_0202b750
