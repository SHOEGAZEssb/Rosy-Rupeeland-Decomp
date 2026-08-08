.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_controller.c. */
.extern data_ov025_02202d24
.extern func_020948e4
.extern func_02094bbc
.extern func_02094cf0
.extern func_ov025_021fe174
.extern func_ov025_021fe248
.extern func_ov025_021fe2c4
.extern func_ov025_021fe39c


    .global func_ov025_021fe4cc
func_ov025_021fe4cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x9c]
    str r2, [r4, #0xac]
    mov r1, #0x0
    str r1, [r4, #0xa0]
    ldr r3, [r4, #0xec]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r3, [r4, #0xf4]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r4, #0x9c]
    cmp r2, #0xb
    addls pc, pc, r2, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fe514: ; jump table
    b L_021fe544 ; case 0
    b L_021fe7b0 ; case 1
    b L_021fe570 ; case 2
    b L_021fe634 ; case 3
    b L_021fe634 ; case 4
    b L_021fe6ac ; case 5
    b L_021fe738 ; case 6
    b L_021fe738 ; case 7
    b L_021fe738 ; case 8
    ldmia sp!, {r4, pc} ; case 9
    b L_021fe838 ; case 10
    b L_021fe8c4 ; case 11
L_021fe544:
    ldr r2, [r4, #0xa4]
    cmp r2, #0x0
    beq L_021fe570
    mov r2, r1
    mov r3, #0x2
    bl func_ov025_021fe174
    ldr r1, L_021fe900
    mov r0, r4
    mov r2, #0x1
    bl func_02094cf0
    ldmia sp!, {r4, pc}
L_021fe570:
    ldr r0, [r4, #0xa4]
    ldr r2, [r4, #0xac]
    cmp r0, #0x0
    mov r1, #0x1
    mov r0, r4
    beq L_021fe5bc
    mov r3, #0x2
    bl func_ov025_021fe174
    mov r0, r4
    mov r1, #0x120000
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
    mov r2, #0x20000
    add r0, r4, #0xc
    rsb r2, r2, #0x0
    mov r1, #0x2
    bl func_020948e4
    b L_021fe5ec
L_021fe5bc:
    mov r3, #0x42
    bl func_ov025_021fe174
    mov r1, #0x20000
    mov r0, r4
    rsb r1, r1, #0x0
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x120000
    bl func_020948e4
L_021fe5ec:
    ldr r0, [r4, #0xac]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fe5fc: ; jump table
    b L_021fe60c ; case 0
    b L_021fe620 ; case 1
    b L_021fe620 ; case 2
    b L_021fe60c ; case 3
L_021fe60c:
    mov r0, #0x12c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe620:
    mov r0, #0x96
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe634:
    ldr r1, [r4, #0xa4]
    ldr r2, [r4, #0xac]
    cmp r1, #0x0
    mov r1, #0x1
    beq L_021fe668
    mov r3, #0x2
    bl func_ov025_021fe174
    mov r0, r4
    mov r1, #0x120000
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
    b L_021fe688
L_021fe668:
    mov r3, #0x42
    bl func_ov025_021fe174
    mov r1, #0x20000
    mov r0, r4
    rsb r1, r1, #0x0
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
L_021fe688:
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x80000
    bl func_020948e4
    mov r0, #0x12c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe6ac:
    ldr r1, [r4, #0xa4]
    cmp r1, #0x0
    beq L_021fe6e8
    bl func_ov025_021fe248
    mov r0, r4
    mov r1, #0x120000
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
    mov r2, #0x20000
    add r0, r4, #0xc
    rsb r2, r2, #0x0
    mov r1, #0x2
    bl func_020948e4
    b L_021fe714
L_021fe6e8:
    bl func_ov025_021fe2c4
    mov r1, #0x20000
    mov r0, r4
    rsb r1, r1, #0x0
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x120000
    bl func_020948e4
L_021fe714:
    add r0, r4, #0x1c
    mov r1, #0x2
    mov r2, #0x40000
    bl func_020948e4
    mov r0, #0x12c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe738:
    ldr r1, [r4, #0xa4]
    cmp r1, #0x0
    beq L_021fe760
    bl func_ov025_021fe248
    mov r0, r4
    mov r1, #0x120000
    mov r2, #0x60000
    mov r3, #0x0
    bl func_02094bbc
    b L_021fe77c
L_021fe760:
    bl func_ov025_021fe2c4
    mov r1, #0x20000
    mov r0, r4
    rsb r1, r1, #0x0
    mov r2, #0x60000
    mov r3, #0x0
    bl func_02094bbc
L_021fe77c:
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x80000
    bl func_020948e4
    add r0, r4, #0x1c
    mov r1, #0x2
    mov r2, #0x60000
    bl func_020948e4
    mov r0, #0x12c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe7b0:
    ldr r1, [r4, #0xa4]
    cmp r1, #0x0
    mov r1, #0x1
    mov r2, r1
    beq L_021fe7e4
    mov r3, #0x2
    bl func_ov025_021fe174
    mov r0, r4
    mov r1, #0x120000
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
    b L_021fe804
L_021fe7e4:
    mov r3, #0x42
    bl func_ov025_021fe174
    mov r1, #0x20000
    mov r0, r4
    rsb r1, r1, #0x0
    mov r2, #0xa0000
    mov r3, #0x0
    bl func_02094bbc
L_021fe804:
    add r0, r4, #0xc
    mov r1, #0x1
    mov r2, #0x80000
    bl func_020948e4
    add r0, r4, #0x1c
    mov r1, #0x3
    mov r2, #0x60000
    bl func_020948e4
    mov r0, #0x5a
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe838:
    ldr r1, [r4, #0xa4]
    mov r2, #0xd
    cmp r1, #0x0
    mov r1, #0x1
    beq L_021fe880
    mov r3, #0x2
    bl func_ov025_021fe174
    mov r1, #0x120000
    mov r0, r4
    sub r2, r1, #0x200000
    mov r3, #0x0
    bl func_02094bbc
    mov r2, #0x20000
    add r0, r4, #0xc
    rsb r2, r2, #0x0
    mov r1, #0x2
    bl func_020948e4
    b L_021fe8b0
L_021fe880:
    mov r3, #0x42
    bl func_ov025_021fe174
    mov r1, #0x20000
    rsb r1, r1, #0x0
    mov r0, r4
    sub r2, r1, #0xc0000
    mov r3, #0x0
    bl func_02094bbc
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x120000
    bl func_020948e4
L_021fe8b0:
    mov r0, #0x1e0
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe8c4:
    bl func_ov025_021fe39c
    mov r1, #0x80000
    mov r0, r4
    sub r2, r1, #0x1a0000
    mov r3, #0x0
    bl func_02094bbc
    add r0, r4, #0x1c
    mov r1, #0x1
    mov r2, #0xa0000
    bl func_020948e4
    mov r0, #0x3c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fe900: .word data_ov025_02202d24
.size func_ov025_021fe4cc, .-func_ov025_021fe4cc

