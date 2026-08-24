.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_controller_recovery.c.
.extern gFx32CosSinTable
.extern func_020ae024
.extern func_020befec
.extern func_ov049_0220c21c
.extern func_ov049_0220c23c

.global func_ov049_0220c8a0
func_ov049_0220c8a0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    mov r2, #0xa
    mov r8, r0
    str r1, [sp, #0x0]
    sub r6, r2, #0x1
.L_0220c8b8:
    add r0, r8, r6, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    ble .L_0220c90c
    ldrsh r1, [r0, #0x6c]
    add r1, r1, #0x1
    strh r1, [r0, #0x6c]
    ldrsh r1, [r0, #0x6c]
    cmp r1, #0x4
    ble .L_0220cf58
    mov r2, #0x0
    strh r2, [r0, #0x6c]
    ldrsh r1, [r0, #0x44]
    add r1, r1, #0x1
    strh r1, [r0, #0x44]
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x5
    subge r1, r2, #0x1
    strgeh r1, [r0, #0x44]
    b .L_0220cf58
.L_0220c90c:
    bne .L_0220cf58
    ldrsh r1, [r0, #0x6c]
    cmp r1, #0x0
    bne .L_0220cd80
    ldrh r1, [r0, #0x58]
    add r1, r1, #0x320
    strh r1, [r0, #0x58]
    ldrh r1, [r0, #0x58]
    cmp r1, #0x8000
    movhi r1, #0x8000
    strhih r1, [r0, #0x58]
    add r0, r8, r6, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x80]
    cmp r1, #0x0
    ble .L_0220c964
    sub r1, r1, #0x1
    strh r1, [r0, #0x80]
    ldrsh r1, [r0, #0x80]
    cmp r1, #0x0
    moveq r1, #0x1
    streqh r1, [r0, #0x94]
.L_0220c964:
    add r0, r8, r6, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x94]
    cmp r1, #0x0
    addgt r1, r1, #0x1
    strgth r1, [r0, #0x94]
    bgt .L_0220cf58
    add r0, sp, #0x18
    bl func_ov049_0220c21c
    mov r0, #0x3c
    mla r10, r6, r0, r8
    mov r1, #0x0
    mov r5, #0x1000
    rsb r5, r5, #0x0
    mov r0, #0xa
    sub r11, r5, #0x13000
    str r1, [sp, #0x20]
    str r1, [sp, #0x1c]
    sub r7, r0, #0x1
    mov r4, r11
.L_0220c9b4:
    cmp r7, r6
    beq .L_0220ca58
    add r0, r8, r7, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    ldreqsh r0, [r0, #0x6c]
    cmpeq r0, #0x0
    bne .L_0220ca58
    mov r0, #0x3c
    mla r0, r7, r0, r8
    ldr r1, [r0, #0x20]
    ldr r2, [r10, #0x20]
    ldr r0, [r0, #0x24]
    sub r2, r2, r1
    ldr r1, [r10, #0x24]
    cmp r2, r4
    sub r9, r1, r0
    ble .L_0220ca58
    cmp r2, #0x14000
    bge .L_0220ca58
    cmp r9, r11
    ble .L_0220ca58
    cmp r9, #0x14000
    bge .L_0220ca58
    cmp r2, #0x0
    movlt r0, r5
    blt .L_0220ca2c
    movgt r0, #0x1000
    movle r0, #0x0
.L_0220ca2c:
    mov r1, #0x3
    bl func_020befec
    str r0, [sp, #0x1c]
    cmp r9, #0x0
    movlt r0, r5
    blt .L_0220ca4c
    movgt r0, #0x1000
    movle r0, #0x0
.L_0220ca4c:
    mov r1, #0x3
    bl func_020befec
    str r0, [sp, #0x20]
.L_0220ca58:
    subs r7, r7, #0x1
    bpl .L_0220c9b4
    add r0, r8, r6, lsl #0x1
    add r0, r0, #0x600
    ldrh r0, [r0, #0x58]
    cmp r0, #0x8000
    blo .L_0220cac4
    ldr r1, [r10, #0x8]
    ldr r0, .L_0220cf68
    cmp r1, r0
    ldrlt r0, .L_0220cf6c
    strlt r0, [sp, #0x1c]
    ldr r1, [r10, #0x8]
    ldr r0, .L_0220cf70
    cmp r1, r0
    ldrgt r0, .L_0220cf74
    strgt r0, [sp, #0x1c]
    ldr r1, [r10, #0xc]
    ldr r0, .L_0220cf78
    cmp r1, r0
    ldrlt r0, .L_0220cf6c
    strlt r0, [sp, #0x20]
    ldr r1, [r10, #0xc]
    ldr r0, .L_0220cf7c
    cmp r1, r0
    ldrgt r0, .L_0220cf74
    strgt r0, [sp, #0x20]
.L_0220cac4:
    mov r0, #0x3c
    mul r3, r6, r0
    mov r0, #0x14
    add r2, r8, #0x4
    mla r4, r6, r0, r8
    add r0, r2, r3
    mov r9, #0x8000
    add r1, r8, #0x25c
    str r0, [sp, #0x8]
    add r0, r1, r3
    str r0, [sp, #0x4]
    ldr r0, .L_0220cf80
    add r1, r8, r6, lsl #0x1
    rsb r0, r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, .L_0220cf80
    add r5, r8, r3
    rsb r0, r0, #0x0
    str r0, [sp, #0x14]
    add r0, r1, #0x600
    mov r7, #0x0
    rsb r9, r9, #0x0
    str r0, [sp, #0x10]
.L_0220cb20:
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x57c]
    cmp r0, #0x0
    bne .L_0220cbfc
    mov r0, #0xc
    mul r2, r7, r0
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    add r0, r0, r2
    add r1, r1, r2
    bl func_ov049_0220c23c
    cmp r7, #0x0
    bne .L_0220cbfc
    ldr r0, [sp, #0x10]
    ldrh r0, [r0, #0x58]
    cmp r0, #0x8000
    blo .L_0220cbfc
    ldr r0, [sp, #0x0]
    ldmib r0, {r1, r3}
    ldr r2, [r0, #0xc]
    ldr r0, [sp, #0x1c]
    sub r2, r3, r2
    cmp r0, #0x0
    ldr r0, [sp, #0x20]
    movne r1, #0x200000
    cmp r0, #0x0
    sub r3, r2, #0x10000
    mov r0, #0xc
    mla r2, r7, r0, r5
    ldr r0, [r2, #0xc]
    ldr r2, [r2, #0x8]
    movne r3, #0x1f4000
    sub r0, r3, r0
    sub r1, r1, r2
    bl func_020ae024
    add r1, r4, r7, lsl #0x2
    ldr r1, [r1, #0x4b4]
    sub r2, r0, r1
    ldr r0, .L_0220cf84
    add r1, r4, r7, lsl #0x2
    cmp r2, r0
    subgt r2, r2, #0x10000
    cmp r2, r9
    ldr r0, .L_0220cf80
    addlt r2, r2, #0x10000
    cmp r2, r0
    movgt r2, r0
    ldr r0, [sp, #0x14]
    cmp r2, r0
    ldrlt r2, [sp, #0xc]
    ldr r0, [r1, #0x4b4]
    add r0, r0, r2
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0x4b4]
.L_0220cbfc:
    add r1, r4, r7, lsl #0x2
    cmp r7, #0x0
    moveq r2, #0xd
    ldr r0, [r1, #0x57c]
    movne r2, #0x10
    cmp r0, r2
    bge .L_0220cd00
    cmp r7, #0x0
    ldreq r0, [r1, #0x4b4]
    moveq r0, r0, lsl #0x10
    moveq r0, r0, lsr #0x10
    beq .L_0220cc50
    mov r0, #0xc
    mla r3, r7, r0, r5
    ldr r1, [r3, #0x258]
    ldr r0, [r3, #0xc]
    ldr r2, [r3, #0x254]
    sub r0, r1, r0
    ldr r1, [r3, #0x8]
    sub r1, r2, r1
    bl func_020ae024
.L_0220cc50:
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    mov r0, #0xc
    mla r10, r7, r0, r5
    ldr r0, .L_0220cf88
    mov r2, r1, lsl #0x1
    add r0, r0, r1, lsl #0x1
    ldrsh r1, [r0, #0x2]
    ldr r0, .L_0220cf8c
    ldr lr, [r10, #0x8]
    umull ip, r3, r1, r0
    mov r0, #0x0
    mla r3, r1, r0, r3
    ldr r0, .L_0220cf8c
    mov r11, r1, asr #0x1f
    mla r3, r11, r0, r3
    mov r0, #0x800
    adds r1, ip, r0
    mov r0, #0x0
    adc r0, r3, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, lr, r1
    str r0, [r10, #0x8]
    ldr r0, .L_0220cf88
    mov ip, #0x0
    ldrsh r1, [r0, r2]
    ldr r2, .L_0220cf8c
    ldr r11, [r10, #0xc]
    umull r3, r2, r1, r2
    mla r2, r1, ip, r2
    mov r0, r1, asr #0x1f
    ldr r1, .L_0220cf8c
    mla r2, r0, r1, r2
    mov r0, #0x800
    adds r1, r3, r0
    mov r0, ip
    adc r0, r2, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r11, r1
    str r0, [r10, #0xc]
.L_0220cd00:
    add r1, r4, r7, lsl #0x2
    cmp r7, #0x0
    ldreq r0, [r1, #0x57c]
    add r10, r4, r7, lsl #0x2
    addeq r0, r0, #0x1
    ldrne r0, [r1, #0x578]
    addne r0, r0, #0x3
    str r0, [r1, #0x57c]
    ldr r0, [r10, #0x57c]
    mov r1, #0x1e
    add r0, r0, #0x1e
    str r0, [r10, #0x57c]
    bl func_020befec
    add r7, r7, #0x1
    str r1, [r10, #0x57c]
    cmp r7, #0x5
    blt .L_0220cb20
    mov r0, #0x5
    sub r4, r0, #0x1
    mov r0, #0xc
.L_0220cd50:
    mla r3, r4, r0, r5
    ldr r2, [r3, #0x8]
    ldr r1, [sp, #0x1c]
    subs r4, r4, #0x1
    add r1, r2, r1
    str r1, [r3, #0x8]
    ldr r2, [r3, #0xc]
    ldr r1, [sp, #0x20]
    add r1, r2, r1
    str r1, [r3, #0xc]
    bpl .L_0220cd50
    b .L_0220cf58
.L_0220cd80:
    mov r0, #0x7d0
    mul r0, r6, r0
    mov r1, #0x3c
    mov r0, r0, lsl #0x10
    mla ip, r6, r1, r8
    mov r10, r0, lsr #0x10
    mov r11, #0x3
.L_0220cd9c:
    mov r0, r10, asr #0x4
    mov r1, r0, lsl #0x1
    mov r0, #0xc
    mul r7, r11, r0
    ldr r0, .L_0220cf88
    mov r2, r1, lsl #0x1
    add r0, r0, r1, lsl #0x1
    ldrsh r1, [r0, #0x2]
    add r0, r10, #0x1f40
    mov r0, r0, lsl #0x10
    mov r10, r0, lsr #0x10
    mov r0, #0xe000
    umull r4, r3, r1, r0
    mov r0, #0x0
    mla r3, r1, r0, r3
    add r9, ip, r7
    mov lr, r1, asr #0x1f
    mov r0, #0xe000
    mla r3, lr, r0, r3
    mov r0, #0x800
    adds r1, r4, r0
    mov r0, #0x0
    ldr r5, [r9, #-0x4]
    adc r0, r3, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r5, r1
    str r0, [r9, #0x8]
    ldr r0, .L_0220cf88
    ldr r3, [ip, r7]
    ldrsh r5, [r0, r2]
    mov r0, #0xe000
    mov r2, #0x0
    umull r1, r0, r5, r0
    mla r0, r5, r2, r0
    mov r4, r5, asr #0x1f
    mov r2, #0xe000
    mla r0, r4, r2, r0
    adds r2, r1, #0x800
    adc r0, r0, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r11, r11, #0x1
    add r0, r3, r1
    str r0, [r9, #0xc]
    cmp r11, #0x5
    blt .L_0220cd9c
    mov r0, #0x2
    ldr lr, .L_0220cf88
    sub r10, r0, #0x1
    mov r11, #0x0
.L_0220ce68:
    mov r0, r11, asr #0x4
    mov r1, r0, lsl #0x1
    mov r0, #0xc
    mla r9, r10, r0, ip
    add r0, lr, r1, lsl #0x1
    ldrsh r2, [r0, #0x2]
    add r0, r11, #0x1f40
    mov r0, r0, lsl #0x10
    mov r11, r0, lsr #0x10
    mov r0, #0xe000
    umull r5, r4, r2, r0
    mov r0, #0x0
    mla r4, r2, r0, r4
    mov r3, r1, lsl #0x1
    mov r1, r2, asr #0x1f
    mov r0, #0xe000
    mla r4, r1, r0, r4
    mov r0, #0x800
    adds r1, r5, r0
    mov r0, #0x0
    ldr r7, [r9, #0x14]
    adc r0, r4, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r0, r7, r1
    str r0, [r9, #0x8]
    ldrsh r1, [lr, r3]
    mov r2, #0xe000
    mov r5, #0x0
    umull r3, r2, r1, r2
    mla r2, r1, r5, r2
    mov r0, r1, asr #0x1f
    mov r1, #0xe000
    mla r2, r0, r1, r2
    mov r0, #0x800
    adds r1, r3, r0
    mov r0, r5
    adc r0, r2, r0
    mov r1, r1, lsr #0xc
    ldr r4, [r9, #0x18]
    orr r1, r1, r0, lsl #0x14
    sub r0, r4, r1
    str r0, [r9, #0xc]
    subs r10, r10, #0x1
    bpl .L_0220ce68
    add r0, r8, r6, lsl #0x1
    add r1, r0, #0x600
    ldrsh r2, [r1, #0x6c]
    ldr r3, [ip, #0x24]
    ldr r0, .L_0220cf90
    sub r2, r2, #0x14
    mla r3, r2, r0, r3
    str r3, [ip, #0x24]
    ldrsh r2, [r1, #0x6c]
    add r2, r2, #0x1
    strh r2, [r1, #0x6c]
    ldrsh r2, [r1, #0x6c]
    cmp r2, #0x1e
    subgt r0, r0, #0x334
    strgth r0, [r1, #0x44]
.L_0220cf58:
    subs r6, r6, #0x1
    bpl .L_0220c8b8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220cf68: .word 0x176000
.L_0220cf6c: .word 0x666
.L_0220cf70: .word 0x28a000
.L_0220cf74: .word 0xfffff99a
.L_0220cf78: .word 0x15e000
.L_0220cf7c: .word 0x23a000
.L_0220cf80: .word 0x1388
.L_0220cf84: .word 0x7fff
.L_0220cf88: .word gFx32CosSinTable
.L_0220cf8c: .word 0xe66
.L_0220cf90: .word 0x333
.size func_ov049_0220c8a0, . - func_ov049_0220c8a0
