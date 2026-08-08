.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_gameplay_state.c for documented portable C. */
.extern data_ov030_021ff778
.extern func_02010b64
.extern func_02010c00
.extern func_02091bac
.extern func_02091c7c
.extern func_02091cf0
.extern func_02092260
.extern func_020922f0
.extern func_020939d8
.extern func_02095860
.extern func_02095928
.extern func_ov030_021fd434
.extern func_ov030_021fd694
.extern func_ov030_021fd720
.extern func_ov030_021fda14
.extern func_ov030_021fe768
.extern func_ov030_021fe954
.extern func_ov030_021fea00
.extern func_ov030_021ff574
.extern func_ov045_0220b924
.extern func_ov045_0220b9b8
.extern func_ov045_0220bc34
.extern gLupyContext


    .global func_ov030_021ff038
func_ov030_021ff038:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov030_021fea00
    ldr r0, [r4, #0x4]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_021ff548
L_021ff054: ; jump table
    b L_021ff070 ; case 0
    b L_021ff094 ; case 1
    b L_021ff29c ; case 2
    b L_021ff354 ; case 3
    b L_021ff460 ; case 4
    b L_021ff4d0 ; case 5
    b L_021ff520 ; case 6
L_021ff070:
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    add r0, r0, #0x1b8
    bl func_ov030_021fd694
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff094:
    ldr r0, [r4, #0x20]
    mov r1, r0, lsl #0x1a
    movs r1, r1, asr #0x1f
    beq L_021ff0b8
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    add r0, r0, #0x1b8
    bl func_ov030_021fd694
    b L_021ff0d0
L_021ff0b8:
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_021ff0d0
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    bl func_ov030_021fd720
L_021ff0d0:
    ldr r0, [r4, #0x2c4]
    add r0, r0, #0x1d0
    bl func_ov030_021ff574
    cmp r0, #0x0
    beq L_021ff0f0
    mov r0, r4
    mov r1, #0x31
    bl func_02092260
L_021ff0f0:
    ldr r0, [r4, #0x2c4]
    add r0, r0, #0x1d8
    bl func_ov030_021ff574
    cmp r0, #0x0
    beq L_021ff110
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
L_021ff110:
    ldr r0, [r4, #0x2c4]
    add r0, r0, #0x1e0
    bl func_ov030_021ff574
    cmp r0, #0x0
    beq L_021ff130
    mov r0, r4
    mov r1, #0x26
    bl func_02092260
L_021ff130:
    ldr r0, [r4, #0x2c4]
    ldr r0, [r0, #0x1b0]
    ldr r0, [r0, #0x0]
    cmp r0, #0x3
    blt L_021ff548
    ldr r0, [r4, #0x2bc]
    mov r5, #0x0
    bl func_020939d8
    ldr r0, [r4, #0x2c4]
    ldr r0, [r0, #0x1b0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    beq L_021ff1f0
    cmp r0, #0x2
    beq L_021ff1b0
    cmp r0, #0x3
    bne L_021ff230
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    mov r0, r4
    bne L_021ff194
    mov r1, #0x1f4
    ldr r5, L_021ff558
    bl func_ov030_021fe954
    b L_021ff1a0
L_021ff194:
    mov r1, #0x31c
    ldr r5, L_021ff55c
    bl func_ov030_021fe954
L_021ff1a0:
    mov r0, r4
    mov r1, #0xe5
    bl func_020922f0
    b L_021ff248
L_021ff1b0:
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    bne L_021ff1d0
    mov r5, #0x1f4
    mov r0, r4
    sub r1, r5, #0x1
    bl func_ov030_021fe954
    b L_021ff1e0
L_021ff1d0:
    mov r5, #0x3e8
    mov r0, r4
    sub r1, r5, #0xcd
    bl func_ov030_021fe954
L_021ff1e0:
    mov r0, r4
    mov r1, #0xe6
    bl func_020922f0
    b L_021ff248
L_021ff1f0:
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    bne L_021ff210
    mov r5, #0xa
    mov r0, r4
    add r1, r5, #0x1e8
    bl func_ov030_021fe954
    b L_021ff220
L_021ff210:
    ldr r1, L_021ff560
    mov r0, r4
    mov r5, #0x64
    bl func_ov030_021fe954
L_021ff220:
    mov r0, r4
    mov r1, #0xe6
    bl func_020922f0
    b L_021ff248
L_021ff230:
    ldr r1, L_021ff564
    mov r0, r4
    bl func_ov030_021fe954
    mov r0, r4
    mov r1, #0xe7
    bl func_020922f0
L_021ff248:
    cmp r5, #0x0
    beq L_021ff284
    ldr r0, L_021ff568
    ldr r0, [r0, #0x0]
    bl func_02010b64
    mov r1, r0
    ldr r0, [r4, #0x2c8]
    mov r2, r5
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_021ff568
    mov r2, r0
    ldr r0, [r1, #0x0]
    mov r1, r5
    bl func_02010c00
L_021ff284:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff548
L_021ff29c:
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_021ff2f4
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_021ff2f4
    ldr r0, [r4, #0x2c4]
    add r0, r0, #0x104
    bl func_02095928
    ldr r1, [r4, #0x2c4]
    ldr r0, [r1, #0x1b4]
    cmp r0, #0x0
    beq L_021ff2e0
    add r0, r1, #0x58
    bl func_02095928
L_021ff2e0:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff2f4:
    ldr r0, [r4, #0x20]
    mov r1, r0, lsl #0x1a
    movs r1, r1, asr #0x1f
    beq L_021ff318
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    add r0, r0, #0x1b8
    bl func_ov030_021fd694
    b L_021ff330
L_021ff318:
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_021ff330
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    bl func_ov030_021fd720
L_021ff330:
    ldr r0, [r4, #0x2c4]
    add r0, r0, #0x1e0
    bl func_ov030_021ff574
    cmp r0, #0x0
    beq L_021ff548
    mov r0, r4
    mov r1, #0x26
    bl func_02092260
    b L_021ff548
L_021ff354:
    ldr r0, [r4, #0x20]
    mov r1, r0, lsl #0x1a
    movs r1, r1, asr #0x1f
    beq L_021ff424
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    add r0, r0, #0x58
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021ff3d4
    mov r0, r4
    mov r1, #0xb
    bl func_02092260
    ldr r0, [r4, #0x2bc]
    bl func_020939d8
    ldr r1, L_021ff56c
    mov r0, r4
    bl func_ov030_021fe954
    mov r2, #0x10
    str r2, [sp, #0x0]
    add r0, r4, #0x340
    mov r1, #0x2
    mov r3, #0xa8
    bl func_02091bac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff410
L_021ff3d4:
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    add r0, r0, #0x104
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021ff410
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021ff570
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
L_021ff410:
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    add r0, r0, #0x1b8
    bl func_ov030_021fd694
    b L_021ff43c
L_021ff424:
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_021ff43c
    ldr r0, [r4, #0x2c4]
    add r1, r4, #0x30
    bl func_ov030_021fd720
L_021ff43c:
    ldr r0, [r4, #0x2c4]
    add r0, r0, #0x1e0
    bl func_ov030_021ff574
    cmp r0, #0x0
    beq L_021ff548
    mov r0, r4
    mov r1, #0x26
    bl func_02092260
    b L_021ff548
L_021ff460:
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220b9b8
    add r0, r4, #0x340
    mov r1, #0x1
    bl func_02091c7c
    str r0, [r4, #0x33c]
    str r0, [r4, #0x338]
    mov r2, r0
    ldr r1, [r4, #0x2c4]
    add r0, r4, #0x340
    str r2, [r1, #0x1c4]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021ff548
    mov r3, #0x10
    str r3, [sp, #0x0]
    add r0, r4, #0x340
    mov r1, #0x2
    mov r2, #0xa8
    bl func_02091bac
    ldr r0, [r4, #0x2c4]
    bl func_ov030_021fd434
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff548
L_021ff4d0:
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220b9b8
    add r0, r4, #0x340
    mov r1, #0x1
    bl func_02091c7c
    str r0, [r4, #0x33c]
    str r0, [r4, #0x338]
    mov r2, r0
    ldr r1, [r4, #0x2c4]
    add r0, r4, #0x340
    str r2, [r1, #0x1c4]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021ff548
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff548
L_021ff520:
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_021ff548
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x4]
    streq r0, [r4, #0x8]
L_021ff548:
    mov r0, r4
    bl func_ov030_021fe768
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff558: .word 0x1388
L_021ff55c: .word 0x2710
L_021ff560: .word 0x31a
L_021ff564: .word 0x1f5
L_021ff568: .word gLupyContext
L_021ff56c: .word 0x1fa
L_021ff570: .word data_ov030_021ff778
.size func_ov030_021ff038, .-func_ov030_021ff038
