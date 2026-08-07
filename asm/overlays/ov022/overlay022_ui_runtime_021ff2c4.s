.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern data_021f3ecc
.extern data_021f5ed0
.extern func_02075598
.extern func_020791e0
.extern func_02092e9c
.extern func_02093360
.extern func_ov022_021fd2f4
.extern func_ov022_021fd4d4
.extern func_ov022_021fd5d4
.extern gDebugFont


    .global func_ov022_021ff2c4
func_ov022_021ff2c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x2cc]
    mov r0, #0xd
    mov r1, r1, lsl #0x10
    str r0, [r3, #0xd0]
    mov r2, #0x0
    ldr r0, L_021ff35c
    str r2, [r3, #0xd4]
    mov r1, r1, lsr #0x10
    bl func_020791e0
    mov r1, r0
    ldr r0, [r4, #0x2cc]
    mov r2, #0x4
    bl func_02092e9c
    ldr r0, [r4, #0x2cc]
    ldr r1, L_021ff360
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq L_021ff338
    ldr r1, [r4, #0x2cc]
    ldr r0, [r4, #0x350]
    ldr r1, [r1, #0xe8]
    bl func_ov022_021fd5d4
    b L_021ff340
L_021ff338:
    ldr r0, [r4, #0x350]
    bl func_ov022_021fd4d4
L_021ff340:
    ldr r0, L_021ff364
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    bl func_02075598
    bl func_ov022_021fd2f4
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ff35c: .word data_021f3ecc
L_021ff360: .word data_021f5ed0
L_021ff364: .word gDebugFont
.size func_ov022_021ff2c4, .-func_ov022_021ff2c4

