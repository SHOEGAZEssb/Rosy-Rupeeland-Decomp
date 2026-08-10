.text

/* Exact fallback for func_ov041_02202c34; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_update.c. */
.extern Sound_Play
.extern data_020c9670
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_ov004_021fb868
.extern func_ov008_021fbd1c
.extern func_ov041_021fd000
.extern func_ov041_021fec04
.extern func_ov041_022009e8
.extern func_ov041_02201784
.extern func_ov041_022017f8
.extern func_ov041_02201b38
.extern func_ov041_02201e98
.extern func_ov041_02202220
.extern func_ov041_0220232c
.extern func_ov041_022024c8
.extern func_ov041_022025b0
.extern func_ov041_022029cc
.extern func_ov041_02202a00
.extern func_ov041_02202a3c
.extern func_ov041_02202aa4
.extern func_ov041_02202adc
.extern func_ov070_02210320
.extern gSoundContext

    .global func_ov041_02202c34
func_ov041_02202c34: ; 0x02202c34
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x24
    mov r4, r0
    ldr r1, [r4, #0x920]
    cmp r1, #0x0
    beq .L_02203320
    mov r1, #0x200
    mov r3, #0x0
    str r1, [sp, #0x4]
    str r3, [sp, #0x0]
    ldr r2, [r4, #0x924]
    cmp r2, #0x0
    subgt r0, r2, #0x1
    strgt r0, [r4, #0x924]
    bgt .L_02203318
    ldr r2, [r4, #0x920]
    cmp r2, #0x8
    bne .L_02202c84
    bl func_ov041_02202220
    b .L_02203054
.L_02202c84:
    cmp r2, #0x9
    bne .L_02202c94
    bl func_ov041_0220232c
    b .L_02203054
.L_02202c94:
    cmp r2, #0xa
    bne .L_02202cac
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_ov041_022024c8
    b .L_02203054
.L_02202cac:
    cmp r2, #0xd
    bne .L_02202f20
    ldr r2, [r4, #0x91c]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_02202e14
.L_02202cc4: ; jump table
    b .L_02202cd4 ; case 0
    b .L_02202d28 ; case 1
    b .L_02202d70 ; case 2
    b .L_02202dac ; case 3
.L_02202cd4:
    bl func_ov041_02202aa4
    ldr r1, [r4, #0x4b8]
    add r1, r1, r0, lsl #0x1
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x4b8]
    ldr r1, [r4, #0x4b4]
    ldr r0, [r4, #0x70]
    sub r0, r1, r0
    cmp r0, #0x0
    ble .L_02202e14
    mov r2, #0x1
    mov r1, #0x0
    str r2, [r4, #0x91c]
    str r1, [r4, #0x930]
    str r1, [r4, #0x934]
    ldr r0, .L_02203328
    add r1, r2, #0x12c
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_02202e14
.L_02202d28:
    ldr r0, [r4, #0x4b8]
    subs r0, r0, #0x12c
    str r0, [r4, #0x4b8]
    ldrmi r0, [r4, #0x4b8]
    addmi r0, r0, #0x10000
    strmi r0, [r4, #0x4b8]
    ldr r0, [r4, #0x4b8]
    cmp r0, #0x12c
    movlt r0, #0x0
    strlt r0, [r4, #0x4b8]
    ldrlt r0, [r4, #0x91c]
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x91c]
    ldr r0, [r4, #0x4b8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x4b8]
    b .L_02202e14
.L_02202d70:
    ldr r0, [r4, #0x48]
    ldr r2, [r4, #0x70]
    ldr r0, [r0, #0x14]
    ldr r0, [r0, #0x15c]
    sub r0, r0, #0x64000
    cmp r2, r0
    ble .L_02202dac
    ldr r0, .L_02203328
    sub r1, r1, #0xd3
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
    ldr r0, [r4, #0x91c]
    add r0, r0, #0x1
    str r0, [r4, #0x91c]
.L_02202dac:
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x70]
    ldr r0, [r0, #0x14]
    ldr r3, [r0, #0x15c]
    sub r0, r3, #0x64000
    cmp r1, r0
    ble .L_02202e14
    ldr r0, [r4, #0x93c]
    tst r0, #0xf
    bne .L_02202df0
    ldr r2, [r4, #0x6c]
    sub r1, r3, #0x14000
    ldr r0, [r4, #0x958]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x6
    bl func_ov004_021fb868 ; func_ov008_021fb868
.L_02202df0:
    ldr r0, [r4, #0x93c]
    and r0, r0, #0x3f
    cmp r0, #0x10
    bne .L_02202e14
    ldr r0, .L_02203328
    ldr r1, .L_0220332c
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
.L_02202e14:
    ldr r0, [r4, #0x91c]
    cmp r0, #0x0
    ble .L_02202e74
    ldr r0, [r4, #0x934]
    add r0, r0, #0xc8
    str r0, [r4, #0x934]
    cmp r0, #0x8000
    movgt r0, #0x8000
    strgt r0, [r4, #0x934]
    ldr r0, [r4, #0x934]
    mov r0, r0, lsl #0x2
    cmp r0, #0x10000
    movgt r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, .L_02203330
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    rsb r0, r0, #0x1000
    mov r0, r0, asr #0x1
    str r0, [r4, #0x940]
.L_02202e74:
    ldr r1, [r4, #0x48]
    mov r2, #0x29
    add r0, sp, #0x14
    str r2, [r1, #0x1ac]
    bl VecFx32Object_Init
    ldr r0, [r4, #0x6c]
    sub r0, r0, #0x80000
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x70]
    add r0, r0, #0x1e000
    str r0, [sp, #0x1c]
    ldr r1, [r4, #0x91c]
    cmp r1, #0x0
    ble .L_02202f04
    ldr r2, [r4, #0x934]
    ldr r1, .L_02203330
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r3, [r1, r2]
    mov r2, #0x0
    mov r1, #0x46000
    rsb r3, r3, #0x0
    add r3, r3, #0x1000
    umull r6, r5, r3, r1
    mla r5, r3, r2, r5
    mov r2, r3, asr #0x1f
    adds r3, r6, #0x800
    mla r5, r2, r1, r5
    adc r1, r5, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r1, r2, #0x1e000
    add r0, r0, r1
    str r0, [sp, #0x1c]
.L_02202f04:
    ldr r0, [r4, #0x48]
    add r1, sp, #0x14
    add r0, r0, #0x19c
    bl VecFx32Object_Assign
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    b .L_02203054
.L_02202f20:
    cmp r2, #0x4
    bne .L_02202f38
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_ov041_022017f8
    b .L_02203054
.L_02202f38:
    sub r1, r2, #0x6
    cmp r1, #0x1
    bhi .L_02202f54
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_ov041_02201b38
    b .L_02203054
.L_02202f54:
    sub r1, r2, #0xb
    cmp r1, #0x1
    bhi .L_02202f70
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_ov041_02201e98
    b .L_02203054
.L_02202f70:
    cmp r2, #0x3
    bne .L_02203048
    ldr r0, [r4, #0x91c]
    cmp r0, #0x1
    beq .L_02202f90
    cmp r0, #0x2
    beq .L_02202fc4
    b .L_02203004
.L_02202f90:
    ldr r1, [r4, #0x4b8]
    ldr r0, .L_02203334
    add r1, r1, #0xaa
    str r1, [r4, #0x4b8]
    cmp r1, r0
    strgt r3, [r4, #0x4b8]
    movgt r0, #0x3
    strgt r0, [r4, #0x91c]
    ldr r0, [r4, #0x4b8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x4b8]
    b .L_02203004
.L_02202fc4:
    ldr r0, [r4, #0x4b8]
    subs r0, r0, #0xaa
    str r0, [r4, #0x4b8]
    ldrmi r0, [r4, #0x4b8]
    addmi r0, r0, #0x10000
    strmi r0, [r4, #0x4b8]
    ldr r0, [r4, #0x4b8]
    cmp r0, #0xaa
    movlt r0, #0x0
    strlt r0, [r4, #0x4b8]
    movlt r0, #0x3
    strlt r0, [r4, #0x91c]
    ldr r0, [r4, #0x4b8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x4b8]
.L_02203004:
    mov r0, r4
    bl func_ov041_022029cc
    cmp r0, #0x0
    beq .L_02203054
    mov r0, #0x4
    str r0, [r4, #0x920]
    mov r0, #0x1
    str r0, [r4, #0x91c]
    mov r1, #0x50
    mov r0, r4
    str r1, [r4, #0x930]
    mov r1, #0x0
    str r1, [r4, #0x934]
    bl func_ov041_02202a00
    mov r0, r4
    bl func_ov041_02202a3c
    b .L_02203054
.L_02203048:
    cmp r2, #0xe
    bne .L_02203054
    bl func_ov041_022025b0
.L_02203054:
    ldr r0, [r4, #0x920]
    mov r6, #0x1
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0xb
    bne .L_0220309c
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x14]
    bl func_ov041_022009e8
    cmp r0, #0x0
    ldr r0, [r4, #0x944]
    addeq r0, r0, #0x2800
    addne r0, r0, #0x2000
    str r0, [r4, #0x944]
    ldr r0, [r4, #0x944]
    mov r6, r0, asr #0xc
    sub r0, r0, r6, lsl #0xc
    str r0, [r4, #0x944]
.L_0220309c:
    ldr r0, [r4, #0x920]
    cmp r0, #0xe
    bne .L_02203250
    ldr r0, [r4, #0x91c]
    cmp r0, #0xa
    movge r6, #0x0
    b .L_02203250
.L_022030b8:
    mov r0, #0x5b
    mov r8, #0xc
    sub r7, r0, #0x1
    add r5, r4, #0x68
    mov r9, r8
.L_022030cc:
    sub r2, r7, #0x1
    mla r0, r7, r8, r5
    mla r1, r2, r9, r5
    bl func_ov041_021fec04
    add r1, r4, r7, lsl #0x2
    ldr r0, [r1, #0x4b4]
    sub r7, r7, #0x1
    str r0, [r1, #0x4b8]
    ldr r0, [r1, #0x620]
    cmp r7, #0x1
    str r0, [r1, #0x624]
    bge .L_022030cc
    ldr r0, [r4, #0x928]
    cmp r0, #0x0
    beq .L_02203110
    mov r0, r4
    bl func_ov041_02201784
.L_02203110:
    ldr r1, [sp, #0x0]
    cmp r1, #0x0
    beq .L_02203190
    mov r0, #0x8000
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r1, #0x10000
    strlt r0, [sp, #0x0]
    ldr r1, [sp, #0x0]
    ldr r0, .L_02203338
    ldr r2, [sp, #0x4]
    cmp r1, r0
    subgt r0, r1, #0x10000
    strgt r0, [sp, #0x0]
    ldr r1, [sp, #0x0]
    cmp r1, #0x0
    rsblt r0, r1, #0x0
    movge r0, r1
    cmp r0, r2
    ldrlt r0, [r4, #0x4b8]
    addlt r0, r0, r1
    strlt r0, [r4, #0x4b8]
    blt .L_02203180
    ldr r0, [r4, #0x4b8]
    cmp r1, #0x0
    rsble r2, r2, #0x0
    add r0, r0, r2
    str r0, [r4, #0x4b8]
.L_02203180:
    ldr r0, [r4, #0x4b8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0x4b8]
.L_02203190:
    add r0, sp, #0x8
    bl func_ov041_021fd000
    ldr r0, [r4, #0x624]
    ldr r3, [r4, #0x4b8]
    mov r5, #0x0
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    rsb r8, r0, #0x1000
    mov r2, #0x1800
    umull r1, r0, r8, r2
    mov r7, r3, asr #0x4
    adds r1, r1, #0x800
    mla r0, r8, r5, r0
    mov r3, r8, asr #0x1f
    mla r0, r3, r2, r0
    ldr r3, .L_02203330
    mov r2, r7, lsl #0x2
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r1, #0x9a
    ldrsh r2, [r3, r2]
    add r1, r0, #0x900
    smull r5, r0, r2, r1
    adds r5, r5, #0x800
    adc r2, r0, #0x0
    mov r0, r5, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    str r0, [sp, #0xc]
    ldr r2, [r4, #0x4b8]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    add r2, r3, r2, lsl #0x2
    ldrsh r2, [r2, #0x2]
    smull r3, r1, r2, r1
    adds r2, r3, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [sp, #0x10]
    ldr r1, [r4, #0x6c]
    add r0, r1, r0
    str r0, [r4, #0x6c]
    ldr r1, [r4, #0x70]
    ldr r0, [sp, #0x10]
    add r0, r1, r0
    str r0, [r4, #0x70]
.L_02203250:
    subs r6, r6, #0x1
    bpl .L_022030b8
    ldr r0, [r4, #0x920]
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0xb
    bne .L_02203298
    mov r0, #0x5b
    sub r5, r0, #0x1
    mov r0, #0xc
.L_02203278:
    mla r3, r5, r0, r4
    ldr r1, [r4, #0x48]
    ldr r2, [r3, #0x70]
    ldr r1, [r1, #0x1b4]
    subs r5, r5, #0x1
    add r1, r2, r1
    str r1, [r3, #0x70]
    bpl .L_02203278
.L_02203298:
    mov r0, r4
    bl func_ov041_02202adc
    ldr r0, [r4, #0x920]
    cmp r0, #0xe
    cmpne r0, #0x9
    cmpne r0, #0xa
    cmpne r0, #0x8
    beq .L_02203318
    ldr r0, [r4, #0x48]
    mov r1, #0x5b
    ldr r0, [r0, #0x14]
    sub r3, r1, #0x1
    ldr r5, [r0, #0x15c]
    mov r2, #0x0
    mov r0, #0xc
.L_022032d4:
    mla r1, r3, r0, r4
    ldr r1, [r1, #0x70]
    cmp r1, r5
    addlt r2, r2, #0x1
    subs r3, r3, #0x1
    bpl .L_022032d4
    cmp r2, #0x0
    moveq r2, #0x0
    streq r2, [r4, #0x920]
    ldreq r1, [r4, #0x48]
    ldreq r0, [r1, #0x1cc]
    cmpeq r0, #0x2
    bne .L_02203318
    str r2, [r1, #0x1cc]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x8]
    bl func_ov070_02210320
.L_02203318:
    ldr r0, [r4, #0x958]
    bl func_ov008_021fbd1c
.L_02203320:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02203328: .word gSoundContext
.L_0220332c: .word 0x12d
.L_02203330: .word data_020c9670
.L_02203334: .word 0xff55
.L_02203338: .word 0x7fff
    .size func_ov041_02202c34, . - func_ov041_02202c34

