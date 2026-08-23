.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_descriptor_hit_test.c. */
.extern Sound_Play
.extern data_ov041_02204c7c
.extern data_ov041_02204d00
.extern GraphicsSpriteState_SetAnimationIndex
.extern Graphics3dPresentation_SetSpriteEffectVertexDepth
.extern Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
.extern func_020adc40
.extern func_ov041_021fec84
.extern func_ov070_02212908
.extern gSoundContext

    .global func_ov041_02200348
func_ov041_02200348: ; 0x02200348
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r7, #0x20000
    mov r11, #0x0
    mov r9, r1
    ldr r8, [r10, #0x1ac]
    rsb r7, r7, #0x0
    mov r5, r11
    mov r4, #0x800
    mov r6, #0xc
    b .L_02200640
.L_02200378:
    ldr r1, [r10, #0x80]
    mov r0, r8, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r0, r7, asr #0x11
    ble .L_02200640
    ldr r0, [r10, #0x90]
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_02200640
    ldr r1, [r10, #0x84]
    ldr r0, [r9, #0x4]
    mla r1, r8, r6, r1
    ldr r3, [r1, #0x4]
    ldr r2, [r1, #0x8]
    ldr r1, [r9, #0x8]
    sub r0, r3, r0
    cmp r0, r7
    sub ip, r2, r1
    blt .L_02200640
    cmp r0, #0x20000
    bgt .L_02200640
    cmp ip, r7
    blt .L_02200640
    cmp ip, #0x20000
    bgt .L_02200640
    smull r1, r3, r0, r0
    mov r0, #0x800
    adds r0, r1, r0
    smull r2, r1, ip, ip
    adc r3, r3, r11
    adds r2, r2, r4
    mov r0, r0, lsr #0xc
    adc r1, r1, r5
    mov r2, r2, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    cmp r0, #0x1e000
    bge .L_02200640
    ldr r0, [r10, #0x48]
    ldr r1, [r0, #0x1f4]
    cmp r1, #0x0
    cmpne r1, #0x2
    bne .L_02200550
    ldr r1, [r10, #0x80]
    mov r0, r8, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r0, #0x1
    beq .L_0220045c
    sub r0, r0, #0x3
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x2
    bhi .L_02200638
.L_0220045c:
    ldr r0, .L_02200654
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl Sound_Play
    ldr r1, [r10, #0x80]
    mov r0, r8, lsl #0x1
    ldrsh r0, [r1, r0]
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    ldr r0, [r10, #0x48]
    bhi .L_022004e4
    mov r1, #0x1f4
    mov r2, #0x1
    bl func_ov041_021fec84
    ldr r0, [r10, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0x8]
    ldmib r9, {r2, r3}
    bl func_ov070_02212908
    ldr r1, [r10, #0x80]
    mov r2, r8, lsl #0x1
    ldrsh r0, [r1, r2]
    sub r0, r0, #0x4
    strh r0, [r1, r2]
    ldr r1, [r10, #0x80]
    ldrsh r0, [r1, r2]
    mov r0, r0, lsl #0x1
    strh r0, [r1, r2]
    b .L_02200518
.L_022004e4:
    mov r1, #0x64
    mov r2, #0x0
    bl func_ov041_021fec84
    ldr r0, [r10, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    ldmib r9, {r2, r3}
    bl func_ov070_02212908
    ldr r2, [r10, #0x80]
    mov r1, r8, lsl #0x1
    ldrsh r0, [r2, r1]
    sub r0, r0, #0x1
    strh r0, [r2, r1]
.L_02200518:
    ldr r0, [r10, #0x98]
    mov r3, r8, lsl #0x1
    ldrsh r1, [r0, r3]
    cmp r1, #0x0
    blt .L_02200638
    ldr r0, [r10, #0x80]
    add r2, r10, r1, lsl #0x2
    ldrsh r1, [r0, r3]
    ldr r0, .L_02200658
    ldr r2, [r2, #0x4c]
    ldrb r1, [r0, r1]
    ldr r0, [r2, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02200638
.L_02200550:
    ldr r2, [r10, #0x84]
    mov r1, #0xc
    mla r1, r8, r1, r2
    mov r2, #0x1c
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r2, #0x4
    str r2, [sp, #0x8]
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    sub r3, r1, #0x13
    ldr r0, [r0, #0x18]
    sub r2, r2, #0xe
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
    ldr r2, [r10, #0x48]
    mov r1, r0
    ldr r0, [r2, #0x18]
    mvn r2, #0x13
    bl Graphics3dPresentation_SetSpriteEffectVertexDepth
    ldr r3, [r10, #0x48]
    ldr r1, [r10, #0x80]
    mov r0, r8, lsl #0x1
    ldrsh r1, [r1, r0]
    ldr r0, .L_0220065c
    ldr r2, [r3, #0x1d8]
    ldr r1, [r0, r1, lsl #0x2]
    ldr r0, .L_02200654
    add r1, r2, r1
    str r1, [r3, #0x1d8]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r2, #0xf
    bl Sound_Play
    ldr r1, [r10, #0x80]
    mov r0, r8, lsl #0x1
    mvn r2, #0x0
    strh r2, [r1, r0]
    ldr r0, [r10, #0x1bc]
    subs r0, r0, #0x1
    str r0, [r10, #0x1bc]
    bne .L_02200638
    ldr r1, [r10, #0x7c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r1, [r10, #0x48]
    ldr r0, [r10, #0x7c]
    ldr r1, [r1, #0x190]
    add r1, r1, #0x9000
    str r1, [r0, #0x30]
    ldr r1, [r10, #0x48]
    ldr r0, [r10, #0x7c]
    ldr r1, [r1, #0x194]
    add r1, r1, #0xc8000
    str r1, [r0, #0x34]
.L_02200638:
    mov r0, r8
    b .L_0220064c
.L_02200640:
    subs r8, r8, #0x1
    bpl .L_02200378
    mvn r0, #0x0
.L_0220064c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02200654: .word gSoundContext
.L_02200658: .word data_ov041_02204d00
.L_0220065c: .word data_ov041_02204c7c
    .size func_ov041_02200348, . - func_ov041_02200348

