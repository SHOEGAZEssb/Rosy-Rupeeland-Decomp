.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_020befec

.global func_ov092_02217834
func_ov092_02217834:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrsh r3, [r7, #0x0]
    ldr r0, [r7, #0x4]
    ldrsh r2, [r7, #0x2]
    add r0, r0, r3, lsl #0x3
    ldrsh r0, [r0, #0x4]
    mov r6, r1
    cmp r2, r0
    blt .L_022178a0
    ldrb r1, [r7, #0xa]
    cmp r1, #0x0
    bne .L_02217878
    ldrsh r0, [r7, #0x8]
    sub r0, r0, #0x1
    cmp r3, r0
    bge .L_02217894
.L_02217878:
    ldrsh r1, [r7, #0x8]
    add r0, r3, #0x1
    bl func_020befec
    strh r1, [r7, #0x0]
    mov r0, #0x0
    strh r0, [r7, #0x2]
    b .L_022178a0
.L_02217894:
    cmp r1, #0x0
    moveq r0, #0x1
    streqb r0, [r7, #0xb]
.L_022178a0:
    ldrsh r0, [r7, #0x0]
    ldr r3, [r7, #0x4]
    ldrsh r2, [r7, #0x2]
    add r4, r3, r0, lsl #0x3
    cmp r0, #0x0
    ldrlesh r0, [r7, #0x8]
    ldrsh r1, [r4, #0x4]
    sub r8, r0, #0x1
    mov r0, r8, lsl #0x3
    ldrsh r5, [r3, r0]
    ldrsh r0, [r4, #0x0]
    add r8, r3, r8, lsl #0x3
    sub r0, r0, r5
    mul r0, r2, r0
    bl func_020befec
    add r0, r5, r0
    mov r0, r0, lsl #0xc
    str r0, [r6, #0x4]
    ldrsh r5, [r8, #0x2]
    ldrsh r0, [r4, #0x2]
    ldrsh r2, [r7, #0x2]
    ldrsh r1, [r4, #0x4]
    sub r0, r0, r5
    mul r0, r2, r0
    bl func_020befec
    add r0, r5, r0
    mov r0, r0, lsl #0xc
    str r0, [r6, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov092_02217834, . - func_ov092_02217834
