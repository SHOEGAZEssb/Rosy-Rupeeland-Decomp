.text

/* Exact fallback for func_ov041_02201b38; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_cycle_state.c. */
.extern Sound_Play
.extern func_020ae024
.extern func_ov041_022009e8
.extern func_ov041_02202a00
.extern func_ov041_02202a3c
.extern func_ov041_02202a70
.extern gSoundContext

    .global func_ov041_02201b38
func_ov041_02201b38: ; 0x02201b38
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r3, [r8, #0x91c]
    mov r7, r1
    cmp r3, #0x5
    mov r6, #0x0
    addls pc, pc, r3, lsl #0x2
    b .L_02201dd4
.L_02201b58: ; jump table
    b .L_02201b70 ; case 0
    b .L_02201bd4 ; case 1
    b .L_02201ca8 ; case 2
    b .L_02201d08 ; case 3
    b .L_02201d34 ; case 4
    b .L_02201da8 ; case 5
.L_02201b70:
    mov r0, #0x86000
    sub r1, r0, #0x108000
    str r0, [r8, #0x4b0]
    str r1, [r8, #0x4b4]
    ldr r0, [r8, #0x70]
    ldr r3, [r8, #0x4b0]
    sub r5, r1, r0
    ldr r1, [r8, #0x6c]
    ldr r0, .L_02201e88
    cmp r5, #0x0
    str r0, [r2, #0x0]
    ldrgt r0, [r8, #0x91c]
    sub r4, r3, r1
    addgt r0, r0, #0x1
    strgt r0, [r8, #0x91c]
    ldr r0, [r8, #0x48]
    mov r6, #0x1
    ldr r0, [r0, #0x14]
    bl func_ov041_022009e8
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r8, #0x91c]
    moveq r0, #0x3
    streq r0, [r8, #0x934]
    b .L_02201dd4
.L_02201bd4:
    ldr r0, [r8, #0x4b8]
    ldr r3, [r8, #0x4b4]
    add r0, r0, #0x114
    add r1, r0, #0x400
    ldr r2, [r8, #0x70]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r8, #0x4b8]
    ldr r1, [r8, #0x934]
    sub r5, r3, r2
    tst r1, #0x1
    ldr r0, [r8, #0x4b8]
    bne .L_02201c18
    cmp r0, #0x8000
    addlt r0, r1, #0x1
    strlt r0, [r8, #0x934]
    b .L_02201c24
.L_02201c18:
    cmp r0, #0x8000
    addgt r0, r1, #0x1
    strgt r0, [r8, #0x934]
.L_02201c24:
    ldr r0, [r8, #0x934]
    cmp r0, #0x6
    ble .L_02201dd4
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xd4]
    str r0, [r8, #0x4b0]
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xd8]
    str r0, [r8, #0x4b4]
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov041_022009e8
    cmp r0, #0x0
    mvneq r0, #0x13
    mvnne r0, #0xd
    str r0, [r8, #0x928]
    mov r0, #0x7
    str r0, [r8, #0x920]
    mov r0, #0x0
    str r0, [r8, #0x934]
    ldr r1, [r8, #0x91c]
    mov r0, r8
    add r1, r1, #0x1
    str r1, [r8, #0x91c]
    bl func_ov041_02202a70
    ldr r0, .L_02201e8c
    ldr r1, .L_02201e90
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b .L_02201dd4
.L_02201ca8:
    ldr r0, [r8, #0x934]
    add r0, r0, #0x1
    str r0, [r8, #0x934]
    cmp r0, #0x1e
    bge .L_02201ce0
    ldr r5, [r8, #0x4b0]
    ldr r4, [r8, #0x6c]
    ldr r3, [r8, #0x4b4]
    ldr r1, [r8, #0x70]
    ldr r0, .L_02201e94
    sub r4, r5, r4
    str r0, [r2, #0x0]
    sub r5, r3, r1
    mov r6, #0x1
.L_02201ce0:
    ldr r0, [r8, #0x624]
    cmp r0, #0x0
    bgt .L_02201dd4
    ldr r1, [r8, #0x91c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r8, #0x91c]
    str r0, [r8, #0x934]
    str r0, [r8, #0x928]
    b .L_02201dd4
.L_02201d08:
    ldr r0, [r8, #0x934]
    add r0, r0, #0x1
    str r0, [r8, #0x934]
    cmp r0, #0x23
    ble .L_02201dd4
    ldr r1, [r8, #0x91c]
    mov r0, #0xcd
    add r1, r1, #0x1
    str r1, [r8, #0x91c]
    str r0, [r8, #0x928]
    b .L_02201dd4
.L_02201d34:
    ldr r1, [r8, #0x624]
    mov r6, #0x2
    cmp r1, #0x1000
    blt .L_02201dd4
    bl func_ov041_02202a3c
    mov r0, #0x0
    str r0, [r8, #0x934]
    ldr r0, [r8, #0x92c]
    cmp r0, #0x0
    bne .L_02201d80
    mov r0, r8
    bl func_ov041_02202a00
    mov r0, #0x50
    str r0, [r8, #0x930]
    mov r0, #0x4
    str r0, [r8, #0x920]
    mov r0, #0x1
    str r0, [r8, #0x91c]
    b .L_02201dd4
.L_02201d80:
    mov r0, #0x6
    str r0, [r8, #0x920]
    ldr r1, [r8, #0x92c]
    mov r0, #0xf
    sub r1, r1, #0x1
    str r1, [r8, #0x92c]
    str r0, [r8, #0x930]
    mov r0, #0x5
    str r0, [r8, #0x91c]
    b .L_02201dd4
.L_02201da8:
    ldr r0, [r8, #0x930]
    sub r0, r0, #0x1
    cmp r0, #0x0
    str r0, [r8, #0x930]
    movgt r0, #0x258
    strgt r0, [r2, #0x0]
    movle r0, #0x1
    strle r0, [r8, #0x91c]
    movle r0, #0x5
    movgt r6, #0x3
    strle r0, [r8, #0x934]
.L_02201dd4:
    cmp r6, #0x2
    bne .L_02201e10
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xd4]
    str r0, [r8, #0x4b0]
    ldr r0, [r8, #0x48]
    ldr r0, [r0, #0x8]
    ldr r3, [r0, #0xd8]
    str r3, [r8, #0x4b4]
    ldr r0, [r8, #0x70]
    ldr r2, [r8, #0x4b0]
    ldr r1, [r8, #0x6c]
    sub r5, r3, r0
    sub r4, r2, r1
.L_02201e10:
    cmp r6, #0x3
    bne .L_02201e5c
    ldr r0, [r8, #0x48]
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0x190]
    ldr r1, [r1, #0xd4]
    sub r0, r1, r0
    str r0, [r8, #0x4b0]
    ldr r0, [r8, #0x48]
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0x194]
    ldr r1, [r1, #0xd8]
    sub r3, r1, r0
    str r3, [r8, #0x4b4]
    ldr r0, [r8, #0x70]
    ldr r2, [r8, #0x4b0]
    ldr r1, [r8, #0x6c]
    sub r5, r3, r0
    sub r4, r2, r1
.L_02201e5c:
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, r5
    bl func_020ae024
    cmp r0, #0x0
    ldr r1, [r8, #0x4b8]
    addlt r0, r0, #0x10000
    sub r0, r0, r1
    str r0, [r7, #0x0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02201e88: .word 0x15e
.L_02201e8c: .word gSoundContext
.L_02201e90: .word 0x12d
.L_02201e94: .word 0x514

    .size func_ov041_02201b38, . - func_ov041_02201b38

