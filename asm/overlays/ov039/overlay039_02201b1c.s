.text
/* Exact fallback; see overlay039_script_render.c for portable C. */
    .extern func_020befec
    .extern func_ov039_022017d0
    .extern func_ov039_02202d04
    .extern func_ov039_02203f94
    .extern Sound_Play
    .extern VecFx32Object_Init
    .extern VecFx32Object_Assign
    .extern func_ov049_0220c6cc
    .extern VecFx32Object_Destroy
    .extern func_ov039_02203480
    .extern data_ov039_02208107
    .extern data_ov039_0220811c
    .extern data_ov039_022080f4
    .extern data_020c9670
    .extern gSoundContext
    .global func_ov039_02201b1c
func_ov039_02201b1c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x54
    ldr r3, L_02201fd0
    add r2, sp, #0x3c
    mov r5, r0
    mov r1, #0x15
L_02201b34:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02201b34
    ldr r3, L_02201fd4
    add r2, sp, #0x23
    mov r1, #0x19
L_02201b50:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02201b50
    ldr r3, L_02201fd8
    add r2, sp, #0x10
    mov r1, #0x13
L_02201b6c:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02201b6c
    add r0, r5, #0x1c00
    ldrsh r0, [r0, #0xa4]
    mov r1, #0xa
    add r4, sp, #0x3c
    bl func_020befec
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_02201bbc
L_02201b9c: ; jump table
    b L_02201bbc ; case 0
    b L_02201bb0 ; case 1
    b L_02201bb0 ; case 2
    b L_02201bb8 ; case 3
    b L_02201bb8 ; case 4
L_02201bb0:
    add r4, sp, #0x10
    b L_02201bbc
L_02201bb8:
    add r4, sp, #0x23
L_02201bbc:
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    ble L_02201c2c
    cmp r0, #0x7
    blt L_02201c08
    cmp r0, #0x8
    bgt L_02201c08
    add r1, r5, #0x1000
    ldr r0, [r1, #0xcc4]
    cmp r0, #0x0
    bne L_02201ce4
    mov r0, #0x1
    str r0, [r1, #0xcc4]
    add r0, r5, #0x1c00
    mov r2, #0x0
    strh r2, [r0, #0xc8]
    str r2, [r1, #0xcc0]
    b L_02201ce4
L_02201c08:
    cmp r0, #0x9
    bne L_02201ce4
    add r1, r5, #0x1000
    mov r2, #0x0
    str r2, [r1, #0xcc4]
    add r0, r5, #0x1c00
    strh r2, [r0, #0xc8]
    str r2, [r1, #0xcc0]
    b L_02201ce4
L_02201c2c:
    add r1, r5, #0x1c00
    ldrh r0, [r1, #0xde]
    cmp r0, #0x0
    addeq r0, r5, #0x1000
    ldreq r2, [r0, #0xcc4]
    cmpeq r2, #0x0
    bne L_02201ce4
    ldrh r2, [r1, #0xbc]
    ldrb r2, [r4, r2]
    tst r2, #0x1
    movne r2, #0x1
    strneh r2, [r1, #0xde]
    movne r1, #0x2000
    strne r1, [r0, #0xce4]
    add r1, r5, #0x1c00
    ldrh r0, [r1, #0xbc]
    ldrb r0, [r4, r0]
    tst r0, #0x2
    beq L_02201c94
    add r0, r5, #0x1000
    mov r2, #0x1
    str r2, [r0, #0xcc4]
    ldrh r0, [r1, #0xbc]
    ldrb r0, [r4, r0]
    mov r0, r0, asr #0x4
    strh r0, [r1, #0xc8]
L_02201c94:
    add r1, r5, #0x1c00
    ldrh r0, [r1, #0xbc]
    ldrb r0, [r4, r0]
    tst r0, #0x8
    beq L_02201cc0
    add r0, r5, #0x1000
    mov r2, #0x6
    str r2, [r0, #0xcc4]
    mov r2, #0x0
    strh r2, [r1, #0xc8]
    str r2, [r0, #0xcc0]
L_02201cc0:
    add r0, r5, #0x1c00
    ldrh r1, [r0, #0xbc]
    add r1, r1, #0x1
    strh r1, [r0, #0xbc]
    ldrh r1, [r0, #0xbc]
    ldrb r1, [r4, r1]
    cmp r1, #0xff
    moveq r1, #0x0
    streqh r1, [r0, #0xbc]
L_02201ce4:
    mov r0, r5
    bl func_ov039_022017d0
    add r1, r5, #0x1000
    ldr r0, [r1, #0xcc4]
    mov r2, #0x0
    mov r4, r2
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_02201fbc
L_02201d08: ; jump table
    b L_02201d24 ; case 0
    b L_02201d34 ; case 1
    b L_02201d68 ; case 2
    b L_02201d74 ; case 3
    b L_02201db8 ; case 4
    b L_02201fbc ; case 5
    b L_02201ea0 ; case 6
L_02201d24:
    str r2, [r1, #0xcc0]
    add r0, r5, #0x1c00
    strh r2, [r0, #0xca]
    b L_02201fbc
L_02201d34:
    str r2, [r5, #0x45c]
    ldr r0, [r1, #0xcc0]
    add r0, r0, #0x1
    str r0, [r1, #0xcc0]
    cmp r0, #0x1e
    ble L_02201fbc
    str r2, [r1, #0xcc0]
    add r0, r5, #0x1c00
    ldrh r0, [r0, #0xc8]
    ldr r2, [r1, #0xcc4]
    add r0, r2, r0
    str r0, [r1, #0xcc4]
    b L_02201fbc
L_02201d68:
    mov r0, r5
    bl func_ov039_02202d04
    b L_02201fbc
L_02201d74:
    ldr r0, [r1, #0xcc0]
    mov r4, #0x2
    add r0, r0, #0x1
    cmp r0, #0x6e
    str r0, [r1, #0xcc0]
    movlt r4, #0x1
    blt L_02201fbc
    cmp r0, #0x82
    ble L_02201fbc
    mov r0, r5
    bl func_ov039_02203f94
    add r0, r5, #0x1000
    mov r1, #0x0
    str r1, [r0, #0xcc0]
    mov r1, #0x4
    str r1, [r0, #0xcc4]
    b L_02201fbc
L_02201db8:
    ldr ip, [r1, #0xcc0]
    mov r4, #0x2
    cmp ip, #0x1e
    bge L_02201e6c
    ldr r0, L_02201fdc
    rsbs r1, ip, #0x1e
    mul r0, ip, r0
    mov ip, r0, asr #0x4
    movmi r1, r2
    add r3, r5, #0x1000
    ldr r2, [r3, #0xccc]
    cmp r1, #0xa
    movgt r1, #0xa
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    ldr r0, L_02201fe0
    mov ip, ip, lsl #0x2
    mov r2, r2, lsl #0x2
    ldrsh r2, [r0, r2]
    ldrsh ip, [r0, ip]
    rsb lr, r1, #0x0
    rsb r2, r2, #0x0
    mul r1, lr, ip
    smull lr, ip, r2, r1
    adds lr, lr, #0x800
    adc r2, ip, #0x0
    mov ip, lr, lsr #0xc
    orr ip, ip, r2, lsl #0x14
    str ip, [r5, #0xb0]
    ldr r2, [r3, #0xccc]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r0, [r0, r2]
    smull r2, r1, r0, r1
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r1, #0xa000
    str r0, [r5, #0xb4]
L_02201e6c:
    add r0, r5, #0x1000
    ldr r1, [r0, #0xcc0]
    add r1, r1, #0x1
    str r1, [r0, #0xcc0]
    cmp r1, #0x1e
    ble L_02201fbc
    mov r2, #0x0
    str r2, [r5, #0xb0]
    sub r1, r2, #0xa000
    str r1, [r5, #0xb4]
    str r2, [r0, #0xcc0]
    str r2, [r0, #0xcc4]
    b L_02201fbc
L_02201ea0:
    ldr r0, [r1, #0xcc0]
    cmp r0, #0x0
    bne L_02201ec0
    ldr r0, L_02201fe4
    ldr r1, L_02201fe8
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
L_02201ec0:
    add r0, r5, #0x1000
    ldr r1, [r0, #0xcc0]
    add r1, r1, #0x1
    str r1, [r0, #0xcc0]
    cmp r1, #0x28
    bne L_02201fa4
    add r0, sp, #0x0
    bl VecFx32Object_Init
    add r0, sp, #0x0
    add r1, r5, #0x2c
    bl VecFx32Object_Assign
    ldr r1, [r5, #0x30]
    add r0, r5, #0x64
    sub r1, r1, #0x60000
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x34]
    add r1, sp, #0x0
    add r2, r2, #0x5b000
    str r2, [sp, #0x8]
    add r0, r0, #0x400
    mov r2, #0x6000
    bl func_ov049_0220c6cc
    ldr r1, [r5, #0x30]
    add r0, r5, #0x64
    add r1, r1, #0x60000
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x34]
    add r1, sp, #0x0
    add r2, r2, #0x5b000
    str r2, [sp, #0x8]
    add r0, r0, #0x400
    mov r2, #0x2000
    bl func_ov049_0220c6cc
    ldr r1, [r5, #0x30]
    add r0, r5, #0x64
    sub r1, r1, #0x60000
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x34]
    add r0, r0, #0x400
    sub r2, r2, #0x50000
    str r2, [sp, #0x8]
    add r1, sp, #0x0
    mov r2, #0xa000
    bl func_ov049_0220c6cc
    ldr r1, [r5, #0x30]
    add r0, r5, #0x64
    add r1, r1, #0x60000
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x34]
    add r0, r0, #0x400
    sub r2, r2, #0x50000
    str r2, [sp, #0x8]
    add r1, sp, #0x0
    mov r2, #0xe000
    bl func_ov049_0220c6cc
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
L_02201fa4:
    add r0, r5, #0x1000
    ldr r1, [r0, #0xcc0]
    cmp r1, #0x6e
    movgt r1, #0x0
    strgt r1, [r0, #0xcc0]
    strgt r1, [r0, #0xcc4]
L_02201fbc:
    mov r0, r5
    mov r1, r4
    bl func_ov039_02203480
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, pc}
L_02201fd0: .word data_ov039_02208107
L_02201fd4: .word data_ov039_0220811c
L_02201fd8: .word data_ov039_022080f4
L_02201fdc: .word 0x444
L_02201fe0: .word data_020c9670
L_02201fe4: .word gSoundContext
L_02201fe8: .word 0x1c5
    .size func_ov039_02201b1c, .-func_ov039_02201b1c

