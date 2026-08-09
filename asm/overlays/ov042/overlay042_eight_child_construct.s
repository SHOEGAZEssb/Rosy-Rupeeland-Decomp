.text
.extern func_ov042_021fd66c
.extern func_0209a208
.extern data_ov042_0220b6a0
.global func_ov042_0220a7d8
func_ov042_0220a7d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r4, r1
    mov r9, r2
    bl func_ov042_021fd66c
    ldr r1, .L_0220a8a4
    mov r0, #0x8
    str r1, [r10, #0x0]
    str r4, [r10, #0x48]
    ldr r6, .L_0220a8a8
    sub r8, r0, #0x1
    mov r7, #0x1
    mov r5, #0x0
    mvn r4, #0x63
.L_0220a814:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    mov r2, r5
    mov r3, r5
    ldr ip, [ip, #0x0]
    blx ip
    add r3, r10, r8, lsl #0x2
    ldr r2, [r3, #0x4c]
    add r0, r8, #0x1
    ldrh r1, [r2, #0x42]
    subs r8, r8, #0x1
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r1, [r3, #0x4c]
    str r4, [r1, #0x44]
    str r0, [r3, #0x6c]
    bpl .L_0220a814
    mvn r0, #0x0
    str r0, [r10, #0x88]
    mov r1, #0x0
    mov r0, r10
    str r1, [r10, #0x8c]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0220a8a4: .word data_ov042_0220b6a0
.L_0220a8a8: .word 0x21e6
.size func_ov042_0220a7d8, . - func_ov042_0220a7d8
