.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern Sound_Play
.extern data_020f4dc8
.extern data_ov070_022129dc
.extern data_ov070_022129f0
.extern data_ov070_02212a70
.extern func_02002ac0
.extern func_02002cd0
.extern func_02002d28
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4
.extern func_02058d40
.extern func_020593ac
.extern func_020594ec
.extern func_02072b68
.extern func_020a28e0
.extern func_020a2960
.extern func_020adc40
.extern func_020adc90
.extern func_020befec
.extern func_ov041_021fdfd0
.extern func_ov041_021feb54
.extern func_ov041_021fec1c
.extern func_ov041_021fecbc
.extern func_ov041_02200348
.extern func_ov041_022015b0
.extern func_ov070_02210218
.extern func_ov070_0221186c
.extern func_ov070_0221189c
.extern func_ov070_022126b8
.extern func_ov070_02212764
.extern func_ov070_0221282c
.extern gSoundContext
.extern gSystemState
.extern genrand_int32

.global func_ov070_02210860
func_ov070_02210860:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x74
    mov r4, r0
    add r1, r4, #0x100
    ldrh r1, [r1, #0x40]
    cmp r1, #0x0
    ldreq r1, [r4, #0x134]
    cmpeq r1, #0x0
    bne .L_02210a00
    ldr r3, [r4, #0x48]
    ldr r2, [r4, #0xd8]
    ldr r1, [r3, #0x14]
    ldr r1, [r1, #0x15c]
    cmp r2, r1
    ble .L_022108e0
    bl func_ov070_022126b8
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_022108c8
    ldr r0, .L_0221183c
    mov r1, #0x1e0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    b .L_02210a00
.L_022108c8:
    ldr r0, .L_0221183c
    ldr r1, .L_02211840
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl Sound_Play
    b .L_02210a00
.L_022108e0:
    ldr r0, [r4, #0x138]
    cmp r0, #0x0
    bne .L_02210a00
    ldr r0, [r3, #0xc]
    cmp r0, #0x0
    beq .L_02210a00
    add r0, sp, #0x68
    bl func_ov070_02210218
    ldr r3, [r4, #0xe0]
    ldr r2, [r4, #0xd4]
    ldr r1, [r4, #0xe4]
    ldr r0, [r4, #0xd8]
    sub r5, r3, r2
    sub r6, r1, r0
    smull r0, r2, r5, r5
    adds r3, r0, #0x800
    smull r1, r0, r6, r6
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    movs r7, r0
    bne .L_02210968
    ldr r0, [r4, #0xd4]
    str r0, [sp, #0x6c]
    ldr r0, [r4, #0xd8]
    add r0, r0, #0xa000
    str r0, [sp, #0x70]
    b .L_022109c8
.L_02210968:
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r5, r0
    mov r0, r6
    mov r1, r7
    bl func_020adc90
    sub r2, r7, #0x14000
    smull r1, r3, r5, r2
    adds r5, r1, #0x800
    smull r2, r1, r0, r2
    adc r0, r3, #0x0
    adds r2, r2, #0x800
    mov r3, r5, lsr #0xc
    ldr r5, [r4, #0xd4]
    orr r3, r3, r0, lsl #0x14
    add r0, r5, r3
    str r0, [sp, #0x6c]
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r4, #0xd8]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [sp, #0x70]
.L_022109c8:
    ldr r0, [r4, #0x48]
    ldr r1, [sp, #0x6c]
    ldr r0, [r0, #0xc]
    ldr r2, [sp, #0x70]
    bl func_ov041_022015b0
    cmp r0, #0x1
    bne .L_02210a00
    mov r0, r4
    bl func_ov070_02212764
    ldr r0, .L_0221183c
    ldr r1, .L_02211840
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
.L_02210a00:
    ldr r0, [r4, #0x11c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x134]
    cmpeq r0, #0x0
    bne .L_02210f08
    ldr r0, [r4, #0x48]
    ldr r1, .L_02211844
    str r1, [r0, #0x1ac]
    ldr r0, [r4, #0x48]
    ldr r1, [r0, #0x1cc]
    cmp r1, #0x1
    ldrne r1, [r0, #0x1c4]
    cmpne r1, #0x0
    beq .L_02210d70
    ldr r1, [r4, #0xd4]
    ldr r2, [r4, #0xd8]
    mov r3, #0x28000
    bl func_ov041_021fec1c
    cmp r0, #0x0
    beq .L_02210a8c
    ldr r0, [r4, #0x118]
    cmp r0, #0x0
    bne .L_02210a84
    ldr r0, .L_0221183c
    ldr r1, .L_02211840
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_Play
    mov r2, #0x0
    add r0, r4, #0x104
    add r1, r4, #0xd0
    str r2, [r4, #0x110]
    bl func_ov070_0221189c
.L_02210a84:
    mov r0, #0x1
    str r0, [r4, #0x118]
.L_02210a8c:
    ldr r0, [r4, #0x118]
    cmp r0, #0x0
    beq .L_0221173c
    ldr r1, [r4, #0x48]
    add r0, sp, #0x8
    bl func_ov070_0221186c
    add r1, sp, #0x8
    add r0, r4, #0xdc
    bl func_ov070_0221189c
    ldr r3, [r4, #0xe0]
    ldr r2, [r4, #0xd4]
    ldr r1, [r4, #0xe4]
    ldr r0, [r4, #0xd8]
    sub r6, r3, r2
    sub r7, r1, r0
    smull r0, r2, r6, r6
    adds r3, r0, #0x800
    smull r1, r0, r7, r7
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    ldr r8, [r4, #0xf8]
    mov r5, r0
    cmp r5, r8
    ble .L_02210c48
    mov r0, r6
    mov r1, r5
    bl func_020adc90
    smull r1, r2, r0, r8
    adds r3, r1, #0x800
    mov r1, r5
    ldr r6, [r4, #0xf8]
    mov r0, r7
    adc r2, r2, #0x0
    mov r5, r3, lsr #0xc
    orr r5, r5, r2, lsl #0x14
    bl func_020adc90
    smull r2, r1, r0, r6
    adds r2, r2, #0x800
    ldr r0, [r4, #0xd4]
    adc r1, r1, #0x0
    add r0, r0, r5
    mov r6, r2, lsr #0xc
    str r0, [r4, #0xe0]
    ldr r0, [r4, #0xd8]
    orr r6, r6, r1, lsl #0x14
    add r0, r0, r6
    ldr r8, .L_02211848
    str r0, [r4, #0xe4]
    ldmia r8!, {r0, r1, r2, r3}
    add r7, sp, #0x54
    stmia r7!, {r0, r1, r2, r3}
    ldr r0, [r8, #0x0]
    mov r1, #0x46
    str r0, [r7, #0x0]
    ldr r0, [r4, #0x130]
    add r7, r0, #0x1
    mov r0, r7
    str r7, [r4, #0x130]
    bl func_020befec
    mov r2, r0
    cmp r2, #0x4
    movgt r2, #0x4
    add r1, sp, #0x54
    ldr r1, [r1, r2, lsl #0x2]
    mov r0, r7
    bl func_020befec
    cmp r1, #0x0
    bne .L_02210c50
    add r0, sp, #0x48
    bl func_ov070_02210218
    ldr r0, .L_0221184c
    mov r1, #0x0
    umull r8, r7, r5, r0
    mla r7, r5, r1, r7
    umull r2, r3, r6, r0
    mov r5, r5, asr #0x1f
    mla r7, r5, r0, r7
    adds r8, r8, #0x800
    adc r5, r7, #0x0
    mov r7, r8, lsr #0xc
    mla r3, r6, r1, r3
    adds r2, r2, #0x800
    orr r7, r7, r5, lsl #0x14
    mov r5, r2, lsr #0xc
    mov r2, r6, asr #0x1f
    mla r3, r2, r0, r3
    ldr r8, [r4, #0xd4]
    adc r0, r3, #0x0
    add r7, r8, r7
    str r7, [sp, #0x4c]
    orr r5, r5, r0, lsl #0x14
    ldr r2, [r4, #0xd8]
    ldr r0, .L_02211850
    add r2, r2, r5
    str r2, [sp, #0x50]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    ldr r2, [sp, #0x4c]
    ldr r3, [sp, #0x50]
    ldr r0, [r0, #0x18]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_020a2960
    b .L_02210c50
.L_02210c48:
    mov r0, #0x0
    str r0, [r4, #0x130]
.L_02210c50:
    ldr r3, [r4, #0xe0]
    ldr r2, [r4, #0x108]
    ldr r1, [r4, #0xe4]
    ldr r0, [r4, #0x10c]
    sub r5, r3, r2
    sub r6, r1, r0
    smull r0, r2, r5, r5
    adds r3, r0, #0x800
    smull r1, r0, r6, r6
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r1, #0x2000
    rsb r1, r1, #0x0
    cmp r0, r1
    blt .L_02210cb0
    cmp r0, #0x2000
    ble .L_0221173c
.L_02210cb0:
    ldr r3, [r4, #0xd8]
    ldr r2, [r4, #0x10c]
    ldr r1, [r4, #0xd4]
    ldr r0, [r4, #0x108]
    sub r7, r3, r2
    sub r1, r1, r0
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, r7, r7
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    ldr r7, [r4, #0xf8]
    mov r8, r0
    mov r0, #0x60
    mul r0, r8, r0
    mov r1, r7
    bl func_020befec
    mov r1, r7
    mov r7, r0
    ldr r0, .L_02211854
    mul r0, r8, r0
    bl func_020befec
    add r3, r7, #0x1f
    mov r1, #0x0
    str r1, [sp, #0x0]
    sub r0, r0, #0x3e8
    str r0, [sp, #0x4]
    ldr r0, .L_0221183c
    ldr r1, .L_02211840
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_020593ac
    add r0, r5, r5, lsr #0x1f
    add r1, r6, r6, lsr #0x1f
    ldr r2, [r4, #0x108]
    add r0, r2, r0, asr #0x1
    str r0, [r4, #0x108]
    ldr r0, [r4, #0x10c]
    add r0, r0, r1, asr #0x1
    str r0, [r4, #0x10c]
    b .L_0221173c
.L_02210d70:
    ldr r0, [r4, #0x118]
    cmp r0, #0x0
    beq .L_0221173c
    ldr r3, [r4, #0xe0]
    ldr r2, [r4, #0xd4]
    ldr r1, [r4, #0xe4]
    ldr r0, [r4, #0xd8]
    sub r5, r3, r2
    sub r6, r1, r0
    smull r0, r2, r5, r5
    adds r3, r0, #0x800
    smull r1, r0, r6, r6
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    cmp r0, #0x22000
    movlt r0, #0x0
    strlt r0, [r4, #0x118]
    blt .L_0221173c
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x120]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x9c]
    cmp r1, r0
    bne .L_02210e68
    mov r5, #0x0
    ldr r0, .L_02211858
    mov r1, r5
    add r2, r4, #0x100
    mov r3, #0x1
    strh r3, [r2, #0x40]
    mov r6, #0x78000
    bl func_02002d28
    mov r1, r5
    mov r2, #0x10
    mov r3, #0x1e
    bl func_02002ac0
    ldr r0, .L_02211858
    mov r1, #0x1
    bl func_02002d28
    mov r1, r5
    mov r2, #0x10
    mov r3, #0x1e
    bl func_02002ac0
    ldr r0, .L_0221183c
    mov r1, r5
    ldr r0, [r0, #0x0]
    bl func_02058d40
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1f4]
    cmp r0, #0x2
    beq .L_02210e68
    ldr r0, .L_0221183c
    mov r1, #0x4
    ldr r0, [r0, #0x0]
    bl func_020594ec
.L_02210e68:
    mov r2, #0xa4
    umull r0, ip, r5, r2
    mov r1, #0x0
    umull r3, r7, r6, r2
    adds lr, r0, #0x800
    mov r0, #0x1
    mla ip, r5, r1, ip
    mov r5, r5, asr #0x1f
    mla ip, r5, r2, ip
    adc ip, ip, #0x0
    mov lr, lr, lsr #0xc
    adds r5, r3, #0x800
    orr lr, lr, ip, lsl #0x14
    mla r7, r6, r1, r7
    mov r3, r6, asr #0x1f
    mla r7, r3, r2, r7
    adc r2, r7, #0x0
    mov r3, r5, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r0, [r4, #0x11c]
    rsb r0, lr, #0x0
    str r0, [r4, #0xec]
    rsb r0, r3, #0x0
    str r0, [r4, #0xf0]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x6c]
    mov r3, #0x0
    ldr r6, [r0, #0xc]
    ldr r0, .L_0221183c
    ldrh r5, [r6, #0x24]
    ldr r1, .L_02211840
    mov r2, #0x3
    orr r5, r5, #0x2
    strh r5, [r6, #0x24]
    str r3, [r4, #0x124]
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b .L_0221173c
.L_02210f08:
    ldr r0, [r4, #0x134]
    cmp r0, #0x0
    ble .L_02210ffc
    add r0, r0, #0x1
    str r0, [r4, #0x134]
    cmp r0, #0x1e
    blt .L_0221167c
    bne .L_02210f54
    mov r0, #0x6000
    rsb r0, r0, #0x0
    str r0, [r4, #0xf0]
    ldr r1, [r4, #0x48]
    mov r2, #0x0
    ldr r0, .L_0221183c
    str r2, [r1, #0x1ac]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02211840
    mov r2, #0xa
    bl Sound_Play
.L_02210f54:
    ldr r0, [r4, #0xf0]
    add r0, r0, #0x33
    add r1, r0, #0x300
    str r1, [r4, #0xf0]
    ldr r0, [r4, #0xd8]
    add r0, r0, r1
    str r0, [r4, #0xd8]
    ldr r7, [r4, #0x48]
    ldr r0, [r7, #0x1dc]
    cmp r0, #0x0
    beq .L_0221167c
    ldr r0, [r4, #0x134]
    tst r0, #0x1
    beq .L_0221167c
    ldr r6, .L_0221185c
    add r5, sp, #0x30
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldr r0, [r7, #0x1e8]
    cmp r0, #0x0
    ldrgt r0, [r7, #0x1e4]
    cmpgt r0, #0x0
    movgt r5, #0x4
    bgt .L_02210fcc
    ldr r0, [r7, #0x1e4]
    cmp r0, #0x0
    movgt r5, #0x2
    movle r5, #0x0
.L_02210fcc:
    bl genrand_int32
    and r1, r0, #0x1
    add r0, sp, #0x30
    add r1, r5, r1
    ldr r1, [r0, r1, lsl #0x2]
    ldr r2, [r4, #0xd4]
    ldr r3, [r4, #0xd8]
    mov r0, r4
    bl func_ov070_0221282c
    ldr r0, [r4, #0x48]
    bl func_ov041_021fecbc
    b .L_0221167c
.L_02210ffc:
    ldr r0, [r4, #0x138]
    cmp r0, #0x0
    beq .L_022110e0
    ldr r1, [r4, #0xf0]
    ldr r0, [r4, #0xf4]
    add r1, r1, r0, lsl #0x1
    str r1, [r4, #0xf0]
    ldr r0, [r4, #0xd8]
    add r0, r0, r1
    str r0, [r4, #0xd8]
    ldr r5, [r4, #0x48]
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_0221106c
    ldr r0, [r4, #0x138]
    mov r1, #0xa
    bl func_020befec
    cmp r1, #0x0
    bne .L_0221106c
    mov r0, #0x32
    str r0, [sp, #0x0]
    ldr r2, [r4, #0xd4]
    ldr r1, [r4, #0xd8]
    ldr r0, [r5, #0x18]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x1
    bl func_020a28e0
.L_0221106c:
    ldr r0, [r4, #0x138]
    add r0, r0, #0x1
    str r0, [r4, #0x138]
    cmp r0, #0x32
    ble .L_0221167c
    ldr r0, [r4, #0xd4]
    ldr r2, [r4, #0xd8]
    add r1, r0, #0x80000
    ldr r0, [r4, #0x48]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl func_ov041_021feb54
    ldr r1, [r4, #0x48]
    mov r5, r0
    ldr r0, [r1, #0xc]
    cmp r0, #0x0
    beq .L_022110c4
    ldr r1, [r4, #0xe0]
    ldr r2, [r4, #0xe4]
    bl func_ov041_022015b0
    cmp r0, #0x1
    addeq r5, r5, #0x1
.L_022110c4:
    cmp r5, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x138]
    ldrne r0, [r4, #0x138]
    subne r0, r0, #0xc
    strne r0, [r4, #0x138]
    b .L_0221167c
.L_022110e0:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x40]
    cmp r0, #0x0
    beq .L_02211144
    ldr r2, [r4, #0xd8]
    ldr r1, [r4, #0xf0]
    ldr r0, .L_02211858
    add r2, r2, r1
    mov r1, #0x0
    str r2, [r4, #0xd8]
    bl func_02002d28
    bl func_02002cd0
    cmp r0, #0x10
    bne .L_0221167c
    ldr r0, [r4, #0x48]
    ldr r1, [r0, #0x1f4]
    cmp r1, #0x2
    beq .L_02211138
    bl func_ov041_021fdfd0
    mov r0, #0x0
    str r0, [r4, #0xf0]
    b .L_02211834
.L_02211138:
    mov r1, #0x5
    str r1, [r0, #0x1cc]
    b .L_0221167c
.L_02211144:
    ldr r6, [r4, #0x100]
    ldr r1, [r4, #0x48]
    mov r2, #0xcd
    ldr r0, .L_02211860
    str r2, [r1, #0x1ac]
    ldrh r0, [r0, #0x1a]
    mov r5, #0x0
    tst r0, #0x40
    beq .L_022111ec
    mov r0, #0x64
    str r0, [r4, #0x128]
    ldr r0, [r4, #0x12c]
    sub r6, r6, #0x800
    tst r0, #0xf
    bne .L_022111c0
    add r0, sp, #0x24
    bl func_ov070_02210218
    ldr r1, [r4, #0xd4]
    ldr r0, .L_02211850
    str r1, [sp, #0x28]
    ldr r2, [r4, #0xd8]
    mov r1, r5
    str r2, [sp, #0x2c]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    ldr r2, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    ldr r0, [r0, #0x18]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_020a2960
.L_022111c0:
    ldr r0, [r4, #0xf0]
    cmp r0, #0x0
    ble .L_022111ec
    ldr r0, [r4, #0x12c]
    tst r0, #0x1f
    bne .L_022111ec
    ldr r0, .L_0221183c
    ldr r1, .L_02211840
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    bl Sound_Play
.L_022111ec:
    ldr r0, .L_02211860
    ldrh r0, [r0, #0x1a]
    tst r0, #0x80
    movne r0, #0x0
    strne r0, [r4, #0x128]
    ldr r0, .L_02211860
    addne r6, r6, #0x2000
    ldrh r0, [r0, #0x1c]
    tst r0, #0x20
    movne r5, #0x3
    tst r0, #0x10
    ldr r0, [r4, #0xf0]
    movne r5, #0x4
    cmp r0, #0x0
    ble .L_02211254
    cmp r5, #0x3
    ldreq r1, [r4, #0xec]
    ldreq r0, [r4, #0xfc]
    subeq r0, r1, r0
    streq r0, [r4, #0xec]
    cmp r5, #0x4
    ldreq r1, [r4, #0xec]
    ldreq r0, [r4, #0xfc]
    addeq r0, r1, r0
    streq r0, [r4, #0xec]
    b .L_022112b8
.L_02211254:
    cmp r5, #0x3
    bne .L_02211280
    ldr r0, [r4, #0xfc]
    mov r1, #0x5
    bl func_020befec
    ldr r1, [r4, #0xec]
    sub r0, r1, r0
    str r0, [r4, #0xec]
    ldr r0, [r4, #0xf0]
    add r0, r0, #0xf6
    str r0, [r4, #0xf0]
.L_02211280:
    cmp r5, #0x4
    bne .L_022112ac
    ldr r0, [r4, #0xfc]
    mov r1, #0x5
    bl func_020befec
    ldr r1, [r4, #0xec]
    add r0, r1, r0
    str r0, [r4, #0xec]
    ldr r0, [r4, #0xf0]
    add r0, r0, #0xf6
    str r0, [r4, #0xf0]
.L_022112ac:
    cmp r5, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x128]
.L_022112b8:
    ldr r0, [r4, #0x6c]
    ldr r2, [r0, #0xc]
    ldrb r1, [r2, #0x38]
    add r0, r1, #0xfd
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_02211314
    ldrh r0, [r2, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_022113d0
    mov r1, #0x0
    str r1, [r4, #0x128]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_022113d0
.L_02211314:
    cmp r1, #0x2
    bne .L_0221135c
    ldrh r0, [r2, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0221139c
    mov r1, #0x0
    str r1, [r4, #0x128]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_0221139c
.L_0221135c:
    ldr r0, [r4, #0x128]
    add r0, r0, #0x1
    str r0, [r4, #0x128]
    cmp r0, #0xc
    ble .L_0221139c
    mov r0, #0x0
    str r0, [r4, #0x128]
    ldr r0, [r4, #0x6c]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0221139c:
    ldr r0, [r4, #0x124]
    cmp r0, r5
    beq .L_022113d0
    str r5, [r4, #0x124]
    ldr r0, [r4, #0x6c]
    and r1, r5, #0xff
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022113d0:
    ldr r2, [r4, #0xec]
    ldr r0, .L_02211864
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, r5, #0x800
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0xec]
    ldr r1, [r4, #0xf0]
    ldr r0, [r4, #0xf4]
    add r0, r1, r0
    str r0, [r4, #0xf0]
    cmp r0, r6
    strgt r6, [r4, #0xf0]
    ldr r0, [r4, #0x13c]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r4, #0x13c]
    ldr r5, [r4, #0xd8]
    ldr r1, [r4, #0xd4]
    ldr r0, [r4, #0xec]
    ldr r3, [r4, #0xf0]
    add r0, r1, r0
    add r0, r0, #0x80000
    mov r6, r0, asr #0xc
    mov r2, r5, asr #0xc
    ldr r0, [r4, #0x48]
    mov r1, r6
    add r5, r5, r3
    bl func_ov041_021feb54
    ldr r1, [r4, #0xd8]
    mov r7, r0
    mov r2, r1, asr #0xc
    ldr r0, [r4, #0x48]
    mov r1, r6
    add r2, r2, #0x12
    bl func_ov041_021feb54
    cmp r7, #0x90
    blt .L_02211484
    cmp r7, #0x99
    movle r7, #0x0
.L_02211484:
    cmp r7, #0xb0
    blt .L_02211494
    cmp r7, #0xb9
    movle r7, #0x0
.L_02211494:
    cmp r0, #0x90
    blt .L_022114a4
    cmp r0, #0x99
    movle r0, #0x0
.L_022114a4:
    cmp r0, #0xb0
    blt .L_022114b4
    cmp r0, #0xb9
    movle r0, #0x0
.L_022114b4:
    cmp r7, #0x0
    cmpeq r0, #0x0
    ldrne r0, [r4, #0xec]
    mov r6, r5, asr #0xc
    rsbne r0, r0, #0x0
    strne r0, [r4, #0xec]
    ldr r0, [r4, #0xd4]
    mov r2, r6
    add r1, r0, #0x80000
    ldr r0, [r4, #0x48]
    mov r1, r1, asr #0xc
    bl func_ov041_021feb54
    ldr r1, [r4, #0xd4]
    mov r5, r0
    add r1, r1, #0x80000
    ldr r0, [r4, #0x48]
    mov r1, r1, asr #0xc
    add r2, r6, #0x12
    bl func_ov041_021feb54
    cmp r5, #0x90
    blt .L_02211510
    cmp r5, #0x99
    movle r5, #0x0
.L_02211510:
    cmp r5, #0xb0
    blt .L_02211520
    cmp r5, #0xb9
    movle r5, #0x0
.L_02211520:
    cmp r0, #0x90
    blt .L_02211530
    cmp r0, #0x99
    movle r0, #0x0
.L_02211530:
    cmp r0, #0xb0
    blt .L_02211540
    cmp r0, #0xb9
    movle r0, #0x0
.L_02211540:
    cmp r0, #0x20
    blt .L_02211558
    mov r0, r4
    bl func_ov070_02212764
    mov r0, #0x0
    mov r5, r0
.L_02211558:
    cmp r5, #0x0
    cmpeq r0, #0x0
    ldrne r0, [r4, #0xf0]
    mov r2, #0x0
    rsbne r0, r0, #0x0
    strne r0, [r4, #0xf0]
    ldr r1, [r4, #0xd4]
    ldr r0, [r4, #0xec]
    add r0, r1, r0
    str r0, [r4, #0xd4]
    ldr r1, [r4, #0xd8]
    ldr r0, [r4, #0xf0]
    add r0, r1, r0
    str r0, [r4, #0xd8]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_022115b4
    ldr r2, [r4, #0xd8]
    ldr r1, [r4, #0xd4]
    add r2, r2, #0x8000
    bl func_ov041_022015b0
    mov r2, r0
.L_022115b4:
    ldr r0, [r4, #0x138]
    cmp r0, #0x0
    bne .L_022115d0
    cmp r2, #0x0
    beq .L_022115d0
    mov r0, r4
    bl func_ov070_02212764
.L_022115d0:
    ldr r0, [r4, #0x48]
    add r1, r4, #0xd0
    ldr r0, [r0, #0x10]
    bl func_ov041_02200348
    mov r5, r0
    mvn r0, #0x0
    cmp r5, r0
    ble .L_02211678
    ldr r0, [r4, #0x120]
    cmp r0, r5
    beq .L_0221167c
    ldr r0, [r4, #0x48]
    mov r1, #0xc
    ldr r2, [r0, #0x10]
    add r0, r4, #0xd0
    ldr r2, [r2, #0x84]
    mla r1, r5, r1, r2
    bl func_ov070_0221189c
    mov r0, #0x0
    str r0, [r4, #0x118]
    str r0, [r4, #0x11c]
    str r0, [r4, #0x138]
    ldr r0, [r4, #0x6c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    str r5, [r4, #0x120]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1cc]
    cmp r0, #0x1
    beq .L_0221167c
    ldr r0, .L_0221183c
    ldr r1, .L_02211840
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_Play
    b .L_0221167c
.L_02211678:
    str r0, [r4, #0x120]
.L_0221167c:
    ldr r0, [r4, #0xd4]
    str r0, [r4, #0xe0]
    ldr r0, [r4, #0xd8]
    str r0, [r4, #0xe4]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1cc]
    cmp r0, #0x1
    beq .L_0221173c
    add r0, sp, #0x14
    bl func_02004fe0
    ldr r1, [r4, #0xd4]
    ldr r0, .L_02211868
    sub r1, r1, #0x80000
    str r1, [sp, #0x18]
    ldr r1, [r4, #0x11c]
    ldr r2, [r4, #0xd8]
    ldr r0, [r0, r1, lsl #0x2]
    sub r0, r2, r0
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x11c]
    cmp r0, #0x0
    beq .L_02211724
    ldr r2, [r4, #0xf0]
    mov r0, #0x46000
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, r5, #0x800
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    mov r0, #0x46000
    cmp r1, #0x46000
    movgt r1, #0x3c000
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r1, r0, #0xa000
    ldr r0, [sp, #0x1c]
    add r0, r0, r1
    str r0, [sp, #0x1c]
.L_02211724:
    ldr r0, [r4, #0x48]
    add r1, sp, #0x14
    add r0, r0, #0x19c
    bl func_020050a4
    add r0, sp, #0x14
    bl func_02005058
.L_0221173c:
    ldr r2, [r4, #0x120]
    mvn r0, #0x0
    cmp r2, r0
    ble .L_022117bc
    ldr r0, [r4, #0x11c]
    cmp r0, #0x0
    bne .L_022117bc
    ldr r0, [r4, #0x48]
    ldr r1, [r0, #0x10]
    ldr r0, [r1, #0x90]
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_022117a8
    mvn r0, #0x0
    str r0, [r4, #0x120]
    mov r0, #0x1
    str r0, [r4, #0x11c]
    mov r0, #0x0
    str r0, [r4, #0xec]
    ldr r0, [r4, #0xf4]
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x2
    str r0, [r4, #0xf0]
    b .L_022117bc
.L_022117a8:
    ldr r1, [r1, #0x84]
    mov r0, #0xc
    mla r1, r2, r0, r1
    add r0, r4, #0xd0
    bl func_ov070_0221189c
.L_022117bc:
    ldr r0, [r4, #0x11c]
    cmp r0, #0x0
    bne .L_022117f0
    ldr r0, [r4, #0x118]
    cmp r0, #0x0
    beq .L_022117f0
    ldr r0, [r4, #0x134]
    cmp r0, #0x0
    ldreq r1, [r4, #0x6c]
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x42]
    beq .L_02211834
.L_022117f0:
    ldr r1, [r4, #0xd4]
    ldr r0, [r4, #0x6c]
    str r1, [r0, #0x30]
    ldr r0, [r4, #0x11c]
    ldr r1, [r4, #0xd8]
    cmp r0, #0x0
    ldreq r0, [r4, #0x6c]
    addeq r1, r1, #0x1c000
    ldrne r0, [r4, #0x6c]
    addne r1, r1, #0x12000
    str r1, [r0, #0x34]
    ldr r1, [r4, #0x6c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0xd8]
    str r0, [r4, #0xe4]
.L_02211834:
    add sp, sp, #0x74
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0221183c: .word gSoundContext
.L_02211840: .word 0x12d
.L_02211844: .word 0x19a
.L_02211848: .word data_ov070_022129dc
.L_0221184c: .word 0xb33
.L_02211850: .word 0x77bb
.L_02211854: .word 0x9c4
.L_02211858: .word data_020f4dc8
.L_0221185c: .word data_ov070_022129f0
.L_02211860: .word gSystemState
.L_02211864: .word 0xf85
.L_02211868: .word data_ov070_02212a70
.size func_ov070_02210860, . - func_ov070_02210860
