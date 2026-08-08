.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern func_ov039_021fce00
    .extern func_02004fe0
    .extern func_0209a208
    .extern func_0209a2a4
    .extern func_ov039_0220608c
    .extern data_ov039_02208498
    .global func_ov039_022058d8
func_ov039_022058d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r9, r0
    mov r4, r1
    mov r8, r2
    bl func_ov039_021fce00
    ldr r1, L_02205b7c
    add r0, r9, #0x84
    str r1, [r9, #0x0]
    bl func_02004fe0
    add r0, r9, #0x94
    bl func_02004fe0
    add r0, r9, #0xc4
    bl func_02004fe0
    str r4, [r9, #0x80]
    str r8, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, L_02205b80
    sub r2, r1, #0x35
    add r3, r1, #0x1
    bl func_0209a208
    str r0, [r9, #0x48]
    mov r0, #0x10000
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, [r9, #0x48]
    mov r2, #0x200000
    mov r3, #0x1e0000
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    mov r2, #0x8
    ldr r0, [r9, #0x48]
    mov r1, r9
    strh r2, [r0, #0x40]
    ldr r0, [r9, #0x48]
    bl func_0209a2a4
    mov r0, #0x8
    strb r0, [r9, #0xa4]
    str r8, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, L_02205b84
    ldr r2, L_02205b88
    add r3, r1, #0x1
    bl func_0209a208
    str r0, [r9, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, [r9, #0x4c]
    mov r2, #0x200000
    mov r3, #0x1e0000
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    str r8, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, L_02205b8c
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r9, #0x50]
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r1, [r9, #0x50]
    mov r3, r2
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    ldr r0, [r9, #0x50]
    ldr r1, [r9, #0x48]
    bl func_0209a2a4
    mov r0, #0xa
    ldr r5, L_02205b90
    sub r7, r0, #0x1
    mov r6, #0x2
    mov r4, #0x0
L_02205a40:
    str r8, [sp, #0x0]
    mov r0, r9
    mov r1, r5
    add r2, r5, #0x1
    add r3, r5, #0x2
    str r6, [sp, #0x4]
    bl func_0209a208
    mov r3, r7, lsr #0x1f
    rsb r2, r3, r7, lsl #0x1e
    add r1, r9, r7, lsl #0x2
    str r0, [r1, #0x58]
    add r0, r3, r2, ror #0x1e
    mov r0, r0, lsl #0x1
    str r4, [sp, #0x0]
    and r0, r0, #0xff
    str r0, [sp, #0x4]
    mov r0, r9
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x58]
    ldr ip, [ip, #0x0]
    mov r2, r4
    mov r3, r4
    blx ip
    add r0, r9, r7, lsl #0x2
    ldr r0, [r0, #0x58]
    ldr r1, [r9, #0x48]
    bl func_0209a2a4
    subs r7, r7, #0x1
    bpl L_02205a40
    mov r1, #0x1040
    str r8, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r9
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r9, #0x54]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r9
    ldr r4, [r0, #0x0]
    ldr r1, [r9, #0x54]
    ldr r4, [r4, #0x0]
    mov r2, #0x200000
    mov r3, #0x1c0000
    blx r4
    ldr r3, [r9, #0x54]
    mvn r2, #0x59
    ldrh r0, [r3, #0x42]
    mov r1, #0x0
    orr r0, r0, #0x4
    strh r0, [r3, #0x42]
    ldr r0, [r9, #0x54]
    str r2, [r0, #0x44]
    add r0, r2, #0x1ec0
    str r0, [r9, #0xa8]
    strh r1, [r9, #0xb8]
    strh r1, [r9, #0xb6]
    strh r1, [r9, #0xb4]
    str r1, [r9, #0xb0]
    str r1, [r9, #0xac]
    mov r1, #0x64
    mov r0, r9
    strh r1, [r9, #0xba]
    bl func_ov039_0220608c
    mov r0, #0x200
    strh r0, [r9, #0xc0]
    mov r1, #0x0
    strh r1, [r9, #0xc2]
    str r1, [r9, #0xd0]
    str r1, [r9, #0xcc]
    str r1, [r9, #0xc8]
    str r1, [r9, #0xd4]
    mov r0, r9
    strh r1, [r9, #0xbe]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_02205b7c: .word data_ov039_02208498
L_02205b80: .word 0x1036
L_02205b84: .word 0x1386
L_02205b88: .word 0x1001
L_02205b8c: .word 0x16a3
L_02205b90: .word 0x1038
    .size func_ov039_022058d8, .-func_ov039_022058d8
