    .text
    .extern GameWork_ClearFlag
    .extern GameWork_SetFlag
    .extern data_021052fc
    .extern data_ov015_021feba8
    .extern ActorDerivedType1_StartRecord
    .extern func_02062a10
    .extern func_02062db0
    .extern func_02062e00
    .extern func_ov001_021fc7e4
    .extern func_ov015_021fce30
    .extern func_ov015_021fd68c
    .extern func_ov015_021fe548
    .extern gGameWork

/* Exact fallbacks for terminal commit phase; see src/overlays/ov015/overlay015_terminal_phases.c. */
    .global func_ov015_021fe9b8

func_ov015_021fe9b8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq L_021fe9d8
    cmp r0, #0x1
    beq L_021fea18
    b L_021feafc
L_021fe9d8:
    ldr r1, [r5, #0xf0]
    add r2, r5, #0xfc
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov015_021fe548
    cmp r0, #0x0
    beq L_021feafc
    ldr r2, [r5, #0xdc]
    mov r1, #0x0
    str r1, [r2, #0x1fc]
    mov r0, #0x1000
    str r0, [r2, #0x200]
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    stmib r5, {r0, r1}
    b L_021feafc
L_021fea18:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0xa
    ble L_021feafc
    ldr r0, [r5, #0xdc]
    bl func_ov001_021fc7e4
    ldr r4, [r0, #0xc]
    mov r0, r4
    bl func_02062e00
    ldrb r0, [r0, #0x2]
    cmp r0, #0x2
    bne L_021feab0
    mov r0, r4
    bl func_02062e00
    ldrh r0, [r0, #0x4]
    cmp r0, #0x1
    beq L_021fea74
    mov r0, r4
    bl func_02062e00
    ldrh r0, [r0, #0x4]
    cmp r0, #0x2
    bne L_021feab0
L_021fea74:
    mov r0, r4
    bl func_02062e00
    ldrh r0, [r0, #0x4]
    cmp r0, #0x1
    bne L_021fea9c
    ldr r0, L_021feb0c
    mov r1, #0x3cc
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b L_021feadc
L_021fea9c:
    ldr r0, L_021feb0c
    ldr r1, L_021feb10
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b L_021feadc
L_021feab0:
    ldr r1, L_021feb14
    mov r0, r4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r6, [r1, #0xea4]
    bl func_02062a10
    mov r1, r0
    mov r0, r6
    bl ActorDerivedType1_StartRecord
    mov r0, r4
    bl func_02062db0
L_021feadc:
    ldr r0, L_021feb0c
    ldr r1, L_021feb18
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_021feb1c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021feafc:
    mov r0, r5
    bl func_ov015_021fd68c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021feb0c: .word gGameWork
L_021feb10: .word 0x3cd
L_021feb14: .word data_021052fc
L_021feb18: .word 0x389
L_021feb1c: .word data_ov015_021feba8

    .size func_ov015_021fe9b8, . - func_ov015_021fe9b8
