.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern GameWork_TestFlag
.extern data_021052fc
.extern data_ov072_02210a30
.extern gGameWork

.global func_ov072_022108e8
func_ov072_022108e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, .L_0221099c
    mov r9, #0x0
    ldr r1, [r0, #0x0]
    ldr r5, .L_022109a0
    add r0, r1, #0x3000
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r0, [r0, #0xbc]
    ldr r7, [r1, #0x1c]
    ldr r8, [r0, #0x0]
    ldr r6, [r1, #0x20]
    mvn r4, #0x0
    ldr r11, .L_022109a4
    b .L_0221098c
.L_02210934:
    ldr r0, [r5, r9, lsl #0x4]
    add r10, r5, r9, lsl #0x4
    cmp r0, r8
    bne .L_02210988
    ldr r1, [r10, #0xc]
    cmp r1, r4
    beq .L_02210960
    ldr r0, [r11, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02210988
.L_02210960:
    ldr r0, [r10, #0x8]
    ldr r2, [r10, #0x4]
    sub r1, r0, r6, asr #0xc
    mul r0, r1, r1
    sub r1, r2, r7, asr #0xc
    mla r0, r1, r1, r0
    cmp r0, #0x2400
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210988:
    add r9, r9, #0x1
.L_0221098c:
    cmp r9, #0xc
    blt .L_02210934
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221099c: .word data_021052fc
.L_022109a0: .word data_ov072_02210a30
.L_022109a4: .word gGameWork
.size func_ov072_022108e8, . - func_ov072_022108e8
