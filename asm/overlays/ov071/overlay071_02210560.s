.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern data_020c9670
.extern func_020050a4
.extern func_02072b68
.extern func_020a1794
.extern func_020befec
.extern func_ov071_022102ac

.global func_ov071_02210560
func_ov071_02210560:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0xf8]
    cmp r1, #0x2
    bne .L_022105b0
    ldr ip, [r4, #0xec]
    mov r2, #0x0
    ldrh r3, [ip, #0x42]
    mov r1, #0x118000
    mov r0, #0x3
    bic r3, r3, #0x4
    strh r3, [ip, #0x42]
    str r2, [r4, #0x98]
    str r1, [r4, #0x9c]
    strh r0, [r4, #0xf8]
    ldr r0, [r4, #0x90]
    mov r1, #0xb
    ldr r0, [r0, #0xc]
    bl func_02072b68
    b .L_022107d4
.L_022105b0:
    cmp r1, #0x3
    bne .L_022105e0
    mov r1, #0x1000
    rsb r1, r1, #0x0
    str r1, [r4, #0xa8]
    ldr r0, [r4, #0x9c]
    add r0, r0, r1
    str r0, [r4, #0x9c]
    cmp r0, #0xf2000
    movlt r0, #0x0
    strlth r0, [r4, #0xf8]
    b .L_022107d4
.L_022105e0:
    cmp r1, #0x4
    bne .L_02210668
    ldr r0, [r4, #0x9c]
    cmp r0, #0x14000
    ble .L_02210614
    ldr r1, [r4, #0xa8]
    mov r0, #0x4000
    sub r1, r1, #0x7b
    rsb r0, r0, #0x0
    str r1, [r4, #0xa8]
    cmp r1, r0
    strlt r0, [r4, #0xa8]
    b .L_02210638
.L_02210614:
    ldr r0, [r4, #0xfc]
    mov r1, #0xc
    add r0, r0, #0x1
    str r0, [r4, #0xfc]
    ldr r0, [r4, #0xa8]
    bl func_020befec
    ldr r1, [r4, #0xa8]
    sub r0, r1, r0
    str r0, [r4, #0xa8]
.L_02210638:
    ldr r0, [r4, #0xfc]
    cmp r0, #0x50
    moveq r0, #0x0
    streq r0, [r4, #0xfc]
    ldreqh r0, [r4, #0xf8]
    addeq r0, r0, #0x1
    streqh r0, [r4, #0xf8]
    ldr r1, [r4, #0x9c]
    ldr r0, [r4, #0xa8]
    add r0, r1, r0
    str r0, [r4, #0x9c]
    b .L_022107d4
.L_02210668:
    cmp r1, #0x5
    bne .L_022106ec
    ldr r0, [r4, #0x9c]
    cmp r0, #0xd2000
    bge .L_02210698
    ldr r0, [r4, #0xa8]
    add r0, r0, #0x7b
    str r0, [r4, #0xa8]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0xa8]
    b .L_022106bc
.L_02210698:
    ldr r0, [r4, #0xfc]
    mov r1, #0xc
    add r0, r0, #0x1
    str r0, [r4, #0xfc]
    ldr r0, [r4, #0xa8]
    bl func_020befec
    ldr r1, [r4, #0xa8]
    sub r0, r1, r0
    str r0, [r4, #0xa8]
.L_022106bc:
    ldr r0, [r4, #0xfc]
    cmp r0, #0x1e
    moveq r0, #0x0
    streq r0, [r4, #0xfc]
    ldreqh r0, [r4, #0xf8]
    addeq r0, r0, #0x1
    streqh r0, [r4, #0xf8]
    ldr r1, [r4, #0x9c]
    ldr r0, [r4, #0xa8]
    add r0, r1, r0
    str r0, [r4, #0x9c]
    b .L_022107d4
.L_022106ec:
    cmp r1, #0x7
    bne .L_02210744
    ldr r1, [r4, #0xfc]
    add r1, r1, #0x1
    rsb r3, r1, #0x100
    str r1, [r4, #0xfc]
    mov r1, r3, lsl #0x10
    ldr r2, [r4, #0xec]
    mov r1, r1, asr #0x10
    strh r1, [r2, #0x3c]
    strh r1, [r2, #0x3e]
    cmp r3, #0x80
    bge .L_022107d4
    bl func_ov071_022102ac
    ldr r1, [r4, #0xec]
    mov r0, #0x100
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    mov r0, #0x0
    str r0, [r4, #0xfc]
    strh r0, [r4, #0xf8]
    b .L_022107d4
.L_02210744:
    cmp r1, #0x8
    bne .L_022107d4
    ldr r0, [r4, #0xfc]
    add r1, r0, #0x1
    str r1, [r4, #0xfc]
    cmp r1, #0x1
    bne .L_02210784
    ldr r0, [r4, #0xec]
    mov r1, #0x1a
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r1, [r4, #0xec]
    mov r0, #0x80
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    b .L_022107d4
.L_02210784:
    mov r0, #0x17c
    mul r0, r1, r0
    cmp r0, #0x4000
    movgt r0, #0x4000
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, .L_02210838
    mov r1, r1, lsl #0x1
    ldrsh r2, [r0, r1]
    mov r0, #0x180
    ldr r1, [r4, #0xec]
    rsb r2, r2, #0x1000
    mul r0, r2, r0
    mov r0, r0, asr #0xc
    add r0, r0, #0x80
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
.L_022107d4:
    ldr r2, [r4, #0xec]
    ldr r0, [r4, #0x48]
    add r1, r4, #0x94
    add r2, r2, #0x2c
    mov r3, #0x0
    bl func_020a1794
    ldr r0, [r4, #0xf0]
    ldr r1, [r4, #0xec]
    add r0, r0, #0x2c
    add r1, r1, #0x2c
    bl func_020050a4
    ldr r2, [r4, #0xf0]
    ldrh r1, [r2, #0x42]
    tst r1, #0x4
    ldmneia sp!, {r4, pc}
    ldr r0, [r2, #0xc]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    orrne r0, r1, #0x4
    strneh r0, [r2, #0x42]
    movne r0, #0x0
    strne r0, [r4, #0xcc]
    ldmia sp!, {r4, pc}
.L_02210838: .word data_020c9670
.size func_ov071_02210560, . - func_ov071_02210560
