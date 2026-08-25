.text

/* Exact fallback; see src/overlays/ov022/overlay022_action_setup.c. */
.extern data_020c37e4
.extern data_020d780c
.extern data_020d7828
.extern data_020d782c
.extern data_020d782e
.extern data_020d7a48
.extern data_021f3ecc
.extern GraphicsSpriteText_FormatDecimal
.extern RetailTextTable_FindRecordById
.extern SceneSound_PlayDirectSequence
.extern TitleDialog_ClearTextRect
.extern func_020befec
.extern func_ov022_021ff2c4
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern gGameWork


    .global func_ov022_021feb78
func_ov022_021feb78:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, L_021fed48
    ldr r2, L_021fed4c
    mov r4, #0x0
    mov r6, r0
    mov r5, r4
    mov r0, r4
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0x0]
    ldr lr, L_021fed50
    mov ip, #0x24
    b L_021febdc
L_021feba8:
    mul r3, r0, ip
    ldrsh r3, [lr, r3]
    ldr r7, [r6, #0x358]
    cmp r7, r3
    bne L_021febd8
    cmp r0, #0x0
    addne r3, r1, r0
    addne r3, r3, #0x5000
    ldrneb r3, [r3, #0xe94]
    add r4, r4, #0x1
    cmpne r3, #0x2
    addeq r5, r5, #0x1
L_021febd8:
    add r0, r0, #0x1
L_021febdc:
    cmp r0, r2
    blt L_021feba8
    ldr r1, [r6, #0x358]
    mov r0, #0x34
    mul r2, r1, r0
    ldr r1, L_021fed54
    ldr r0, L_021fed58
    ldrh r1, [r1, r2]
    bl RetailTextTable_FindRecordById
    add r2, r0, #0x2
    mov r3, #0x0
    b L_021fec2c
L_021fec0c:
    mov r0, r3, lsl #0x1
    ldrh r1, [r2, r0]
    add r0, r6, r3, lsl #0x1
    add r0, r0, #0x200
    strh r1, [r0, #0xd0]
    cmp r1, #0x0
    beq L_021fec34
    add r3, r3, #0x1
L_021fec2c:
    cmp r3, #0x20
    blt L_021fec0c
L_021fec34:
    ldr r0, [r6, #0x2cc]
    bl TitleDialog_ClearTextRect
    cmp r4, r5
    bne L_021fed0c
    mov r0, #0x1
    str r0, [r6, #0x2ac]
    ldr r1, [r6, #0x358]
    mov r0, #0x34
    mul r2, r1, r0
    ldr r1, L_021fed5c
    ldr r0, L_021fed48
    ldrh r1, [r1, r2]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r2, [r6, #0x358]
    mov r0, #0x34
    ldr r1, L_021fed48
    mul r3, r2, r0
    ldr r2, L_021fed60
    ldr r0, [r1, #0x0]
    ldrh r1, [r2, r3]
    bl GameWork_SetFlag
    mov r0, r6
    mov r1, #0x9c
    bl SceneSound_PlayDirectSequence
    ldr r2, [r6, #0x358]
    add r0, r6, #0x310
    mov r1, #0x34
    mul r3, r2, r1
    ldr r1, L_021fed64
    ldr r2, L_021fed68
    ldrh r1, [r1, r3]
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    ldr r0, L_021fed48
    ldr r1, L_021fed6c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fece4
    ldr r1, L_021fed70
    mov r0, r6
    bl func_ov022_021ff2c4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fece4:
    mov r1, #0x1
    str r1, [r6, #0x2b0]
    ldr r0, L_021fed48
    rsb r1, r1, #0x3cc
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r6
    mov r1, #0x20c
    bl func_ov022_021ff2c4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fed0c:
    mov r0, #0x64
    mul r0, r5, r0
    mov r2, #0x0
    mov r1, r4
    str r2, [r6, #0x2ac]
    bl func_020befec
    mov r1, r0
    ldr r2, L_021fed68
    add r0, r6, #0x310
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    mov r0, r6
    mov r1, #0x204
    bl func_ov022_021ff2c4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fed48: .word gGameWork
L_021fed4c: .word data_020c37e4
L_021fed50: .word data_020d7a48
L_021fed54: .word data_020d780c
L_021fed58: .word data_021f3ecc
L_021fed5c: .word data_020d7828
L_021fed60: .word data_020d782c
L_021fed64: .word data_020d782e
L_021fed68: .word 0xff676980
L_021fed6c: .word 0x3cb
L_021fed70: .word 0x205
.size func_ov022_021feb78, .-func_ov022_021feb78

