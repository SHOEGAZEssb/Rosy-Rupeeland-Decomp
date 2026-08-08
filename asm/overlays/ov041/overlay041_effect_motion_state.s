.text

/* Exact fallback for func_ov041_022017f8; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_motion_state.c. */
.extern Sound_Play
.extern func_020ae024
.extern func_020befec
.extern func_020bf1f8
.extern func_ov041_022009e8
.extern func_ov041_022013cc
.extern func_ov041_02202a00
.extern func_ov041_02202aa4
.extern gSoundContext
.extern genrand_int32

    .global func_ov041_022017f8
func_ov041_022017f8: ; 0x022017f8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r3, [r6, #0x91c]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    beq .L_02201828
    cmp r3, #0x1
    beq .L_0220185c
    cmp r3, #0x2
    beq .L_02201a38
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02201828:
    bl func_ov041_02202aa4
    str r0, [r5, #0x0]
    ldr r1, [r6, #0x4b4]
    ldr r0, [r6, #0x70]
    sub r0, r1, r0
    cmp r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x91c]
    mov r0, r6
    add r1, r1, #0x1
    str r1, [r6, #0x91c]
    bl func_ov041_02202a00
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220185c:
    ldr r7, [r6, #0x930]
    mov r1, #0x3c
    mov r0, r7
    bl func_020befec
    cmp r1, #0x0
    bne .L_02201884
    cmp r7, #0x0
    ble .L_02201884
    mov r0, r6
    bl func_ov041_02202a00
.L_02201884:
    ldr r3, [r6, #0x4b0]
    ldr r0, [r6, #0x6c]
    ldr r2, [r6, #0x4b4]
    ldr r1, [r6, #0x70]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    cmp r0, #0x0
    ldr r2, [r6, #0x4b8]
    addlt r0, r0, #0x10000
    sub r0, r0, r2
    mov r1, #0xfa
    str r0, [r5, #0x0]
    str r1, [r4, #0x0]
    ldr r0, [r6, #0x930]
    cmp r0, #0x0
    ble .L_022019d0
    mov r0, r6
    bl func_ov041_02202aa4
    ldr r2, [r5, #0x0]
    mov r1, #0x14
    mla r1, r0, r1, r2
    str r1, [r5, #0x0]
    ldr r0, [r6, #0x930]
    sub r0, r0, #0x1
    str r0, [r6, #0x930]
    cmp r0, #0x0
    bgt .L_022019d0
    ldr r2, [r6, #0x48]
    mov r1, #0x12c000
    ldr r3, [r2, #0x8]
    ldr r0, [r2, #0x14]
    ldr r3, [r3, #0xd8]
    ldr r2, [r0, #0x15c]
    rsb r1, r1, #0x0
    sub r2, r3, r2
    cmp r2, r1
    movlt r0, #0x0
    blt .L_02201944
    add r1, r1, #0x6c000
    cmp r2, r1
    ble .L_02201940
    bl func_ov041_022009e8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x2
    b .L_02201944
.L_02201940:
    mov r0, #0x2
.L_02201944:
    cmp r0, #0x0
    bne .L_02201964
    mov r0, #0xb
    str r0, [r6, #0x920]
    mov r0, #0x0
    str r0, [r6, #0x91c]
    str r0, [r6, #0x934]
    b .L_022019d0
.L_02201964:
    cmp r0, #0x1
    bne .L_0220199c
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    sub r1, r1, #0x1
    mov r0, #0x50
    mul r0, r1, r0
    add r0, r0, #0x80
    mov r0, r0, lsl #0xc
    str r0, [r6, #0x4b0]
    mov r0, #0x12c000
    str r0, [r6, #0x4b4]
    b .L_022019d0
.L_0220199c:
    mov r0, #0x6
    str r0, [r6, #0x920]
    mov r0, #0x0
    str r0, [r6, #0x91c]
    str r0, [r6, #0x934]
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov041_022009e8
    rsb r0, r0, #0x2
    str r0, [r6, #0x92c]
    cmp r0, #0x1
    addge r0, r0, #0x1
    strge r0, [r6, #0x92c]
.L_022019d0:
    ldr r0, [r6, #0x920]
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x930]
    cmp r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x70]
    add r0, r0, #0x96000
    str r0, [r6, #0x4b4]
    ldr r0, [r6, #0x928]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x70]
    cmp r0, #0x78000
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mvn r0, #0x13
    str r0, [r6, #0x928]
    ldr r1, [r6, #0x91c]
    ldr r0, .L_02201b2c
    add r1, r1, #0x1
    str r1, [r6, #0x91c]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02201b30
    mov r2, #0x1
    bl Sound_Play
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02201a38:
    ldr r0, [r6, #0x70]
    add r3, r0, #0x96000
    str r3, [r6, #0x4b4]
    ldr r1, [r6, #0x70]
    ldr r2, [r6, #0x4b0]
    ldr r0, [r6, #0x6c]
    sub r1, r3, r1
    sub r0, r2, r0
    bl func_020ae024
    cmp r0, #0x0
    ldr r2, [r6, #0x4b8]
    addlt r0, r0, #0x10000
    sub r0, r0, r2
    str r0, [r5, #0x0]
    mov r1, #0x320
    str r1, [r4, #0x0]
    ldr r1, [r6, #0x624]
    ldr r0, .L_02201b34
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x4a8]
    cmp r0, #0xe0000
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x8
    str r0, [r6, #0x920]
    mov r0, #0x0
    str r0, [r6, #0x91c]
    str r0, [r6, #0x930]
    ldr r0, [r6, #0x48]
    ldr r1, [r6, #0x4a8]
    ldr r2, [r0, #0x14]
    ldr r0, [r0, #0x194]
    ldr r3, [r2, #0x15c]
    add r0, r1, r0
    cmp r3, r0
    bge .L_02201ae8
    ldr r2, [r6, #0x4b0]
    mov r0, r6
    add r3, r3, #0x28000
    mov r1, #0x9
    bl func_ov041_022013cc
    mov r0, #0x14000
    str r0, [r6, #0x4b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02201ae8:
    mov r0, #0x5b
    sub lr, r0, #0x1
    mov r4, #0x118000
    mov r3, #0x8000
    mov r1, #0x0
    mov r0, #0xc
.L_02201b00:
    mla ip, lr, r0, r6
    ldr r5, [r6, #0x4b0]
    add r2, r6, lr, lsl #0x2
    str r5, [ip, #0x6c]
    str r4, [ip, #0x70]
    str r3, [r2, #0x4b8]
    str r1, [r2, #0x624]
    subs lr, lr, #0x1
    bpl .L_02201b00
    str r4, [r6, #0x4b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02201b2c: .word gSoundContext
.L_02201b30: .word 0x12d
.L_02201b34: .word 0xccd
    .size func_ov041_022017f8, . - func_ov041_022017f8

