.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_secondary_object_update.c. */
.extern gFx32CosSinTable
.extern Sound_SetEffectParameters
.extern func_020adc90
.extern func_020befec
.extern gSoundContext
.extern genrand_int32

    .global func_ov041_02200a38
func_ov041_02200a38: ; 0x02200a38
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r2, [r5, #0x48]
    mov r0, #0x60
    ldr r1, [r2, #0x174]
    ldr r3, [r2, #0x8]
    sub r2, r1, #0x4
    mul r1, r2, r0
    ldr r0, [r3, #0xd8]
    bl func_020befec
    mov r1, #0x90
    mul r2, r0, r1
    mov r0, #0x14000
    ldr r1, [r5, #0x5c]
    sub r2, r2, #0xb2000
    str r2, [r1, #0x34]
    ldr r2, [r5, #0x5c]
    rsb r0, r0, #0x0
    ldr r1, [r2, #0x34]
    cmp r1, r0
    strgt r0, [r2, #0x34]
    ldr r1, [r5, #0x48]
    ldr r0, [r1, #0x1f4]
    cmp r0, #0x2
    beq .L_02200ccc
    ldr r0, [r1, #0x1cc]
    mov r4, #0x1
    cmp r0, #0x1
    cmpne r0, #0x2
    ldrne r0, [r5, #0x15c]
    movne r4, #0x0
    subne r0, r0, #0x800
    strne r0, [r5, #0x15c]
    ldr r0, [r5, #0x48]
    ldr r1, [r5, #0x15c]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xd8]
    sub r0, r1, r0
    cmp r0, #0x21c000
    bge .L_02200b2c
    cmp r4, #0x0
    bne .L_02200b2c
    mov r1, #0x21c000
    bl func_020adc90
    rsb r6, r0, #0x1000
    cmp r6, #0x1000
    ldr r0, .L_02200cd4
    movgt r6, #0x1000
    umull r3, r2, r6, r0
    mov r1, #0x0
    mla r2, r6, r1, r2
    mov r1, r6, asr #0x1f
    mla r2, r1, r0, r2
    adds r3, r3, #0x800
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    ldr r2, [r5, #0x15c]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r5, #0x15c]
.L_02200b2c:
    cmp r4, #0x0
    bne .L_02200bb8
    ldr r0, [r5, #0x48]
    ldr r1, [r5, #0x15c]
    ldr r0, [r0, #0x8]
    mov r2, #0x8
    ldr r0, [r0, #0xd8]
    sub r0, r1, r0
    mov r1, r0, asr #0xc
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    rsbs r4, r0, #0x99
    mov r1, #0x0
    str r1, [sp, #0x0]
    movmi r4, #0x0
    str r1, [sp, #0x4]
    ldr r0, .L_02200cd8
    cmp r4, #0x64
    movgt r4, #0x64
    ldr r0, [r0, #0x0]
    ldr r1, .L_02200cdc
    mov r3, r4
    bl Sound_SetEffectParameters
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_02200cd8
    cmp r4, #0xa
    movlt r4, #0xa
    ldr r0, [r0, #0x0]
    ldr r1, .L_02200cdc
    mov r3, r4
    mov r2, #0xc
    bl Sound_SetEffectParameters
.L_02200bb8:
    mov r0, #0x4
    mov r7, #0x1000
    ldr r11, .L_02200ce0
    ldr r8, .L_02200ce4
    sub r4, r0, #0x1
    rsb r7, r7, #0x0
    mov r6, #0x5000
.L_02200bd4:
    mov r0, #0xc
    mla r3, r4, r0, r5
    ldr r0, [r5, #0x15c]
    add r1, r5, r4, lsl #0x2
    str r0, [r3, #0x6c]
    ldr r2, [r3, #0x68]
    ldr r0, [r1, #0x4c]
    add ip, r5, r4, lsl #0x1
    str r2, [r0, #0x30]
    ldr r0, [r3, #0x6c]
    ldr r1, [r1, #0x4c]
    sub r10, r0, #0x7000
    ldrh r0, [ip, #0x94]
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r3, [r11, r0]
    mov r0, #0x0
    umull r9, lr, r3, r6
    mla lr, r3, r0, lr
    mov r2, r3, asr #0x1f
    mla lr, r2, r6, lr
    mov r0, #0x800
    adds r2, r9, r0
    mov r0, #0x0
    adc r0, lr, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, r10, r2
    and r0, r0, r7
    str r0, [r1, #0x34]
    ldrh r1, [ip, #0x94]
    ldrh r0, [ip, #0x9c]
    add r9, r1, r0
    cmp r9, r8
    blt .L_02200c80
    sub r9, r9, r8
    bl genrand_int32
    and r1, r0, #0xf
    mov r0, #0x50
    smulbb r0, r1, r0
    add r1, r0, #0x2bc
    add r0, r5, r4, lsl #0x1
    strh r1, [r0, #0x9c]
.L_02200c80:
    add r0, r5, r4, lsl #0x1
    strh r9, [r0, #0x94]
    subs r4, r4, #0x1
    bpl .L_02200bd4
    mov r4, #0x0
    mov r3, r4
    mov r0, #0x12
.L_02200c9c:
    mla r7, r4, r0, r5
    mov r6, r3
.L_02200ca4:
    add r2, r7, r6, lsl #0x1
    ldrh r1, [r2, #0xa4]
    add r6, r6, #0x1
    cmp r6, #0x9
    add r1, r1, #0x1
    strh r1, [r2, #0xa4]
    blt .L_02200ca4
    add r4, r4, #0x1
    cmp r4, #0xa
    blt .L_02200c9c
.L_02200ccc:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02200cd4: .word 0x733
.L_02200cd8: .word gSoundContext
.L_02200cdc: .word 0x12d
.L_02200ce0: .word gFx32CosSinTable
.L_02200ce4: .word 0xffff
    .size func_ov041_02200a38, . - func_ov041_02200a38

