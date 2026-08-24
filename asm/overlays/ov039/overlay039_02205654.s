.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern func_020befec
    .extern RuntimePresentationManager_GetGraphics3dPresentation
    .extern func_0209b7ec
    .extern func_0209b880
    .extern data_ov039_022080de
    .extern data_ov039_022080d6
    .extern data_ov039_022080ce
    .extern data_ov039_022080e8
    .extern data_ov039_02208158
    .extern gGamePhaseRuntime
    .global func_ov039_02205654
func_ov039_02205654:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x22c
    ldr r3, L_022058ac
    mov ip, r1
    add r2, sp, #0x1c
    mov r4, r0
    mov r1, #0x4
L_02205670:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_02205670
    ldr r3, L_022058b0
    add r2, sp, #0x14
    mov r1, #0x4
L_0220568c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_0220568c
    ldr r3, L_022058b4
    add r2, sp, #0xc
    mov r1, #0x4
L_022056a8:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_022056a8
    mov r8, #0x0
    mov r7, #0x3f000
    ldr r0, L_022058b8
    add r6, sp, #0x1a4
    mov r5, #0xf000
    str r8, [sp, #0x19c]
    str r7, [sp, #0x1a0]
    stmia r6, {r5, r7}
    add r11, sp, #0x1bc
    add r3, sp, #0x1c4
    add r10, sp, #0x1ac
    add lr, sp, #0x1b4
    add r9, sp, #0x24
    ldmia r0, {r0, r1, r2}
    stmia r9, {r0, r1, r2}
    mov r1, #0x1f000
    add r9, sp, #0x1cc
    mov r0, #0xe0000
    mov r6, #0x7f000
    str r8, [r10, #0x0]
    str r1, [r10, #0x4]
    str r1, [lr, #0x4]
    str r5, [lr, #0x0]
    str r5, [r3, #0x0]
    str r8, [r3, #0x4]
    str r8, [r11, #0x0]
    str r8, [r11, #0x4]
    stmia r9, {r0, r6}
    add r7, sp, #0x1d4
    mov r5, #0xef000
    stmia r7, {r5, r6}
    mov r8, #0x5f000
    add r7, sp, #0x1dc
    stmia r7, {r0, r8}
    add r2, sp, #0x1ec
    mov r9, #0x40000
    stmia r2, {r0, r9}
    add r3, sp, #0x1e4
    stmia r3, {r5, r8}
    add r10, sp, #0x1f4
    stmia r10, {r5, r9}
    add r1, sp, #0x1fc
    mov r7, #0xf0000
    add lr, sp, #0x204
    mov r0, #0xff000
    str r7, [r1, #0x0]
    str r6, [r1, #0x4]
    stmia lr, {r0, r6}
    add r11, sp, #0x20c
    stmia r11, {r7, r8}
    add r1, sp, #0x214
    stmia r1, {r0, r8}
    add r2, sp, #0x21c
    stmia r2, {r7, r9}
    add r1, sp, #0x224
    ldr r6, L_022058bc
    stmia r1, {r0, r9}
    add r5, sp, #0x30
    mov r7, #0x16
L_022057a4:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r7, r7, #0x1
    bne L_022057a4
    ldmia r6, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    mov r0, ip
    mov r1, #0xa
    bl func_020befec
    mov r5, r0
    cmp r5, #0x4
    addls pc, pc, r5, lsl #0x2
    b L_022057fc
L_022057d8: ; jump table
    b L_022057ec ; case 0
    b L_022057ec ; case 1
    b L_022057ec ; case 2
    b L_022057f4 ; case 3
    b L_022057f4 ; case 4
L_022057ec:
    add r6, sp, #0xc
    b L_02205800
L_022057f4:
    add r6, sp, #0x14
    b L_02205800
L_022057fc:
    add r6, sp, #0x1c
L_02205800:
    ldr r0, L_022058c0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x0
    mov r7, r0
    bl func_0209b7ec
    add r9, r4, #0x13c
    add r2, sp, #0x30
    rsb r1, r5, #0x6
    mov r0, #0x34
    mov r3, #0xd
    mla r8, r1, r0, r2
    sub r5, r3, #0x1
    mov r10, #0x3
    add r4, sp, #0x19c
    mov r11, #0x6
L_02205848:
    mov r2, r5, lsr #0x1f
    rsb r0, r2, r5, lsl #0x1e
    add r0, r2, r0, ror #0x1e
    rsb r1, r2, r5, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    sub r1, r1, #0x64
    mov r1, r1, lsl #0x10
    str r10, [sp, #0x0]
    mov r0, r0, lsl #0x1
    ldrh r3, [r6, r0]
    mov r2, r1, asr #0x10
    mov r0, #0x24
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    ldr r2, [r8, r5, lsl #0x2]
    mla r1, r5, r0, r9
    mul r3, r2, r11
    mov r0, r7
    add r2, sp, #0x24
    add r3, r4, r3, lsl #0x3
    bl func_0209b880
    subs r5, r5, #0x1
    bpl L_02205848
    add sp, sp, #0x22c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_022058ac: .word data_ov039_022080de
L_022058b0: .word data_ov039_022080d6
L_022058b4: .word data_ov039_022080ce
L_022058b8: .word data_ov039_022080e8
L_022058bc: .word data_ov039_02208158
L_022058c0: .word gGamePhaseRuntime
    .size func_ov039_02205654, .-func_ov039_02205654

