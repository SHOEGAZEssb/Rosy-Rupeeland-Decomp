.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_ov092_0221b250
.extern data_ov092_0221b270
.extern data_ov092_0221b290
.extern data_ov092_0221b2b8
.extern data_ov092_0221b2e0
.extern data_ov092_0221b308
.extern data_ov092_0221b30e
.extern data_ov092_0221b314
.extern data_ov092_0221b31a
.extern data_ov092_0221b320
.extern data_ov092_0221b326
.extern data_ov092_0221b32c
.extern data_ov092_0221b332
.extern data_ov092_0221b338
.extern data_ov092_0221b33e
.extern data_ov092_0221b344
.extern data_ov092_0221b34a
.extern data_ov092_0221b466
.extern data_ov092_0221b4f6
.extern data_ov092_0221b586
.extern data_ov092_0221b616
.extern data_ov092_0221b6a6
.extern data_ov092_0221b766
.extern data_ov092_0221b826
.extern data_ov092_0221b8e6
.extern data_ov092_0221b9a6
.extern data_ov092_0221ba66
.extern data_ov092_0221bb26
.extern data_ov092_0221bbe6
.extern data_ov092_0221bca6
.extern data_ov092_0221bd66
.extern data_ov092_0221be26
.extern data_ov092_0221bee6
.extern data_ov092_0221bfa6
.extern data_ov092_0221c066
.extern data_ov092_0221c126
.extern data_ov092_0221c1e6
.extern data_ov092_0221c406
.extern func_ov092_0221a0a0

