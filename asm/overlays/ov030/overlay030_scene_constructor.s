.text

/* Exact fallback; see src/overlays/ov030/overlay030_scene_constructor.c. */
.extern data_020f4e18
.extern data_ov030_021ff708
.extern func_02062918
.extern func_02063064
.extern func_02063074
.extern func_02063084
.extern func_02063190
.extern func_020708c4
.extern func_02071ea4
.extern func_02071ee0
.extern func_02073e48
.extern func_02073ffc
.extern func_020742cc
.extern func_02091e0c
.extern func_020957bc
.extern func_020957f0
.extern func_02095820
.extern func_02095940
.extern func_ov030_021fd260
.extern func_ov030_021fd434


    .global func_ov030_021fcf20
func_ov030_021fcf20:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r10, r0
    add r0, r10, #0x4
    mov r6, r1
    mov r4, r2
    mov r5, r3
    bl func_02071ea4
    add r0, r10, #0x10
    bl func_02071ea4
    add r0, r10, #0x1c
    bl func_02071ea4
    add r0, r10, #0x58
    bl func_020957bc
    add r0, r10, #0x104
    bl func_020957bc
    add r0, r10, #0x1b8
    bl func_ov030_021fd260
    add r0, r10, #0x1d0
    mov r1, #0x8
    bl func_02091e0c
    add r0, r10, #0x1d8
    mov r1, #0x8
    bl func_02091e0c
    add r0, r10, #0x1e0
    mov r1, #0x8
    bl func_02091e0c
    add r0, r10, #0x1e8
    mov r1, #0x8
    bl func_02091e0c
    str r6, [r10, #0x0]
    cmp r5, #0x1
    ldrh r1, [r4, #0x4]
    mov r0, #0x0
    str r1, [r10, #0x1b4]
    str r0, [r10, #0x1c4]
    str r0, [r10, #0x1b0]
    ldr r0, [r10, #0x0]
    ldr r0, [r0, #0x0]
    str r0, [r10, #0x1cc]
    bne L_021fcfe8
    ldr r3, L_021fd250
    ldr r0, L_021fd254
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x4
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_02071ee0
    b L_021fd008
L_021fcfe8:
    ldr r3, L_021fd258
    ldr r0, L_021fd254
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r10, #0x4
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_02071ee0
L_021fd008:
    mov r0, r4
    mov r1, #0x0
    bl func_02062918
    bl func_02063064
    mov r6, r0
    mov r0, r4
    mov r1, #0x0
    bl func_02062918
    bl func_02063074
    mov r5, r0
    mov r0, r4
    mov r1, #0x0
    bl func_02062918
    bl func_02063084
    str r0, [sp, #0x0]
    ldr r1, L_021fd254
    mov r2, r6
    ldr r1, [r1, #0x0]
    mov r3, r5
    add r0, r10, #0x1c
    bl func_02071ee0
    ldr r0, [r10, #0x8]
    bl func_020708c4
    mov r0, #0x43
    str r0, [sp, #0x0]
    ldr r1, L_021fd254
    add r0, r10, #0x10
    ldr r1, [r1, #0x0]
    mov r2, #0x42
    mov r3, #0x1
    bl func_02071ee0
    ldr r0, [r10, #0x0]
    bl func_020742cc
    str r0, [r10, #0x28]
    ldr r0, [r10, #0x0]
    bl func_020742cc
    str r0, [r10, #0x2c]
    add r1, r10, #0x1c
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r10, #0x30]
    mov r0, r4
    mov r1, #0x0
    bl func_02062918
    bl func_02063190
    mov r2, #0x0
    mov r1, r0
    str r2, [sp, #0x0]
    mov r0, #0x100
    stmib sp, {r0, r2}
    ldr r0, [r10, #0x30]
    mov r2, #0x20
    mov r3, #0xb0
    bl func_02073e48
    mov r9, #0x0
    mov r8, #0x1
    ldr r4, L_021fd25c
    mov r7, r8
    mov r6, r9
    mov r5, #0x4
L_021fd0f8:
    ldr r0, [r10, #0x28]
    mov r2, r8
    add r1, r10, #0x4
    bl func_02073ffc
    add r2, r10, r9, lsl #0x2
    str r0, [r2, #0x34]
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    add r3, r4, r9, lsl #0x3
    mov r1, r9, lsl #0x3
    ldr r0, [r2, #0x34]
    ldrsh r2, [r4, r1]
    mov r1, r6
    ldrsh lr, [r3, #0x4]
    ldrsh ip, [r3, #0x2]
    ldrsh r3, [r3, #0x6]
    add r2, r2, lr
    add r2, r2, r2, lsr #0x1f
    add r3, ip, r3
    add r3, r3, r3, lsr #0x1f
    mov r2, r2, asr #0x1
    mov r3, r3, asr #0x1
    add r3, r3, #0x7
    bl func_02073e48
    add r9, r9, #0x1
    cmp r9, #0x7
    blt L_021fd0f8
    mov r7, #0x0
    mov r6, #0x1
    mov r5, r7
    mov r4, #0xb0
L_021fd178:
    ldr r0, [r10, #0x2c]
    mov r2, r6
    add r1, r10, #0x10
    bl func_02073ffc
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x50]
    stmia sp, {r5, r7}
    str r5, [sp, #0x8]
    mov r2, r7, lsl #0x3
    ldr r0, [r1, #0x50]
    mov r1, r5
    mov r3, r4
    add r2, r2, #0x32
    bl func_02073e48
    add r7, r7, #0x1
    cmp r7, #0x2
    blt L_021fd178
    ldr r0, [r10, #0x2c]
    add r1, r10, #0x10
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r3, #0x0
    add r0, r10, #0x58
    mov r2, #0x4
    str r3, [sp, #0x0]
    bl func_020957f0
    add r0, r10, #0x58
    mov r1, #0x80
    mov r2, #0xb0
    bl func_02095820
    add r0, r10, #0x58
    bl func_02095940
    ldr r0, [r10, #0x2c]
    add r1, r10, #0x10
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r3, #0x0
    str r3, [sp, #0x0]
    add r0, r10, #0x104
    mov r2, #0x6
    bl func_020957f0
    add r0, r10, #0x104
    mov r1, #0xe4
    mov r2, #0xb0
    bl func_02095820
    add r0, r10, #0x104
    bl func_02095940
    mov r0, r10
    bl func_ov030_021fd434
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd250: .word 0x32a3
L_021fd254: .word data_020f4e18
L_021fd258: .word 0x32a6
L_021fd25c: .word data_ov030_021ff708
.size func_ov030_021fcf20, .-func_ov030_021fcf20
