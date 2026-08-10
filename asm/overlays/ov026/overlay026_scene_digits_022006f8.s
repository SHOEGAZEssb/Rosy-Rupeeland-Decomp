.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_digits.c. */
.extern data_ov026_02204ac0
.extern GraphicsAnimationInstanceManager_CreateInstance
.extern GraphicsAnimationInstanceManager_Clear
.extern func_020b35b0
.extern func_020befec
.extern func_ov026_021ff830
.extern func_ov026_02200880


    .global func_ov026_022006f8
func_ov026_022006f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r10, r0
    ldr r0, [r10, #0x78]
    mov r4, r1
    bl GraphicsAnimationInstanceManager_Clear
    cmp r4, #0x64
    bge L_02200728
    mov r0, r10
    mov r1, r4
    bl func_ov026_02200880
    b L_02200874
L_02200728:
    mov r0, r4
    mov r1, #0xa
    bl func_020befec
    mov r2, r0
    ldr r1, L_0220087c
    add r0, sp, #0xc
    bl func_020b35b0
    mov r7, r0
    mov r0, r7, lsl #0x4
    add r0, r0, #0x64
    cmp r7, #0x4
    addge r0, r0, #0x8
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    ldr r0, [r10, #0x78]
    add r1, r10, #0xa0
    add r9, r2, #0x2a
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    mov r4, #0x40
    str r1, [sp, #0x0]
    mov r1, #0x1b
    str r1, [sp, #0x4]
    mov r2, r9, lsl #0x4
    sub r3, r4, #0x550
    mov r1, #0xb
    str r4, [sp, #0x8]
    bl func_ov026_021ff830
    mov r8, #0x0
    mov r4, #0x500
    add r9, r9, #0x32
    rsb r4, r4, #0x0
    mov r6, r8
    mov r5, #0x1b
    mov r11, #0x40
    b L_02200838
L_022007bc:
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
    cmp r0, #0x4
    addne r9, r9, #0x10
    bne L_02200834
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
    mov r1, #0xa
    mov r2, r2, lsl #0x4
    mov r3, r4
    bl func_ov026_021ff830
    add r9, r9, #0x18
L_02200834:
    add r8, r8, #0x1
L_02200838:
    cmp r8, r7
    blt L_022007bc
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
L_02200874:
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_0220087c: .word data_ov026_02204ac0
.size func_ov026_022006f8, .-func_ov026_022006f8

