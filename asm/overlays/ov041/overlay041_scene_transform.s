.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_transform.c. */
.extern data_020c9670
.extern data_ov041_02204c58
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_0209a2ac
.extern Graphics3dPresentation_BeginFrame
.extern func_0209c7e8
.extern func_0209c87c

    .global func_ov041_021fffc8
func_ov041_021fffc8: ; 0x021fffc8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xf4
    str r1, [sp, #0x4]
    mov r1, #0x0
    mov r2, #0x1
    mov r6, r0
    bl func_0209a2ac
    ldr r1, [sp, #0x4]
    add r0, sp, #0x54
    bl VecFx32Object_InitCopy
    ldr r0, [r6, #0x1a8]
    add r0, r0, #0x1
    str r0, [r6, #0x1a8]
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_02200040
    mov r0, #0xc
    sub r7, r0, #0x1
    add r5, sp, #0x54
    mov r4, #0x1
.L_02200020:
    add r0, r6, r7, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, r5
    mov r2, r4
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_02200020
    b .L_0220032c
.L_02200040:
    cmp r0, #0x1
    bne .L_0220032c
    ldr r7, .L_0220033c
    add r4, sp, #0x30
    mov r5, #0x2
.L_02200054:
    ldmia r7!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_02200054
    ldr ip, [r7, #0x0]
    mov r11, #0x0
    str ip, [r4, #0x0]
    add r1, sp, #0xc4
    mov ip, #0x30000
    add r0, sp, #0xd4
    str ip, [r1, #0x0]
    mov ip, #0x48000
    add r4, sp, #0xe4
    str r11, [r1, #0x4]
    mov r1, #0x60000
    str ip, [r0, #0x0]
    str r11, [r0, #0x4]
    str r1, [r4, #0x0]
    str r11, [r4, #0x4]
    add ip, sp, #0x6c
    mov r0, #0xf000
    add r10, sp, #0x74
    mov r9, #0x10000
    str r11, [sp, #0x64]
    str r11, [sp, #0x68]
    str r0, [ip, #0x0]
    str r0, [ip, #0x4]
    stmia r10, {r9, r11}
    add r1, sp, #0x7c
    mov r10, #0x1f000
    add r8, sp, #0x84
    mov r7, #0x20000
    str r10, [r1, #0x0]
    str r0, [r1, #0x4]
    stmia r8, {r7, r11}
    add r5, sp, #0x94
    add r2, sp, #0xb4
    str r11, [r5, #0x0]
    str r9, [r5, #0x4]
    str r7, [r2, #0x0]
    str r9, [r2, #0x4]
    add r4, sp, #0x8c
    mov r11, #0x2f000
    add r5, sp, #0xcc
    mov r7, #0x47000
    mov r2, #0x17000
    str r7, [r5, #0x0]
    str r2, [r5, #0x4]
    add r7, sp, #0xdc
    mov r5, #0x5f000
    add ip, sp, #0x9c
    str r5, [r7, #0x0]
    str r11, [r4, #0x0]
    str r0, [r4, #0x4]
    stmia ip, {r0, r10}
    add r3, sp, #0xa4
    add r1, sp, #0xac
    add r8, sp, #0xbc
    str r9, [r3, #0x0]
    str r9, [r3, #0x4]
    str r10, [r1, #0x0]
    str r10, [r1, #0x4]
    str r11, [r8, #0x0]
    str r10, [r8, #0x4]
    str r2, [r7, #0x4]
    add r1, sp, #0xec
    mov r0, #0x7f000
    stmia r1, {r0, r10}
    ldr r0, [r6, #0x48]
    ldr r1, [sp, #0x4]
    ldr r0, [r0, #0x18]
    bl Graphics3dPresentation_BeginFrame
    ldr r0, [r6, #0x48]
    mov r1, #0x1c
    ldr r0, [r0, #0x18]
    bl func_0209c7e8
    ldr r0, .L_02200340
    ldr r5, [r6, #0x1ac]
    sub r0, r0, #0x8000
    str r0, [sp, #0xc]
    b .L_02200314
.L_02200198:
    ldr r0, [r6, #0x80]
    mov r4, r5, lsl #0x1
    ldrsh r2, [r0, r4]
    ldr r0, [sp, #0xc]
    cmp r2, r0
    ble .L_02200314
    ldr r1, [r6, #0x94]
    add r0, sp, #0x30
    ldr lr, [r0, r2, lsl #0x2]
    ldrh r1, [r1, r4]
    rsb r0, r5, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x4
    str r0, [sp, #0x8]
    mov r1, r1, lsl #0x1
    ldr r0, .L_02200344
    mov r2, r1, lsl #0x1
    add r0, r0, r1, lsl #0x1
    ldrsh r1, [r0, #0x2]
    ldr r0, .L_02200344
    rsb r9, lr, #0x0
    ldrsh r3, [r0, r2]
    rsb r10, r1, #0x0
    mov r0, #0xc
    mul r2, r5, r0
    ldr r1, [r6, #0x84]
    sub ip, r10, r3
    add r1, r1, r2
    ldr r1, [r1, #0x4]
    add r0, r3, r10
    mla r1, r9, ip, r1
    mov r1, r1, asr #0xc
    str r1, [sp, #0x10]
    mul r7, r3, r9
    mul r1, r3, lr
    ldr r3, [r6, #0x84]
    mul r11, r10, lr
    add r3, r3, r2
    ldr r8, [r3, #0x8]
    mul r3, r10, r9
    mla r8, r9, r0, r8
    mov r8, r8, asr #0xc
    str r8, [sp, #0x14]
    ldr r8, [r6, #0x84]
    sub r9, r11, r7
    add r8, r8, r2
    ldr r10, [r8, #0x4]
    add r8, r1, r3
    add r10, r10, r9
    sub r9, r3, r1
    mov r1, r10, asr #0xc
    str r1, [sp, #0x18]
    ldr r3, [r6, #0x84]
    add r7, r7, r11
    add r3, r3, r2
    ldr r10, [r3, #0x8]
    ldr r3, .L_02200340
    add r8, r10, r8
    mov r8, r8, asr #0xc
    str r8, [sp, #0x1c]
    ldr r8, [r6, #0x84]
    add r1, sp, #0x10
    add r8, r8, r2
    ldr r8, [r8, #0x4]
    mla r8, lr, ip, r8
    mov r8, r8, asr #0xc
    str r8, [sp, #0x20]
    ldr r8, [r6, #0x84]
    add r8, r8, r2
    ldr r8, [r8, #0x8]
    mla r0, lr, r0, r8
    mov r0, r0, asr #0xc
    str r0, [sp, #0x24]
    ldr r0, [r6, #0x84]
    add r0, r0, r2
    ldr r0, [r0, #0x4]
    add r0, r0, r9
    mov r0, r0, asr #0xc
    str r0, [sp, #0x28]
    ldr r0, [r6, #0x84]
    add r0, r0, r2
    ldr r0, [r0, #0x8]
    add r0, r0, r7
    mov r0, r0, asr #0xc
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x8]
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x80]
    ldr r2, [r6, #0x48]
    ldrsh r4, [r0, r4]
    ldr r0, [r2, #0x18]
    add r2, sp, #0x64
    add r2, r2, r4, lsl #0x4
    bl func_0209c87c
.L_02200314:
    subs r5, r5, #0x1
    bpl .L_02200198
    ldr r0, [r6, #0x7c]
    ldr r1, [sp, #0x4]
    mov r2, #0x1
    bl func_0209a2ac
.L_0220032c:
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220033c: .word data_ov041_02204c58
.L_02200340: .word 0x7fff
.L_02200344: .word data_020c9670
    .size func_ov041_021fffc8, . - func_ov041_021fffc8

