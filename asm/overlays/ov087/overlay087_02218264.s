.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern data_021052fc
.extern ActorMotionAreaFollower_GetPosition
.extern Sound_PlayEffectWithParameters
.extern gSoundContext

.global func_ov087_02218264
func_ov087_02218264:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    add r0, r6, #0x200
    ldrh r3, [r0, #0x1a]
    mov r5, r1
    mov r4, r2
    tst r3, #0x1
    beq .L_022182a0
    mov r1, #0x5
    mov r0, #0x0
    strh r1, [r6, #0xd6]
    str r0, [r6, #0x40]
    str r0, [r6, #0x3c]
    b .L_022183ec
.L_022182a0:
    ldrsh r0, [r0, #0x24]
    cmp r0, #0x0
    moveq r0, #0x1
    streqh r0, [r6, #0xd6]
    beq .L_022183ec
    ldrsh r0, [r6, #0xd6]
    cmp r0, #0x2
    bne .L_0221833c
    ldr r0, [r6, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_022183ec
    ldr r0, .L_022183f4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r1, [r0, #0x4]
    ldr r2, [r6, #0x1c]
    mvn r0, #0x7f
    sub r1, r2, r1
    add r1, r1, #0x80000
    cmp r0, r1, asr #0xc
    mov r1, r1, asr #0xc
    movgt r1, r0
    bgt .L_02218318
    cmp r1, #0x7f
    movgt r1, #0x7f
.L_02218318:
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x228]
    ldr r0, .L_022183f8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x67
    mov r2, #0x4
    mov r3, #0x50
    bl Sound_PlayEffectWithParameters
.L_0221833c:
    cmp r4, #0x0
    addlt r0, r6, #0x200
    mvnlt r1, #0x0
    strlth r1, [r0, #0x14]
    blt .L_02218368
    cmp r4, #0x0
    add r0, r6, #0x200
    movgt r1, #0x1
    strgth r1, [r0, #0x14]
    movle r1, #0x0
    strleh r1, [r0, #0x14]
.L_02218368:
    cmp r5, #0x0
    ldrgt r1, [r6, #0x20c]
    movgt r0, #0x4
    strgt r1, [r6, #0x208]
    strgth r0, [r6, #0xd6]
    bgt .L_022183b0
    movge r0, #0x0
    strge r0, [r6, #0x208]
    movge r0, #0x3
    strgeh r0, [r6, #0xd6]
    bge .L_022183b0
    ldr r0, [r6, #0x20c]
    mov r1, #0x4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x0
    str r0, [r6, #0x208]
    strh r1, [r6, #0xd6]
.L_022183b0:
    add r0, r6, #0x200
    ldrh r1, [r0, #0x1a]
    tst r1, #0x100
    beq .L_022183ec
    bic r1, r1, #0x100
    strh r1, [r0, #0x1a]
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, .L_022183f8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x67
    mov r2, #0x3
    mov r3, #0x40
    bl Sound_PlayEffectWithParameters
.L_022183ec:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_022183f4: .word data_021052fc
.L_022183f8: .word gSoundContext
.size func_ov087_02218264, . - func_ov087_02218264
