    .text
    .extern gFx32CosSinTable
    .extern data_ov008_021fc25c
    .extern VecFx32Object_InitCopy
    .extern VecFx32Object_Destroy
    .extern func_0209a2ac
    .extern Graphics3dPresentation_BindImmediateTexture
    .extern func_0209c7e8
    .extern func_0209c87c

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov008/overlay008_particles_render.c. */
    .global func_ov008_021fbe0c
func_ov008_021fbe0c: ; 0x021fbe0c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1ec
    mov r4, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r5, r0
    bl func_0209a2ac
    add r0, sp, #0x24
    mov r1, r4
    bl VecFx32Object_InitCopy
    ldr r6, L_021fc250
    add r8, sp, #0x194
    mov r4, #0x5
L_021fbe40:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r8!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne L_021fbe40
    ldmia r6, {r0, r1}
    stmia r8, {r0, r1}
    mov r7, #0x20000
    mov r6, #0x10000
    add r11, sp, #0x84
    mov r3, #0x0
    add ip, sp, #0x74
    add r4, sp, #0x44
    mov r0, #0x60000
    add r2, sp, #0x54
    add r1, sp, #0x64
    mov r8, #0x30000
    str r0, [r4, #0x0]
    mov r0, #0x48000
    str r3, [r4, #0x4]
    str r8, [r2, #0x0]
    str r0, [r1, #0x0]
    str r3, [r1, #0x4]
    str r3, [r2, #0x4]
    add r4, sp, #0x3c
    mov r8, #0x2f000
    mov r0, #0x1f000
    add r1, sp, #0x4c
    str r7, [sp, #0x34]
    str r6, [sp, #0x38]
    str r8, [r4, #0x0]
    str r0, [r4, #0x4]
    add r4, sp, #0x8c
    str r0, [r1, #0x4]
    str r3, [ip, #0x0]
    str r3, [ip, #0x4]
    mov ip, #0xf000
    str r6, [r11, #0x0]
    str r3, [r11, #0x4]
    stmia r4, {r0, ip}
    add r11, sp, #0x7c
    add r10, sp, #0x94
    str ip, [r11, #0x0]
    str ip, [r11, #0x4]
    mov r11, #0x7f000
    str r11, [r1, #0x0]
    add r1, sp, #0x5c
    mov r11, #0x47000
    str r11, [r1, #0x0]
    mov r11, #0x17000
    str r11, [r1, #0x4]
    add r1, sp, #0x6c
    str r11, [r1, #0x4]
    mov r11, #0x5f000
    add r2, sp, #0x9c
    str r7, [r10, #0x0]
    str r11, [r1, #0x0]
    str r3, [r10, #0x4]
    stmia r2, {r8, ip}
    add r9, sp, #0xa4
    stmia r9, {r3, r6}
    add lr, sp, #0xb4
    add r4, sp, #0xac
    str ip, [r4, #0x0]
    str r0, [r4, #0x4]
    str r6, [lr, #0x0]
    str r6, [lr, #0x4]
    add r10, sp, #0xc4
    add r11, sp, #0xbc
    add r9, sp, #0xcc
    add r4, sp, #0xd4
    str r7, [r10, #0x0]
    mov r7, #0xd0000
    str r6, [r10, #0x4]
    str r8, [r9, #0x0]
    str r0, [r9, #0x4]
    add lr, sp, #0xdc
    str r0, [r11, #0x0]
    str r0, [r11, #0x4]
    str r7, [r4, #0x0]
    str r3, [r4, #0x4]
    mov r4, #0xdf000
    stmia lr, {r4, ip}
    add r8, sp, #0x114
    add r11, sp, #0x10c
    add r9, sp, #0xfc
    add r10, sp, #0xf4
    add r2, sp, #0xe4
    add r1, sp, #0xec
    str r4, [r11, #0x0]
    str r0, [r11, #0x4]
    add r11, sp, #0x104
    str r7, [r8, #0x0]
    str r3, [r8, #0x4]
    mov r8, #0xe0000
    str r3, [r2, #0x4]
    str r8, [r2, #0x0]
    str ip, [r1, #0x4]
    str r7, [r10, #0x0]
    str r6, [r10, #0x4]
    add r10, sp, #0x11c
    str r4, [r9, #0x0]
    str r0, [r9, #0x4]
    str r8, [r11, #0x0]
    str r6, [r11, #0x4]
    stmia r10, {r4, ip}
    add r2, sp, #0x124
    mov r10, #0xf0000
    str r10, [r1, #0x0]
    add r11, sp, #0x12c
    str r8, [r2, #0x0]
    str r3, [r2, #0x4]
    stmia r11, {r10, ip}
    add r1, sp, #0x134
    add r9, sp, #0x13c
    add r2, sp, #0x144
    str r7, [r1, #0x0]
    str r6, [r1, #0x4]
    add r1, sp, #0x14c
    str r4, [r9, #0x0]
    str r0, [r9, #0x4]
    str r8, [r2, #0x0]
    str r6, [r2, #0x4]
    add r2, sp, #0x16c
    str r4, [r1, #0x0]
    str r0, [r1, #0x4]
    stmia r2, {r10, ip}
    add r9, sp, #0x15c
    stmia r9, {r4, ip}
    add r1, sp, #0x174
    add r11, sp, #0x154
    add lr, sp, #0x164
    add r2, sp, #0x184
    add r10, sp, #0x18c
    str r7, [r1, #0x0]
    str r6, [r1, #0x4]
    add r1, sp, #0x17c
    str r7, [r11, #0x0]
    str r3, [r11, #0x4]
    str r8, [lr, #0x0]
    str r3, [lr, #0x4]
    str r4, [r1, #0x0]
    str r0, [r1, #0x4]
    str r8, [r2, #0x0]
    str r6, [r2, #0x4]
    str r4, [r10, #0x0]
    str r0, [r10, #0x4]
    ldr r0, [r5, #0x48]
    mov r1, #0x1c
    ldr r0, [r0, #0x18]
    bl func_0209c7e8
    mov r0, #0x3c
    sub r4, r0, #0x1
    mvn r11, #0x0
L_021fc0a4:
    add r0, r5, r4, lsl #0x2
    ldr r2, [r0, #0x754]
    cmp r2, #0x1
    blt L_021fc220
    add r1, sp, #0x194
    ldr r10, [r1, r2, lsl #0x2]
    add r1, r5, r4, lsl #0x1
    add r1, r1, #0x400
    ldrh r1, [r1, #0xfc]
    cmp r2, #0xa
    ldrge r0, [r0, #0x664]
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x1
    ldr r1, L_021fc254
    mov r3, r2, lsl #0x1
    add r1, r1, r2, lsl #0x1
    ldrsh r2, [r1, #0x2]
    ldr r1, L_021fc254
    andge r0, r0, #0x4
    addge r10, r10, r0, asr #0x1
    add r6, r5, r4, lsl #0x2
    ldr r0, [r6, #0x4c]
    rsb r9, r2, #0x0
    ldrsh r1, [r1, r3]
    rsb r8, r10, #0x0
    ldr r0, [r0, #0x30]
    sub r7, r9, r1
    mla r0, r8, r7, r0
    mov r0, r0, asr #0xc
    str r0, [sp, #0x4]
    add lr, r1, r9
    mul r3, r1, r8
    mul r0, r1, r10
    ldr r1, [r6, #0x4c]
    mul r2, r9, r10
    ldr ip, [r1, #0x34]
    mul r1, r9, r8
    mla r9, r8, lr, ip
    mov r8, r9, asr #0xc
    str r8, [sp, #0x8]
    ldr r9, [r6, #0x4c]
    sub r8, r2, r3
    ldr r9, [r9, #0x30]
    add r2, r3, r2
    add r3, r0, r1
    add r8, r9, r8
    sub r0, r1, r0
    mov r1, r8, asr #0xc
    str r1, [sp, #0xc]
    ldr r1, [r6, #0x4c]
    ldr r1, [r1, #0x34]
    add r1, r1, r3
    mov r1, r1, asr #0xc
    str r1, [sp, #0x10]
    ldr r1, [r6, #0x4c]
    ldr r1, [r1, #0x30]
    mla r1, r10, r7, r1
    mov r1, r1, asr #0xc
    str r1, [sp, #0x14]
    ldr r1, [r6, #0x4c]
    ldr r1, [r1, #0x34]
    mla r1, r10, lr, r1
    mov r1, r1, asr #0xc
    str r1, [sp, #0x18]
    ldr r1, [r6, #0x4c]
    ldr r1, [r1, #0x30]
    add r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1c]
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0x34]
    add r0, r0, r2
    mov r0, r0, asr #0xc
    str r0, [sp, #0x20]
    ldr r0, [r6, #0x754]
    mov r2, #0x0
    cmp r0, #0xa
    ldr r0, [r5, #0x48]
    movge r1, #0x0
    ldr r0, [r0, #0x18]
    movlt r1, #0x1c
    bl Graphics3dPresentation_BindImmediateTexture
    str r11, [sp, #0x0]
    add r3, r5, r4, lsl #0x1
    ldr r0, [r5, #0x48]
    add r2, r5, r4, lsl #0x2
    add r3, r3, #0x800
    ldr r6, [r2, #0x754]
    add r2, sp, #0x34
    ldrh r3, [r3, #0x44]
    ldr r0, [r0, #0x18]
    add r1, sp, #0x4
    add r2, r2, r6, lsl #0x4
    bl func_0209c87c
    b L_021fc238
L_021fc220:
    cmp r2, #0x0
    bne L_021fc238
    ldr r0, [r0, #0x4c]
    add r1, sp, #0x24
    mov r2, #0x1
    bl func_0209a2ac
L_021fc238:
    subs r4, r4, #0x1
    bpl L_021fc0a4
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    add sp, sp, #0x1ec
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fc250: .word data_ov008_021fc25c
L_021fc254: .word gFx32CosSinTable

    .size func_ov008_021fbe0c, . - func_ov008_021fbe0c
