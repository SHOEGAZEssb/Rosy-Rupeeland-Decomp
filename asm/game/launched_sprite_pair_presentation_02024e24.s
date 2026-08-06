; Matching retail form; see src/game/launched_sprite_pair_presentation.c.
.text
.extern GameWork_TestFlag
.extern data_020c9670
.extern data_020f4e18
.extern func_02002e38
.extern func_02071ee0
.extern func_02071f38
.extern func_02072b68
.extern func_02073ffc
.extern func_02074038
.extern func_02091a70
.extern gGameWork
.extern genrand_int32

    .global func_02024e24
    .type func_02024e24, @function
func_02024e24: ; 0x02024e24
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0202500c
.L_02024e40: ; jump table
    b .L_02024e50 ; case 0
    b .L_02024e70 ; case 1
    b .L_02024f30 ; case 2
    b .L_02024fa4 ; case 3
.L_02024e50:
    ldr r0, [r4, #0x30]
    add r0, r0, #0x1
    str r0, [r4, #0x30]
    cmp r0, #0x1e
    ldrgt r0, [r4, #0x38]
    addgt r0, r0, #0x1
    strgt r0, [r4, #0x38]
    b .L_0202500c
.L_02024e70:
    ldr r0, .L_0202510c
    ldr r1, .L_02025110
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_0202500c
    ldr r0, [r4, #0x18]
    sub r0, r0, #0x8000
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x50]
    bl func_02074038
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_02024eb4
    ldr r1, [r4, #0x54]
    bl func_02074038
.L_02024eb4:
    add r0, r4, #0x3c
    bl func_02071f38
    ldr r3, .L_02025114
    ldr r0, .L_02025118
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r4, #0x3c
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r4, #0x48]
    add r1, r4, #0x3c
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r4, #0x50]
    mov r1, #0x1
    bl func_02072b68
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_02024f20
    ldr r0, [r4, #0x4c]
    add r1, r4, #0x3c
    mov r2, #0x2
    bl func_02073ffc
    mov r1, #0x1
    str r0, [r4, #0x54]
    bl func_02072b68
.L_02024f20:
    ldr r0, [r4, #0x38]
    add r0, r0, #0x1
    str r0, [r4, #0x38]
    b .L_0202500c
.L_02024f30:
    ldr r0, [r4, #0x50]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0202500c
    mov r1, #0x0
    bl func_02072b68
    ldr r1, [r4, #0x50]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_02024f8c
    mov r1, #0x0
    bl func_02072b68
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02024f8c:
    bl genrand_int32
    str r0, [r4, #0x30]
    ldr r0, [r4, #0x38]
    add r0, r0, #0x1
    str r0, [r4, #0x38]
    b .L_0202500c
.L_02024fa4:
    ldr r0, [r4, #0x2c]
    ldr r1, .L_0202511c
    add r2, r0, #0x52
    str r2, [r4, #0x2c]
    ldr r0, [r4, #0x28]
    add r0, r0, r2
    str r0, [r4, #0x28]
    ldr r0, [r4, #0x30]
    ldr r3, [r4, #0x34]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r5, [r1, r0]
    mov r0, #0x0
    mov r1, #0x10
    mov r2, #0x78
    bl func_02091a70
    mul r0, r5, r0
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x30]
    add r0, r0, #0x400
    str r0, [r4, #0x30]
    ldr r0, [r4, #0x34]
    add r0, r0, #0x1
    str r0, [r4, #0x34]
.L_0202500c:
    ldr r0, [r4, #0x8]
    ldr r6, [r4, #0x10]
    ldr ip, [r4, #0x20]
    ldr r5, [r4, #0x14]
    ldr lr, [r4, #0x24]
    ldr r3, [r4, #0x18]
    ldr r2, [r4, #0x28]
    ldr r1, [r0, #0x4]
    add r6, r6, ip
    sub r6, r6, r1
    mov r1, r6, asr #0xb
    add r1, r6, r1, lsr #0x14
    mov r1, r1, lsl #0x4
    ldr ip, [r0, #0x8]
    add r5, r5, lr
    ldr r0, [r0, #0xc]
    add r2, r3, r2
    sub r3, r5, ip
    sub r0, r2, r0
    sub r2, r3, r0
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, lsl #0x4
    ldr r2, [r4, #0x50]
    mov r5, r1, asr #0x10
    strh r5, [r2, #0x2c]
    mov r6, r0, asr #0x10
    strh r6, [r2, #0x2e]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_020250a0
    bl func_02002e38
    ldr r1, [r4, #0x54]
    add r2, r6, #0xc0
    strh r5, [r1, #0x2c]
    add r0, r2, r0
    strh r0, [r1, #0x2e]
.L_020250a0:
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    ldr r0, [r4, #0x34]
    beq .L_020250dc
    cmp r0, #0xf0
    bge .L_020250d4
    ldr r0, [r4, #0x50]
    ldrsh r4, [r0, #0x2e]
    bl func_02002e38
    mvn r1, #0xdf
    sub r0, r1, r0
    cmp r4, r0
    bge .L_02025100
.L_020250d4:
    mov r0, #0x1
    b .L_02025104
.L_020250dc:
    cmp r0, #0x78
    bge .L_020250f8
    ldr r1, [r4, #0x50]
    mvn r0, #0x1f
    ldrsh r1, [r1, #0x2e]
    cmp r1, r0
    bge .L_02025100
.L_020250f8:
    mov r0, #0x1
    b .L_02025104
.L_02025100:
    mov r0, #0x0
.L_02025104:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0202510c: .word gGameWork
.L_02025110: .word 0x385
.L_02025114: .word 0x115c
.L_02025118: .word data_020f4e18
.L_0202511c: .word data_020c9670
    .size func_02024e24, . - func_02024e24