.global func_ov092_0221a118
func_ov092_0221a118:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r5, r0
    add r1, r5, #0x200
    ldrsh r1, [r1, #0x8a]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_0221a628
.L_0221a138:
    b .L_0221a158
    b .L_0221a218
    b .L_0221a278
    b .L_0221a338
    b .L_0221a3f4
    b .L_0221a4b4
    b .L_0221a574
    b .L_0221a574
.L_0221a158:
    ldr r4, .L_0221a630
    mov r1, #0x0
    ldr r2, .L_0221a634
    mov r3, #0x4
    stmia sp, {r1, r4}
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r4, .L_0221a638
    ldr r2, .L_0221a63c
    mov r0, r5
    mov r1, #0x1
    mov r3, #0x5
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r4, .L_0221a640
    ldr r2, .L_0221a644
    mov r0, r5
    mov r1, #0x2
    mov r3, #0x5
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, .L_0221a648
    ldr r2, .L_0221a64c
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x3
    mov r3, #0x4
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, .L_0221a650
    ldr r2, .L_0221a654
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x4
    mov r3, #0x5
    bl func_ov092_0221a0a0
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x9a]
    ldr r1, .L_0221a658
    strh r1, [r0, #0x98]
    b .L_0221a628
.L_0221a218:
    ldr r9, .L_0221a65c
    ldr r8, .L_0221a660
    mov r4, #0x0
    mov r7, #0x12
    mov r6, #0x6
.L_0221a22c:
    add r0, r4, #0x7
    mla ip, r0, r6, r9
    mov r0, r4, lsl #0x1
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, r4
    mov r2, r8
    mov r3, r7
    str ip, [sp, #0x4]
    bl func_ov092_0221a0a0
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_0221a22c
    ldr r1, .L_0221a664
    add r0, r5, #0x200
    strh r1, [r0, #0x9a]
    sub r1, r1, #0xb
    strh r1, [r0, #0x98]
    b .L_0221a628
.L_0221a278:
    ldr r4, .L_0221a65c
    mov r1, #0x0
    ldr r2, .L_0221a668
    mov r3, #0x18
    stmia sp, {r1, r4}
    bl func_ov092_0221a0a0
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r4, .L_0221a66c
    ldr r2, .L_0221a670
    mov r0, r5
    mov r1, #0x1
    mov r3, #0x18
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r4, .L_0221a65c
    ldr r2, .L_0221a674
    mov r0, r5
    mov r1, #0x2
    mov r3, #0x18
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x6
    str r0, [sp, #0x0]
    ldr r1, .L_0221a66c
    ldr r2, .L_0221a678
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x3
    mov r3, #0x18
    bl func_ov092_0221a0a0
    mov r0, #0x8
    str r0, [sp, #0x0]
    mov r1, r4
    str r1, [sp, #0x4]
    ldr r2, .L_0221a67c
    mov r0, r5
    mov r1, #0x4
    mov r3, #0x18
    bl func_ov092_0221a0a0
    ldr r1, .L_0221a680
    add r0, r5, #0x200
    strh r1, [r0, #0x9a]
    sub r1, r1, #0xa
    strh r1, [r0, #0x98]
    b .L_0221a628
.L_0221a338:
    ldr r4, .L_0221a65c
    mov r1, #0x0
    ldr r2, .L_0221a684
    mov r3, #0x18
    stmia sp, {r1, r4}
    bl func_ov092_0221a0a0
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r4, .L_0221a66c
    ldr r2, .L_0221a688
    mov r0, r5
    mov r1, #0x1
    mov r3, #0x18
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r4, .L_0221a65c
    ldr r2, .L_0221a68c
    mov r0, r5
    mov r1, #0x2
    mov r3, #0x18
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r1, .L_0221a66c
    ldr r2, .L_0221a690
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x3
    mov r3, #0x18
    bl func_ov092_0221a0a0
    mov r1, #0x4
    str r1, [sp, #0x0]
    mov r2, r4
    str r2, [sp, #0x4]
    ldr r2, .L_0221a694
    mov r0, r5
    mov r3, #0x18
    bl func_ov092_0221a0a0
    ldr r1, .L_0221a680
    add r0, r5, #0x200
    strh r1, [r0, #0x9a]
    sub r1, r1, #0xa
    strh r1, [r0, #0x98]
    b .L_0221a628
.L_0221a3f4:
    ldr r4, .L_0221a630
    mov r1, #0x0
    ldr r2, .L_0221a698
    mov r3, #0x18
    stmia sp, {r1, r4}
    bl func_ov092_0221a0a0
    mov r0, #0xa
    str r0, [sp, #0x0]
    ldr r4, .L_0221a638
    ldr r2, .L_0221a69c
    mov r0, r5
    mov r1, #0x1
    mov r3, #0x18
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r4, .L_0221a640
    ldr r2, .L_0221a6a0
    mov r0, r5
    mov r1, #0x2
    mov r3, #0x18
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x9
    str r0, [sp, #0x0]
    ldr r1, .L_0221a648
    ldr r2, .L_0221a6a4
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x3
    mov r3, #0x18
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, .L_0221a650
    ldr r2, .L_0221a6a8
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x4
    mov r3, #0x18
    bl func_ov092_0221a0a0
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x9a]
    ldr r1, .L_0221a658
    strh r1, [r0, #0x98]
    b .L_0221a628
.L_0221a4b4:
    ldr r4, .L_0221a6ac
    mov r1, #0x0
    ldr r2, .L_0221a6b0
    mov r3, #0x5a
    stmia sp, {r1, r4}
    bl func_ov092_0221a0a0
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r4, .L_0221a6b4
    ldr r2, .L_0221a6b0
    mov r0, r5
    mov r1, #0x1
    mov r3, #0x5a
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r4, .L_0221a6b8
    ldr r2, .L_0221a6b0
    mov r0, r5
    mov r1, #0x2
    mov r3, #0x5a
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x6
    str r0, [sp, #0x0]
    ldr r1, .L_0221a6bc
    ldr r2, .L_0221a6b0
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x3
    mov r3, #0x5a
    bl func_ov092_0221a0a0
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r1, .L_0221a6c0
    ldr r2, .L_0221a6b0
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x4
    mov r3, #0x5a
    bl func_ov092_0221a0a0
    ldr r1, .L_0221a664
    add r0, r5, #0x200
    strh r1, [r0, #0x9a]
    sub r1, r1, #0xb
    strh r1, [r0, #0x98]
    b .L_0221a628
.L_0221a574:
    ldr r4, .L_0221a65c
    mov r1, #0x0
    ldr r2, .L_0221a6c4
    mov r3, #0x12
    stmia sp, {r1, r4}
    bl func_ov092_0221a0a0
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r2, .L_0221a6c8
    mov r0, r5
    mov r1, #0x1
    mov r3, #0x12
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_0221a6cc
    mov r0, r5
    mov r1, #0x2
    mov r3, #0x12
    str r4, [sp, #0x4]
    bl func_ov092_0221a0a0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, .L_0221a66c
    ldr r2, .L_0221a6d0
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x3
    mov r3, #0x1e
    bl func_ov092_0221a0a0
    mov r0, #0x9
    str r0, [sp, #0x0]
    ldr r1, .L_0221a66c
    ldr r2, .L_0221a6d0
    str r1, [sp, #0x4]
    mov r0, r5
    mov r1, #0x4
    mov r3, #0x1e
    bl func_ov092_0221a0a0
    ldr r1, .L_0221a664
    add r0, r5, #0x200
    strh r1, [r0, #0x9a]
    sub r1, r1, #0xb
    strh r1, [r0, #0x98]
.L_0221a628:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0221a630: .word data_ov092_0221b314
.L_0221a634: .word data_ov092_0221b250
.L_0221a638: .word data_ov092_0221b31a
.L_0221a63c: .word data_ov092_0221b2e0
.L_0221a640: .word data_ov092_0221b320
.L_0221a644: .word data_ov092_0221b290
.L_0221a648: .word data_ov092_0221b326
.L_0221a64c: .word data_ov092_0221b270
.L_0221a650: .word data_ov092_0221b32c
.L_0221a654: .word data_ov092_0221b2b8
.L_0221a658: .word 0xb981
.L_0221a65c: .word data_ov092_0221b308
.L_0221a660: .word data_ov092_0221b466
.L_0221a664: .word 0xb98d
.L_0221a668: .word data_ov092_0221ba66
.L_0221a66c: .word data_ov092_0221b30e
.L_0221a670: .word data_ov092_0221bb26
.L_0221a674: .word data_ov092_0221bbe6
.L_0221a678: .word data_ov092_0221bca6
.L_0221a67c: .word data_ov092_0221bd66
.L_0221a680: .word 0xb98b
.L_0221a684: .word data_ov092_0221be26
.L_0221a688: .word data_ov092_0221bee6
.L_0221a68c: .word data_ov092_0221bfa6
.L_0221a690: .word data_ov092_0221c066
.L_0221a694: .word data_ov092_0221c126
.L_0221a698: .word data_ov092_0221b6a6
.L_0221a69c: .word data_ov092_0221b766
.L_0221a6a0: .word data_ov092_0221b826
.L_0221a6a4: .word data_ov092_0221b8e6
.L_0221a6a8: .word data_ov092_0221b9a6
.L_0221a6ac: .word data_ov092_0221b332
.L_0221a6b0: .word data_ov092_0221c406
.L_0221a6b4: .word data_ov092_0221b338
.L_0221a6b8: .word data_ov092_0221b33e
.L_0221a6bc: .word data_ov092_0221b344
.L_0221a6c0: .word data_ov092_0221b34a
.L_0221a6c4: .word data_ov092_0221b616
.L_0221a6c8: .word data_ov092_0221b4f6
.L_0221a6cc: .word data_ov092_0221b586
.L_0221a6d0: .word data_ov092_0221c1e6
.size func_ov092_0221a118, . - func_ov092_0221a118
