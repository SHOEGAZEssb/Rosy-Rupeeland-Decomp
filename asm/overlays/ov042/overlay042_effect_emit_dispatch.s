.text
.extern func_0209a2ac
.extern func_020befec
.extern func_ov042_021fdd48
.extern func_ov042_02203658
.extern genrand_int32
.extern func_020bf1f8
.global func_ov042_0220a720
func_ov042_0220a720:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r4, #0x74]
    cmp r0, #0x64
    bge .L_0220a7d0
    cmp r0, #0x2
    beq .L_0220a7d0
    ldr r0, [r4, #0x80]
    mov r1, #0x6
    bl func_020befec
    cmp r1, #0x0
    bne .L_0220a778
    ldr r0, [r4, #0x48]
    add r2, r4, #0x50
    ldr r0, [r0, #0x14]
    mov r1, #0x0
    bl func_ov042_021fdd48
    b .L_0220a7d0
.L_0220a778:
    add r0, sp, #0x0
    add r1, r4, #0x50
    bl func_ov042_02203658
    bl genrand_int32
    mov r1, #0x24
    bl func_020bf1f8
    ldr r2, [sp, #0x4]
    sub r0, r1, #0x12
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x4]
    bl genrand_int32
    mov r1, #0x24
    bl func_020bf1f8
    sub r0, r1, #0x12
    ldr r2, [sp, #0x8]
    mov r1, #0x1
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x48]
    add r2, sp, #0x0
    ldr r0, [r0, #0x14]
    bl func_ov042_021fdd48
.L_0220a7d0:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov042_0220a720, . - func_ov042_0220a720
