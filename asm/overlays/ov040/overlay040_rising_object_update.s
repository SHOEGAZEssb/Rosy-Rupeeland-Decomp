    .text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern data_021f5ebc
    .extern func_02072b68
    .extern func_020828a0
    .extern func_020a2614
    .extern func_020a27a0
    .extern func_ov040_021fcea0
    .extern func_ov040_021fceb0
    .extern func_ov040_021ff42c
    .extern func_ov040_021ff514
    .global func_ov040_02200bf4
func_ov040_02200bf4: ; 0x02200bf4
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r3, [r4, #0xad4]
    cmp r3, #0x0
    ble .L_02200d90
    cmp r3, #0x1
    moveq r0, #0x2
    streq r0, [r4, #0xad4]
    beq .L_02200d78
    cmp r3, #0x2
    bne .L_02200c8c
    mov r0, #0x50
    str r0, [r4, #0xad4]
    ldr r0, [r4, #0x684]
    str r0, [r4, #0xacc]
    ldr r0, [r4, #0x688]
    add r0, r0, #0x30000
    str r0, [r4, #0xad0]
    ldr r1, [r4, #0xac0]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r1, [r4, #0xad4]
    ldr r0, [r4, #0xac0]
    mov r2, r1
    bl func_ov040_021fceb0
    mov r0, #0x6
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x48]
    ldr r2, [r4, #0xacc]
    ldr r1, [r4, #0xad0]
    ldr r0, [r0, #0x10]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x1
    bl func_020a2614
    b .L_02200d78
.L_02200c8c:
    ldr r1, [r4, #0x848]
    mov r0, #0x14
    mul r2, r1, r0
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    add r1, r3, r0, asr #0xc
    ldr r0, .L_02200eb0
    str r1, [r4, #0xad4]
    cmp r1, r0
    strgt r0, [r4, #0xad4]
    ldr r0, [r4, #0xad0]
    add r0, r0, #0x4000
    str r0, [r4, #0xad0]
    ldr r1, [r4, #0xad4]
    ldr r0, [r4, #0xac0]
    mov r2, r1
    bl func_ov040_021fceb0
    ldr r0, [r4, #0xad0]
    cmp r0, #0xb4000
    ble .L_02200d78
    ldr r1, [r4, #0x48]
    mov r0, #0xf
    str r0, [r1, #0x34]
    mov r0, #0x3
    str r0, [r1, #0x38]
    ldr r3, [r4, #0x48]
    ldr r0, [r4, #0xad0]
    ldr r2, [r4, #0xacc]
    mov r1, r0, asr #0xc
    ldr r0, [r3, #0x10]
    mov r2, r2, asr #0xc
    add r3, r1, #0xc
    mov r1, #0x2
    bl func_020a27a0
    ldr r1, [r4, #0xac0]
    mov r2, #0xb7000
    ldrh r0, [r1, #0x42]
    mov r3, #0x0
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r1, [r4, #0xac4]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0xac4]
    ldr r1, [r4, #0xacc]
    bl func_ov040_021fcea0
    ldr r0, [r4, #0xac4]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r1, [r4, #0xac4]
    mov r0, #0x100
    strh r0, [r1, #0x3c]
    mov r0, #0x180
    strh r0, [r1, #0x3e]
    mov r0, #0x0
    str r0, [r4, #0xad4]
    str r0, [r4, #0xad8]
.L_02200d78:
    ldr r1, [r4, #0xacc]
    ldr r0, [r4, #0xac0]
    str r1, [r0, #0x30]
    ldr r1, [r4, #0xad0]
    ldr r0, [r4, #0xac0]
    str r1, [r0, #0x34]
.L_02200d90:
    ldr r0, [r4, #0xac4]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    bne .L_02200ea8
    ldr r0, .L_02200eb4
    mov r1, #0x80
    bl func_020828a0
    cmp r0, #0x0
    ldreq r0, [r4, #0xb94]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0xad4]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0xb9c]
    cmpeq r0, #0x0
    bne .L_02200e28
    ldr r0, [r4, #0xb44]
    ldr r1, [r4, #0xacc]
    ldr r0, [r0, #0x30]
    sub r1, r1, r0
    cmp r1, #0x19000
    bge .L_02200e28
    mov r0, #0x1e000
    rsb r0, r0, #0x0
    cmp r1, r0
    ble .L_02200e28
    ldr r0, [r4, #0xb28]
    sub r0, r0, #0x1d
    str r0, [r4, #0xb28]
    cmp r0, #0x0
    mov r0, r4
    bgt .L_02200e14
    bl func_ov040_021ff514
    b .L_02200e18
.L_02200e14:
    bl func_ov040_021ff42c
.L_02200e18:
    mov r0, #0x0
    str r0, [r4, #0x6c]
    mov r0, #0xa
    str r0, [r4, #0x70]
.L_02200e28:
    ldr r0, [r4, #0xac4]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02200e60
    mov r1, #0x2
    bl func_02072b68
    ldr r0, [r4, #0xac4]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02200e60:
    ldr r1, [r4, #0xad8]
    mov r0, #0x14
    add r3, r1, #0x1
    sub r1, r3, #0x1e
    mul r0, r1, r0
    rsb r2, r0, #0x100
    str r3, [r4, #0xad8]
    cmp r2, #0xa
    ldrlt r1, [r4, #0xac4]
    ldrlth r0, [r1, #0x42]
    orrlt r0, r0, #0x4
    strlth r0, [r1, #0x42]
    blt .L_02200ea8
    cmp r3, #0x1e
    ldrgt r1, [r4, #0xac4]
    movgt r0, #0x180
    strgth r2, [r1, #0x3c]
    strgth r0, [r1, #0x3e]
.L_02200ea8:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02200eb0: .word 0x1ff
.L_02200eb4: .word data_021f5ebc
    .size func_ov040_02200bf4, . - func_ov040_02200bf4
