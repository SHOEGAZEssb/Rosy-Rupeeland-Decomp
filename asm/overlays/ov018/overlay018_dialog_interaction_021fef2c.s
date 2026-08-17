    .text
/* Exact fallback; see src/overlays/ov018/overlay018_dialog_interaction.c. */
    .extern data_ov018_021ffc00
    .extern func_02091bac
    .extern func_02091c7c
    .extern func_02091cf0
    .extern func_020922b0
    .extern func_02092c8c
    .extern TitleDialog_ClearTextRect
    .extern func_ov003_021fb7ec
    .extern func_ov018_021fcf40
    .extern func_ov018_021fd788
    .extern func_ov018_021fda10
    .extern func_ov018_021fda60
    .extern func_ov018_021fdb7c
    .extern func_ov018_021fdbd4
    .extern func_ov018_021fdce4
    .extern func_ov018_021ff3cc

.global func_ov018_021fef2c
func_ov018_021fef2c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b L_021ff194
L_021fef44: ; jump table
    b L_021fef64 ; case 0
    b L_021fef90 ; case 1
    b L_021fefcc ; case 2
    b L_021fefec ; case 3
    b L_021ff03c ; case 4
    b L_021ff0dc ; case 5
    b L_021ff114 ; case 6
    b L_021ff144 ; case 7
L_021fef64:
    mov r0, #0x2
    sub r1, r0, #0xa
    bl func_02092c8c
    ldr r1, L_021ff1a4
    mov r0, r4
    bl func_ov018_021fda10
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fef90:
    mov r0, r4
    bl func_ov018_021fda60
    cmp r0, #0x0
    beq L_021ff194
    ldr r0, [r4, #0x418]
    bl TitleDialog_ClearTextRect
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff194
L_021fefcc:
    ldr r0, L_021ff1a8
    mov r1, #0x10
    strh r1, [r0, #0x0]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fefec:
    mov r0, r4
    bl func_ov018_021fdce4
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x24]
    sub r0, r0, #0x2
    cmp r0, #0x1
    bhi L_021ff194
    mov r0, r4
    mov r1, #0x0
    bl func_ov018_021fdb7c
    mov r0, r4
    mov r1, #0x4c
    mov r2, #0x0
    bl func_020922b0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff194
L_021ff03c:
    ldr r1, [r4, #0x3c8]
    cmp r1, #0x0
    beq L_021ff060
    bl func_ov018_021fdbd4
    ldr r1, L_021ff1ac
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
    b L_021ff194
L_021ff060:
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x24]
    cmp r0, #0x2
    ldreq r0, [r4, #0x41c]
    cmpeq r0, #0x0
    bne L_021ff0c4
    mov r0, #0x2
    sub r1, r0, #0xa
    bl func_02092c8c
    ldr r0, [r4, #0x420]
    cmp r0, #0x1
    bne L_021ff0a0
    ldr r1, L_021ff1b0
    mov r0, r4
    bl func_ov018_021fda10
    b L_021ff0ac
L_021ff0a0:
    ldr r1, L_021ff1b4
    mov r0, r4
    bl func_ov018_021fda10
L_021ff0ac:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff194
L_021ff0c4:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x2
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff194
L_021ff0dc:
    bl func_ov018_021fda60
    cmp r0, #0x0
    beq L_021ff194
    ldr r0, [r4, #0x418]
    bl TitleDialog_ClearTextRect
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff194
L_021ff114:
    mov r0, #0x14
    str r0, [sp, #0x0]
    add r0, r4, #0x1a8
    mov r1, #0x1
    mov r2, #0x10
    mov r3, #0x0
    bl func_02091bac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff144:
    ldr r2, [r4, #0x1b8]
    add r0, r4, #0x1a8
    mov r1, #0x1
    rsb r5, r2, #0x10
    bl func_02091c7c
    orr r2, r0, r5, lsl #0x8
    ldr r1, L_021ff1a8
    add r0, r4, #0x1a8
    strh r2, [r1, #0x0]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021ff194
    ldr r0, [r4, #0x190]
    bl func_ov003_021fb7ec
    ldr r0, [r4, #0x58]
    bl func_ov018_021ff3cc
    mov r0, #0x2
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021ff194:
    mov r0, r4
    bl func_ov018_021fd788
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff1a4: .word 0x1ea
L_021ff1a8: .word 0x4001052
L_021ff1ac: .word data_ov018_021ffc00
L_021ff1b0: .word 0x1eb
L_021ff1b4: .word 0x20b
    .size func_ov018_021fef2c, . - func_ov018_021fef2c
