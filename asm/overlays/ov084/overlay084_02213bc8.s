.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_020050a4
.extern func_0204cfa4
.extern func_020befec
.extern func_ov084_022131fc

.global func_ov084_02213bc8
func_ov084_02213bc8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r2, r4, #0x200
    mov r3, #0x3
    add r0, r4, #0xb0
    add r1, r4, #0x22c
    strh r3, [r2, #0xa8]
    bl func_020050a4
    add r0, r4, #0x298
    add r1, r4, #0x18
    bl func_020050a4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov084_022131fc
    mov r1, #0x0
    add r0, r4, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    ldr r1, [r4, #0x29c]
    ldr r0, [r4, #0xb4]
    ldr r2, [r4, #0x2a0]
    sub r0, r1, r0
    ldr r1, [r4, #0xb8]
    sub r1, r2, r1
    bl func_0204cfa4
    cmp r0, #0x30000
    movlt r0, #0x18
    strlth r0, [r4, #0xae]
    blt .L_02213c8c
    cmp r0, #0x100000
    movgt r0, #0x3c
    strgth r0, [r4, #0xae]
    bgt .L_02213c8c
    sub r0, r0, #0x30000
    mov r1, #0xd0
    bl func_020befec
    mov r1, #0x24
    mul r1, r0, r1
    mov r0, r1, asr #0xc
    add r0, r0, #0x18
    strh r0, [r4, #0xae]
.L_02213c8c:
    ldrsh r2, [r4, #0xae]
    add r0, r4, #0x200
    mov r1, #0x2
    strh r2, [r0, #0xaa]
    strh r1, [r4, #0xac]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    ldmia sp!, {r4, pc}
.size func_ov084_02213bc8, . - func_ov084_02213bc8
