    .text
    .extern func_020befec
    .extern Overlay016_CreateListSprite
    .extern func_ov016_021fd310
    .extern Overlay016_RenderList

/* Exact fallbacks; see src/overlays/ov016/overlay016_list_input.c. */
    .global Overlay016_HitTestList
    .global func_ov016_021fd628
    .global func_ov016_021fd640

Overlay016_HitTestList:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r4, r0
    sub r0, r1, #0x18
    subs r2, r2, #0x40
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r2, #0x80
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x78
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x18
    bl func_020befec
    ldr r2, [r4, #0x58]
    cmp r0, #0x5
    ldr r2, [r2, #0xc]
    movge r0, #0x4
    ldr r1, [r4, #0x54]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}

    .global func_ov016_021fd628
func_ov016_021fd628:
    ldr r1, [r0, #0x58]
    ldr r2, [r0, #0x4c]
    ldr r1, [r1, #0x14]
    mov r0, #0x14
    mla r0, r1, r0, r2
    bx lr

    .global func_ov016_021fd640
func_ov016_021fd640:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x58]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fd6c0
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd6b8
    mov r0, #0x18
    mul r1, r3, r0
    ldr r0, [r4, #0x4]
    rsb r1, r1, #0x20
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x58]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl func_ov016_021fd310
    ldr r1, [r4, #0x58]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl Overlay016_CreateListSprite
    mov r0, r4
    bl Overlay016_RenderList
L_021fd6b8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd6c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}

    .size Overlay016_HitTestList, func_ov016_021fd628 - Overlay016_HitTestList
    .size func_ov016_021fd628, func_ov016_021fd640 - func_ov016_021fd628
    .size func_ov016_021fd640, . - func_ov016_021fd640
