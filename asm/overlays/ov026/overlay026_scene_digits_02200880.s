.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_digits.c. */
.extern data_ov026_02204ac4
.extern GraphicsAnimationInstanceManager_CreateInstance
.extern GraphicsAnimationInstanceManager_Clear
.extern func_020b35b0
.extern func_ov026_021ff830


    .global func_ov026_02200880
func_ov026_02200880:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    ldr r0, [r10, #0x78]
    mov r4, r1
    bl GraphicsAnimationInstanceManager_Clear
    ldr r1, L_022009d8
    add r0, sp, #0xc
    mov r2, r4
    bl func_020b35b0
    mov r7, r0
    mov r0, r7, lsl #0x4
    add r0, r0, #0x6c
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    add r9, r1, #0x2a
    ldr r0, [r10, #0x78]
    add r1, r10, #0xa0
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r1, #0x1b
    str r1, [sp, #0x4]
    mov r1, #0x40
    str r1, [sp, #0x8]
    sub r3, r1, #0x550
    mov r1, #0xb
    mov r2, r9, lsl #0x4
    bl func_ov026_021ff830
    mov r8, #0x0
    mov r4, #0x500
    add r9, r9, #0x32
    rsb r4, r4, #0x0
    mov r6, r8
    mov r5, #0x1b
    mov r11, #0x40
    b L_02200994
L_02200918:
    ldr r0, [r10, #0x78]
    add r1, r10, #0xa0
    bl GraphicsAnimationInstanceManager_CreateInstance
    str r6, [sp, #0x0]
    stmib sp, {r5, r11}
    add r1, sp, #0xc
    ldrsb r1, [r1, r8]
    mov r2, r9, lsl #0x4
    mov r3, r4
    sub r1, r1, #0x30
    bl func_ov026_021ff830
    sub r0, r7, r8
    cmp r0, #0x2
    addne r9, r9, #0x10
    bne L_02200990
    ldr r0, [r10, #0x78]
    add r1, r10, #0xa0
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r1, #0x1b
    str r1, [sp, #0x4]
    mov r1, #0x40
    add r2, r9, #0xc
    str r1, [sp, #0x8]
    mov r1, #0xd
    mov r2, r2, lsl #0x4
    mov r3, r4
    bl func_ov026_021ff830
    add r9, r9, #0x18
L_02200990:
    add r8, r8, #0x1
L_02200994:
    cmp r8, r7
    blt L_02200918
    ldr r0, [r10, #0x78]
    add r1, r10, #0xa0
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    mov r4, #0x40
    str r1, [sp, #0x0]
    mov r1, #0x1b
    str r1, [sp, #0x4]
    mov r2, r9, lsl #0x4
    sub r3, r4, #0x540
    mov r1, #0xc
    str r4, [sp, #0x8]
    bl func_ov026_021ff830
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_022009d8: .word data_ov026_02204ac4
.size func_ov026_02200880, .-func_ov026_02200880

