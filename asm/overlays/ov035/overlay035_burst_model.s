.text

/* Exact fallback; see src/overlays/ov035/overlay035_burst_model.c for documented portable C. */

    .extern func_ov035_021fcec4
    .extern func_020948d4
    .extern func_02094c48
    .extern Sound_Play
    .extern func_020948f8
    .extern func_020948e4
    .extern data_ov035_02203c08
    .extern gSoundContext

    .global func_ov035_02201584
func_ov035_02201584:
    stmdb sp!, {r4, lr}
    mov r3, #0x11
    mov r4, r0
    bl func_ov035_021fcec4
    ldr r1, L_022015c8
    mov r0, #0x8000
    str r1, [r4, #0x0]
    str r0, [r4, #0xb8]
    mov r2, #0x0
    add r0, r4, #0x6c
    mov r1, #0x800
    str r2, [r4, #0xc4]
    bl func_020948d4
    mov r1, #0x2000
    mov r0, r4
    strh r1, [r4, #0xbe]
    ldmia sp!, {r4, pc}
L_022015c8: .word data_ov035_02203c08
    .size func_ov035_02201584, .-func_ov035_02201584

    .global func_ov035_022015cc
func_ov035_022015cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xc4]
    cmp r1, #0x0
    beq L_022015f4
    cmp r1, #0x1
    beq L_0220167c
    cmp r1, #0x2
    beq L_02201694
    b L_0220169c
L_022015f4:
    bl func_02094c48
    cmp r0, #0x0
    beq L_0220169c
    ldr r0, L_022016a4
    ldr r1, L_022016a8
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    beq L_0220166c
    mov r0, #0x19
    str r0, [r4, #0xa8]
    mov r2, #0x2
    add r0, r4, #0x6c
    mov r1, #0x0
    str r2, [r4, #0xa0]
    bl func_020948d4
    add r0, r4, #0x2c
    mov r1, #0x1
    mvn r2, #0xff
    bl func_020948f8
    add r0, r4, #0x6c
    mov r1, #0x5
    mov r2, #0x800
    bl func_020948e4
    mov r0, #0xc
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
L_0220166c:
    ldr r0, [r4, #0xc4]
    add r0, r0, #0x1
    str r0, [r4, #0xc4]
    b L_0220169c
L_0220167c:
    bl func_02094c48
    cmp r0, #0x0
    ldrne r0, [r4, #0xc4]
    addne r0, r0, #0x1
    strne r0, [r4, #0xc4]
    b L_0220169c
L_02201694:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0220169c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022016a4: .word gSoundContext
L_022016a8: .word 0x1cb
    .size func_ov035_022015cc, .-func_ov035_022015cc

    .global func_ov035_022016ac
func_ov035_022016ac:
    cmp r0, #0x0
    ldreq r2, L_022016e0
    ldreq r0, L_022016e4
    ldreqh r1, [r2, #0x0]
    andeq r0, r1, r0
    streqh r0, [r2, #0x0]
    bxeq lr
    ldr r1, L_022016e0
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3000
    orr r0, r0, #0x20
    strh r0, [r1, #0x0]
    bx lr
L_022016e0: .word 0x4000060
L_022016e4: .word 0xcfdf
    .size func_ov035_022016ac, .-func_ov035_022016ac

