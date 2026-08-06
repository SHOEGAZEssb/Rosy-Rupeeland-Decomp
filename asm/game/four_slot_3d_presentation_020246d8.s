; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern GameWork_TestFlag
.extern data_020d6780
.extern data_020d67dc
.extern data_020d67fc
.extern data_021052fc
.extern func_02009d78
.extern func_0202497c
.extern func_02091bac
.extern func_02091c7c
.extern func_020b0a54
.extern gGameWork

    .global func_020246d8
    .type func_020246d8, @function
func_020246d8: ; 0x020246d8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    ldr r1, .L_02024950
    mov r9, r0
    ldr r1, [r1, #0x0]
    add r0, r1, #0x3000
    ldrb r0, [r0, #0xcc]
    tst r0, #0x4
    movne r0, #0x0
    bne .L_02024948
    add r0, r1, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov r8, #0x0
    ldr r6, .L_02024954
    mov r7, r0
    add r5, r9, #0x1c
    mov r11, r8
    mov r10, #0x800
.L_02024724:
    mov r0, r8, lsl #0x1
    ldrh r1, [r6, r0]
    ldr r0, .L_02024958
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    add r1, r9, r8, lsl #0x2
    cmp r0, #0x0
    ldr r0, [r1, #0xc]
    bne .L_0202475c
    add r0, r0, #0x10
    str r0, [r1, #0xc]
    cmp r0, #0x800
    strgt r10, [r1, #0xc]
    b .L_02024768
.L_0202475c:
    subs r0, r0, #0x10
    str r0, [r1, #0xc]
    strmi r11, [r1, #0xc]
.L_02024768:
    mov r0, #0x1c
    mul r4, r8, r0
    mov r1, #0x2
    add r0, r5, r4
    bl func_02091c7c
    cmp r0, #0x0
    beq .L_020247b0
    mov r0, #0x6
    str r0, [sp, #0x0]
    add r1, r9, r8, lsl #0x2
    add r0, r5, r4
    ldr r4, [r1, #0xc]
    mov r1, #0x3
    mov r3, r4, asr #0x7
    add r3, r4, r3, lsr #0x18
    mov r2, r1
    mov r3, r3, asr #0x8
    bl func_02091bac
.L_020247b0:
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_02024724
    ldr r1, .L_0202495c
    mov r0, #0x0
    str r0, [r1, #0x0]
    str r0, [r1, #-0x4]
    str r0, [r1, #0x10]
    str r0, [sp, #0x0]
    mov r1, #0x2000
    str r1, [sp, #0x4]
    mov r1, #0x1000
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    mov r2, r0
    mov r1, #0xc0000
    mov r3, #0x100000
    str r0, [sp, #0x10]
    bl func_020b0a54
    ldr r0, .L_02024960
    mov r1, #0x3
    str r1, [r0, #0x0]
    mov r4, #0x0
    str r4, [r0, #0x14]
    mov r1, #0x2
    str r1, [r0, #0x0]
    str r4, [r0, #0x14]
    mov r1, #0x1000000
    str r1, [r0, #0x2c]
    str r1, [r0, #0x2c]
    mov r2, #0x1000
    ldr r1, .L_02024964
    str r2, [r0, #0x2c]
    str r1, [r0, #0x64]
    str r4, [r0, #0x68]
    ldmib r7, {r1, r2}
    mov r1, r1, asr #0xc
    rsb r1, r1, #0x0
    mov r2, r2, asr #0xc
    str r1, [r0, #0x30]
    rsb r1, r2, #0x0
    str r1, [r0, #0x30]
    str r4, [r0, #0x30]
    mov r1, #0x1
    str r1, [r0, #0xc0]
    ldr r0, [r9, #0x8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_02024934
.L_02024878: ; jump table
    b .L_020248e8 ; case 0
    b .L_020248e8 ; case 1
    b .L_020248e8 ; case 2
    b .L_020248e8 ; case 3
    b .L_0202488c ; case 4
.L_0202488c:
    ldr r8, .L_02024968
    ldr r7, .L_0202496c
    ldr r11, .L_02024970
    ldr r10, .L_02024954
    ldr r6, .L_02024958
    mov r5, #0x1c
.L_020248a4:
    mov r0, r4, lsl #0x1
    ldrh r1, [r10, r0]
    ldr r0, [r6, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_020248d8
    mla r0, r4, r5, r9
    str r8, [sp, #0x0]
    ldr r2, [r0, #0x2c]
    mov r0, r9
    mov r3, r11
    add r1, r7, r4, lsl #0x3
    bl func_0202497c
.L_020248d8:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_020248a4
    b .L_02024934
.L_020248e8:
    ldr r1, .L_02024954
    mov r2, r0, lsl #0x1
    ldr r0, .L_02024958
    ldrh r1, [r1, r2]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02024934
    ldr r4, [r9, #0x8]
    mov r0, #0x1c
    mla r0, r4, r0, r9
    ldr r2, .L_02024968
    ldr r1, .L_02024974
    str r2, [sp, #0x0]
    ldr r2, [r0, #0x2c]
    ldr r3, .L_02024970
    mov r0, r9
    add r1, r1, r4, lsl #0x3
    bl func_0202497c
.L_02024934:
    ldr r2, .L_02024978
    mov r0, #0x0
    str r0, [r2, #0x0]
    mov r1, #0x1
    str r1, [r2, #-0xbc]
.L_02024948:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02024950: .word data_021052fc
.L_02024954: .word data_020d6780
.L_02024958: .word gGameWork
.L_0202495c: .word 0x4000444
.L_02024960: .word 0x4000440
.L_02024964: .word 0x3f1f00c0
.L_02024968: .word 0x3ff
.L_0202496c: .word data_020d67dc
.L_02024970: .word 0x7f18
.L_02024974: .word data_020d67fc
.L_02024978: .word 0x4000504
    .size func_020246d8, . - func_020246d8
