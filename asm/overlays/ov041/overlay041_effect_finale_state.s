.text

/* Exact fallback for func_ov041_022025b0; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_finale_state.c. */
.extern GXx_SetMasterBrightness_
.extern Sound_Play
.extern data_020f4dc8
.extern func_02002ac0
.extern func_02002d28
.extern func_020befec
.extern func_ov004_021fb868
.extern func_ov041_02202aa4
.extern gSoundContext

    .global func_ov041_022025b0
func_ov041_022025b0: ; 0x022025b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r1, [r10, #0x91c]
    cmp r1, #0xa
    bgt .L_022025e8
    bge .L_022026ac
    cmp r1, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r1, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    beq .L_02202610
    cmp r1, #0x1
    beq .L_0220263c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022025e8:
    cmp r1, #0xd
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r1, #0xb
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    beq .L_022026dc
    cmp r1, #0xc
    beq .L_02202784
    cmp r1, #0xd
    beq .L_02202884
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02202610:
    ldr r0, [r10, #0x4b8]
    ldr r1, .L_022029ac
    sub r2, r0, #0x96
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r10, #0x4b8]
    cmp r1, r0
    ldrgt r0, [r10, #0x91c]
    addgt r0, r0, #0x1
    strgt r0, [r10, #0x91c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220263c:
    mov r1, #0x28000
    ldr r2, [r10, #0x70]
    rsb r1, r1, #0x0
    cmp r2, r1
    ble .L_0220266c
    bl func_ov041_02202aa4
    ldr r1, [r10, #0x4b8]
    add r1, r1, r0, lsl #0x1
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r10, #0x4b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220266c:
    ldr r0, [r10, #0x940]
    ldr r1, .L_022029b0
    add r0, r0, #0xc8
    str r0, [r10, #0x940]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r10, #0x940]
    ldr r0, [r10, #0x4b8]
    add r2, r0, #0x140
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r10, #0x4b8]
    cmp r1, r0
    movlt r0, #0xa
    strlt r0, [r10, #0x91c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022026ac:
    ldr r0, [r10, #0x930]
    add r0, r0, #0x1
    str r0, [r10, #0x930]
    cmp r0, #0x28
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [r10, #0x91c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r10, #0x91c]
    str r0, [r10, #0x930]
    str r0, [r10, #0x934]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022026dc:
    ldr r0, [r10, #0x930]
    mov r11, #0xd
    rsbs r8, r0, #0x5b
    movmi r8, #0x0
    mov r9, #0x5b
    ldr r6, .L_022029b4
    mov r7, r11
    ldr r5, .L_022029b8
    ldr r4, .L_022029bc
    b .L_0220274c
.L_02202704:
    mov r0, r9
    mov r1, r7
    bl func_020befec
    cmp r1, #0x0
    addeq r0, r10, r9, lsl #0x2
    ldreq r0, [r0, #0x790]
    cmpeq r0, #0x0
    bne .L_02202734
    ldr r0, [r4, #0x0]
    mov r1, r6
    mov r2, r11
    bl Sound_Play
.L_02202734:
    add r1, r10, r9, lsl #0x2
    ldr r0, [r1, #0x790]
    add r0, r0, #0x258
    str r0, [r1, #0x790]
    cmp r0, r5
    strgt r5, [r1, #0x790]
.L_0220274c:
    sub r9, r9, #0x1
    cmp r9, r8
    bge .L_02202704
    ldr r0, [r10, #0x930]
    add r0, r0, #0x1
    str r0, [r10, #0x930]
    cmp r0, #0x79
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, #0x0
    str r0, [r10, #0x930]
    ldr r0, [r10, #0x91c]
    add r0, r0, #0x1
    str r0, [r10, #0x91c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02202784:
    ldr r0, [r10, #0x918]
    add r0, r0, #0x1
    str r0, [r10, #0x918]
    cmp r0, #0x1e
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r10, #0x930]
    mov r4, #0x6
    rsbs r3, r0, #0x6
    movmi r3, #0x0
    mov r0, #0x26
    b .L_022027c8
.L_022027b0:
    add r2, r10, r4, lsl #0x2
    ldr r1, [r2, #0x8fc]
    add r1, r1, #0x1
    str r1, [r2, #0x8fc]
    cmp r1, #0x28
    strgt r0, [r2, #0x8fc]
.L_022027c8:
    sub r4, r4, #0x1
    cmp r4, r3
    bge .L_022027b0
    ldr r0, [r10, #0x930]
    add r1, r0, #0x1
    sub r0, r1, #0x28
    add r4, r0, r0, lsl #0x1
    cmp r4, #0x10
    movgt r4, #0x10
    str r1, [r10, #0x930]
    cmp r4, #0x0
    ble .L_02202810
    ldr r0, .L_022029c0
    mov r1, r4
    bl GXx_SetMasterBrightness_
    ldr r0, .L_022029c4
    mov r1, r4
    bl GXx_SetMasterBrightness_
.L_02202810:
    cmp r4, #0x10
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, #0x7
    sub r2, r0, #0x1
    mov r1, #0x0
.L_02202824:
    add r0, r10, r2, lsl #0x2
    str r1, [r0, #0x8fc]
    subs r2, r2, #0x1
    bpl .L_02202824
    ldr r0, .L_022029c8
    bl func_02002d28
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x18
    bl func_02002ac0
    ldr r0, .L_022029c8
    mov r1, #0x1
    bl func_02002d28
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x18
    bl func_02002ac0
    mov r0, #0x0
    str r0, [r10, #0x918]
    str r0, [r10, #0x930]
    ldr r0, [r10, #0x91c]
    add r0, r0, #0x1
    str r0, [r10, #0x91c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02202884:
    ldr r0, [r10, #0x930]
    mov r9, #0x5b
    rsbs r6, r0, #0x5b
    movmi r6, #0x0
    mov r5, #0x1000
    mov r11, #0xc
    ldr r4, .L_022029bc
    b .L_02202978
.L_022028a4:
    mov r0, r9
    mov r1, #0xd
    bl func_020befec
    cmp r1, #0x0
    bne .L_02202978
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x790]
    cmp r0, #0x1000
    bge .L_02202978
    mla r8, r9, r11, r10
    ldr r1, [r10, #0x48]
    ldr r3, [r8, #0x70]
    ldr r2, [r1, #0x194]
    ldr r0, [r10, #0x958]
    add r2, r3, r2
    mov r7, r2, asr #0xc
    ldr r2, [r8, #0x6c]
    mov r1, #0x4
    mov r3, r7
    mov r2, r2, asr #0xc
    bl func_ov004_021fb868 ; func_ov008_021fb868
    mov r0, r9
    mov r1, #0xd
    bl func_020befec
    cmp r0, #0x2
    bge .L_0220292c
    ldr r0, [r8, #0x6c]
    mov r3, r7
    mov r0, r0, asr #0xc
    sub r2, r0, #0x40
    ldr r0, [r10, #0x958]
    mov r1, #0x1
    bl func_ov004_021fb868 ; func_ov008_021fb868
    b .L_02202960
.L_0220292c:
    cmp r0, #0x4
    ldr r0, [r8, #0x6c]
    mov r3, r7
    bge .L_02202950
    mov r2, r0, asr #0xc
    ldr r0, [r10, #0x958]
    mov r1, #0x2
    bl func_ov004_021fb868 ; func_ov008_021fb868
    b .L_02202960
.L_02202950:
    mov r2, r0, asr #0xc
    ldr r0, [r10, #0x958]
    mov r1, #0x3
    bl func_ov004_021fb868 ; func_ov008_021fb868
.L_02202960:
    add r0, r10, r9, lsl #0x2
    str r5, [r0, #0x790]
    ldr r0, [r4, #0x0]
    ldr r1, .L_022029b4
    mov r2, #0x0
    bl Sound_Play
.L_02202978:
    sub r9, r9, #0x1
    cmp r9, r6
    bge .L_022028a4
    ldr r0, [r10, #0x930]
    add r0, r0, #0x1
    str r0, [r10, #0x930]
    cmp r0, #0x5b
    movgt r0, #0x0
    strgt r0, [r10, #0x930]
    ldrgt r0, [r10, #0x91c]
    addgt r0, r0, #0x1
    strgt r0, [r10, #0x91c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022029ac: .word 0x6b6c
.L_022029b0: .word 0xc738
.L_022029b4: .word 0x12d
.L_022029b8: .word 0xce4
.L_022029bc: .word gSoundContext
.L_022029c0: .word 0x400006c
.L_022029c4: .word 0x400106c
.L_022029c8: .word data_020f4dc8
    .size func_ov041_022025b0, . - func_ov041_022025b0

