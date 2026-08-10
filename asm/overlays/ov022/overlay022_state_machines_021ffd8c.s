.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern data_020f4e14
.extern data_ov022_022004e8
.extern data_ov022_02200510
.extern data_ov022_02200548
.extern data_ov022_02200560
.extern DisplayBrightness_IsMainTransitionComplete
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_02092260
.extern func_02092c8c
.extern func_020939d8
.extern func_02093d50
.extern func_02093de4
.extern func_02093e0c
.extern func_02093e20
.extern func_02093e3c
.extern func_02093e58
.extern func_02093ffc
.extern func_020945c8
.extern func_02094600
.extern func_02094638
.extern func_02094668
.extern func_02094698
.extern func_02094758
.extern func_02094874
.extern func_02095860
.extern func_ov022_021fdc30
.extern func_ov022_021fdca0
.extern func_ov022_021fdcb4
.extern func_ov022_021fdd1c
.extern func_ov022_021fefe0
.extern func_ov022_021ff048
.extern func_ov022_021ff0d0
.extern func_ov022_021ff368


    .global func_ov022_021ffd8c
func_ov022_021ffd8c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x2b8]
    ldr r4, [r1, #0x30]
    bl func_ov022_021ff368
    ldr r0, [r5, #0x4]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_0220017c
L_021ffdb0: ; jump table
    b L_021ffddc ; case 0
    b L_021ffdf8 ; case 1
    b L_021ffe44 ; case 2
    b L_022000f4 ; case 3
    b L_0220017c ; case 4
    b L_0220017c ; case 5
    b L_0220017c ; case 6
    b L_0220017c ; case 7
    b L_0220017c ; case 8
    b L_0220017c ; case 9
    b L_02200160 ; case 10
L_021ffddc:
    mov r0, r4
    bl func_02094874
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021ffdf8:
    mov r0, r4
    bl func_02093ffc
    cmp r0, #0x0
    beq L_021ffe20
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ffe44
L_021ffe20:
    ldr r0, [r5, #0x2b8]
    bl func_ov022_021fdcb4
    cmp r0, #0x0
    beq L_0220017c
    mov r0, r5
    bl func_ov022_021fefe0
    mov r0, r5
    bl func_ov022_021ff048
    b L_0220017c
L_021ffe44:
    mov r0, r4
    bl func_02093de4
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021ffe68
    mov r0, r4
    bl func_02093e0c
    b L_022000c0
L_021ffe68:
    tst r0, #0x80
    beq L_021ffe7c
    mov r0, r4
    bl func_02093e20
    b L_022000c0
L_021ffe7c:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_022000c0
    ldr r0, [r5, #0x2b8]
    add r1, r5, #0x30
    bl func_ov022_021fdc30
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl func_02094638
    cmp r0, #0x0
    mov r0, r4
    beq L_021ffebc
    bl func_02093e3c
    b L_022000c0
L_021ffebc:
    add r1, r5, #0x30
    bl func_02094668
    cmp r0, #0x0
    beq L_021ffed8
    mov r0, r4
    bl func_02093e58
    b L_022000c0
L_021ffed8:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_022000c0
    mov r0, r4
    add r1, r5, #0x30
    bl func_020945c8
    cmp r0, #0x0
    mov r0, r4
    beq L_021fff1c
    bl func_02093e3c
    cmp r0, #0x0
    bne L_022000c0
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_022000c0
L_021fff1c:
    add r1, r5, #0x30
    bl func_02094600
    cmp r0, #0x0
    mov r0, r4
    beq L_021fff4c
    bl func_02093e58
    cmp r0, #0x0
    bne L_022000c0
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_022000c0
L_021fff4c:
    add r1, r5, #0x30
    bl func_02094698
    cmp r0, #0x0
    beq L_021fff70
    ldr r1, L_0220018c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_0220017c
L_021fff70:
    cmp r6, #0x0
    blt L_0220000c
    ldr r0, [r4, #0x14]
    cmp r6, r0
    beq L_021fffc0
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    mov r0, r4
    mov r1, r6
    bl func_02093d50
    mov r0, r5
    bl func_ov022_021fefe0
    mov r0, r5
    bl func_ov022_021ff048
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_0220017c
L_021fffc0:
    ldr r0, [r5, #0x2b8]
    bl func_ov022_021fdca0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq L_021fffe4
    mov r0, r5
    mov r1, #0x9
    bl func_02092260
    b L_0220017c
L_021fffe4:
    ldr r0, [r5, #0x2cc]
    bl func_020939d8
    mov r0, r5
    mov r1, #0x2
    bl func_02092260
    ldr r1, L_02200190
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_0220017c
L_0220000c:
    add r0, r5, #0x200
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_02200074
    ldr r0, [r5, #0x2b8]
    bl func_ov022_021fdca0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq L_0220004c
    mov r0, r5
    mov r1, #0x9
    bl func_02092260
    b L_0220017c
L_0220004c:
    ldr r0, [r5, #0x2cc]
    bl func_020939d8
    mov r0, r5
    mov r1, #0x2
    bl func_02092260
    ldr r1, L_02200194
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_0220017c
L_02200074:
    add r0, r5, #0xa8
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_022000c0
    mov r0, r5
    mov r1, #0x3
    bl func_02092260
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_0220017c
L_022000c0:
    mov r0, r4
    bl func_02094758
    cmp r0, #0x0
    beq L_0220017c
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_0220017c
L_022000f4:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220017c
    ldr r0, [r5, #0x2cc]
    bl func_020939d8
    ldr r0, L_02200198
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r5, #0x48]
    bic r0, r0, #0x2
    str r0, [r5, #0x48]
    ldr r1, [r5, #0xa4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x2b8]
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, L_0220019c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_0220017c
L_02200160:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r5, #0x4]
    strgt r0, [r5, #0x8]
L_0220017c:
    mov r0, r5
    bl func_ov022_021ff0d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_0220018c: .word data_ov022_02200548
L_02200190: .word data_ov022_022004e8
L_02200194: .word data_ov022_02200560
L_02200198: .word data_020f4e14
L_0220019c: .word data_ov022_02200510
.size func_ov022_021ffd8c, .-func_ov022_021ffd8c

