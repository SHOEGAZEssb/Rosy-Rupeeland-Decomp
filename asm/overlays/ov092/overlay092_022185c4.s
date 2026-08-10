.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_020f4e14
.extern data_ov092_0221b17c
.extern data_ov092_0221c828
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern Actor_SetActive
.extern func_02050078
.extern func_020593ac
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02075858
.extern func_020befec
.extern func_020bf1f8
.extern gSoundContext
.extern gSystemState
.extern genrand_int32

.global func_ov092_022185c4
func_ov092_022185c4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x34
    mov r4, r0
    add r0, r4, #0x200
    ldrsb r1, [r0, #0xa1]
    cmp r1, #0x0
    beq .L_02218648
    ldr r1, .L_02218928
    ldrh r1, [r1, #0x6]
    tst r1, #0x4
    beq .L_0221860c
    ldrsb r1, [r0, #0x79]
    add r1, r1, #0x1
    strb r1, [r4, #0x279]
    ldrsb r0, [r0, #0x79]
    cmp r0, #0x2
    movgt r0, #0x0
    strgtb r0, [r4, #0x279]
.L_0221860c:
    ldr r0, .L_02218928
    ldr r3, .L_0221892c
    ldrh r0, [r0, #0x6]
    tst r0, #0x8
    addne r0, r4, #0x200
    movne r1, #0x0
    strneh r1, [r0, #0x84]
    add r0, r4, #0x200
    ldrsb r2, [r0, #0x79]
    ldr r0, .L_02218930
    mov r1, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl func_02075858
.L_02218648:
    ldr r0, .L_02218934
    add r3, sp, #0x28
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    add r2, r4, #0x200
    ldrsb r0, [r2, #0x78]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_02218904
.L_0221866c:
    b .L_02218680
    b .L_02218758
    b .L_02218858
    b .L_02218898
    b .L_022188d0
.L_02218680:
    ldr r0, [r4, #0x248]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x248]
    add r0, r4, #0x200
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x7
    strh r1, [r2, #0x24]
    ldrsb r0, [r0, #0x79]
    cmp r0, #0x0
    bne .L_022186fc
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x8c]
    cmp r1, r2
    bne .L_022186f0
    ldrsh r2, [r0, #0x8e]
    add r2, r2, #0x1
    strh r2, [r0, #0x8e]
    ldrsh r0, [r0, #0x8e]
    cmp r0, #0x2
    blt .L_02218700
    add r0, r1, #0x1
    mov r1, #0x3
    bl func_020befec
    b .L_02218700
.L_022186f0:
    mov r2, #0x0
    strh r2, [r0, #0x8e]
    b .L_02218700
.L_022186fc:
    mov r1, #0x1
.L_02218700:
    add r0, r4, #0x200
    mov r3, #0x0
    add r2, sp, #0x28
    strh r1, [r0, #0x8c]
    ldr lr, [r2, r1, lsl #0x2]
    rsb r2, r1, #0x1
    sub r1, r3, #0x30
    mul r1, r2, r1
    str lr, [r4, #0x27c]
    mov r2, #0x1c8000
    str r2, [r4, #0x280]
    mov ip, #0x1
    strb ip, [r4, #0x278]
    strh r3, [r0, #0x7a]
    stmia sp, {r1, r3}
    ldr r0, .L_02218938
    rsb r1, ip, #0x174
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    mov r3, #0x64
    bl func_020593ac
    b .L_02218904
.L_02218758:
    ldr r0, [r4, #0x248]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02218904
    ldrsh r1, [r2, #0x86]
    sub r1, r1, #0x2
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, #0x1
    bhi .L_02218834
    ldr r1, [r4, #0x27c]
    ldr r2, [r4, #0x280]
    add r0, sp, #0x18
    mov r3, #0x10000
    bl func_0200500c
    add r0, sp, #0x8
    add r1, sp, #0x18
    bl func_02005030
    ldr r1, [sp, #0x20]
    add r0, r4, #0x200
    add r1, r1, #0x10000
    str r1, [sp, #0x20]
    ldrsb r0, [r0, #0x79]
    cmp r0, #0x0
    bne .L_022187e0
    bl genrand_int32
    tst r0, #0x7
    moveq r0, #0xd
    movne r0, #0xb
    b .L_022187ec
.L_022187e0:
    cmp r0, #0x1
    moveq r0, #0xb
    movne r0, #0xd
.L_022187ec:
    add r1, sp, #0x8
    add r2, sp, #0x18
    bl func_02050078
    mov r1, #0x1
    bl Actor_SetActive
    ldr r0, [r4, #0x248]
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    add r1, r4, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x7a]
    mov r1, #0x2
    add r0, sp, #0x8
    strb r1, [r4, #0x278]
    bl func_02005058
    add r0, sp, #0x18
    bl func_02005058
    b .L_02218904
.L_02218834:
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x248]
    mov r0, #0x3
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x7
    strh r1, [r2, #0x24]
    strb r0, [r4, #0x278]
    b .L_02218904
.L_02218858:
    ldrsh r0, [r2, #0x7a]
    add r0, r0, #0x1
    strh r0, [r2, #0x7a]
    ldrsh r0, [r2, #0x7a]
    cmp r0, #0x1e
    blt .L_02218904
    ldr r0, [r4, #0x248]
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x248]
    mov r0, #0x3
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x7
    strh r1, [r2, #0x24]
    strb r0, [r4, #0x278]
    b .L_02218904
.L_02218898:
    ldr r0, [r4, #0x248]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02218904
    mov r1, #0x3
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x7a]
    mov r0, #0x4
    strb r0, [r4, #0x278]
    b .L_02218904
.L_022188d0:
    ldrsh r0, [r2, #0x7a]
    add r0, r0, #0x1
    strh r0, [r2, #0x7a]
    ldrsh r0, [r2, #0x7a]
    cmp r0, #0x5a
    blt .L_02218904
    ldrsh r0, [r2, #0x86]
    cmp r0, #0x3
    moveq r0, #0x0
    streqh r0, [r2, #0x7a]
    streqb r0, [r4, #0x278]
    movne r0, #0x5a
    strneh r0, [r2, #0x7a]
.L_02218904:
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x248]
    ldr r1, [r4, #0x27c]
    ldr r2, [r4, #0x280]
    mov r3, #0x10000
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.L_02218928: .word gSystemState
.L_0221892c: .word data_ov092_0221c828
.L_02218930: .word data_020f4e14
.L_02218934: .word data_ov092_0221b17c
.L_02218938: .word gSoundContext
.size func_ov092_022185c4, . - func_ov092_022185c4
