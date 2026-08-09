.text
.extern func_ov042_021fd66c
.extern __construct_array
.extern func_ov042_021fcf9c
.extern func_ov042_021fcf80
.extern func_0209a208
.extern func_0209a07c
.extern data_ov042_0220b534
.global func_ov042_021fd6ac
func_ov042_021fd6ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r4, r1
    mov r9, r2
    bl func_ov042_021fd66c
    ldr r0, .L_021fd848
    ldr r5, .L_021fd84c
    str r0, [r10, #0x0]
    ldr r3, .L_021fd850
    add r0, r10, #0x4c
    mov r1, #0x64
    mov r2, #0xc
    str r5, [sp, #0x0]
    bl __construct_array
    add r0, r10, #0xfc
    mov r2, r5
    str r2, [sp, #0x0]
    ldr r3, .L_021fd850
    add r0, r0, #0x400
    mov r1, #0x64
    mov r2, #0xc
    bl __construct_array
    mov r1, r5
    add r0, r10, #0x3e8
    str r1, [sp, #0x0]
    ldr r3, .L_021fd850
    add r0, r0, #0xc00
    mov r1, #0x30
    mov r2, #0xc
    bl __construct_array
    mov r1, r5
    add r0, r10, #0x228
    str r1, [sp, #0x0]
    ldr r3, .L_021fd850
    add r0, r0, #0x1000
    mov r1, #0x30
    mov r2, #0xc
    bl __construct_array
    mov r0, #0x64
    str r4, [r10, #0x48]
    sub r3, r0, #0x1
    mvn r2, #0x0
.L_021fd758:
    add r1, r10, r3, lsl #0x2
    add r0, r3, #0x1
    str r2, [r1, #0xb3c]
    str r0, [r1, #0xd94]
    subs r3, r3, #0x1
    bpl .L_021fd758
    mov r0, #0x30
    mov r1, #0x0
    str r2, [r10, #0xf20]
    mov r6, #0x50000
    mvn r5, #0x63
    str r1, [r10, #0xf24]
    sub r8, r0, #0x1
    rsb r6, r6, #0x0
    add r4, r5, #0x63
    mov r7, #0x2
    mov r11, r1
.L_021fd79c:
    ldr r1, .L_021fd854
    str r9, [sp, #0x0]
    mov r2, r1
    mov r3, r1
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0xf28]
    str r11, [sp, #0x0]
    str r11, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0xf28]
    ldr ip, [ip, #0x0]
    mov r2, #0x80000
    mov r3, r6
    blx ip
    add r2, r10, r8, lsl #0x2
    ldr r1, [r2, #0xf28]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0xf28]
    str r5, [r0, #0x44]
    ldr r0, [r2, #0xf28]
    bl func_0209a07c
    add r0, r10, r8, lsl #0x2
    add r0, r0, #0x1000
    add r1, r8, #0x1
    str r4, [r0, #0x4c8]
    str r1, [r0, #0x588]
    subs r8, r8, #0x1
    bpl .L_021fd79c
    add r1, r10, #0x1000
    str r4, [r1, #0x644]
    mov r2, #0x0
    mov r0, r10
    str r2, [r1, #0x648]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fd848: .word data_ov042_0220b534
.L_021fd84c: .word func_ov042_021fcf9c
.L_021fd850: .word func_ov042_021fcf80
.L_021fd854: .word 0x21e6
.size func_ov042_021fd6ac, . - func_ov042_021fd6ac
