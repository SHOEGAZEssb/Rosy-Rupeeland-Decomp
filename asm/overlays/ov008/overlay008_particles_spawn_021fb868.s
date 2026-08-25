    .text
    .extern func_020bf1f8
    .extern genrand_int32

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov008/overlay008_particles_spawn.c. */
    .global Overlay008_SpawnParticles
Overlay008_SpawnParticles: ; 0x021fb868
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    cmp r8, #0x1
    mov r9, r0
    movle r4, #0x2
    ble L_021fb8c4
    cmp r8, #0x2
    moveq r4, #0x2
    beq L_021fb8c4
    cmp r8, #0x3
    moveq r4, #0x2
    beq L_021fb8c4
    cmp r8, #0x4
    moveq r4, #0x7
    beq L_021fb8c4
    cmp r8, #0x5
    moveq r4, #0x1
    beq L_021fb8c4
    cmp r8, #0x6
    moveq r4, #0x3
    beq L_021fb8c4
    cmp r8, #0x7
    moveq r4, #0x1
L_021fb8c4:
    mov r5, r2, lsl #0xc
    mov r6, r3, lsl #0xc
    b L_021fbce8
L_021fb8d0:
    mov r0, #0x3c
    sub r7, r0, #0x1
    mvn r1, #0x0
L_021fb8dc:
    add r0, r9, r7, lsl #0x2
    ldr r2, [r0, #0x754]
    cmp r2, r1
    bgt L_021fbce0
    ldr r2, [r0, #0x4c]
    add r1, r9, r7, lsl #0x1
    str r5, [r2, #0x30]
    ldr r2, [r0, #0x4c]
    mov ip, #0x0
    str r6, [r2, #0x34]
    ldr r2, [r0, #0x4c]
    add r3, r9, r7, lsl #0x4
    str ip, [r2, #0x38]
    ldr r2, L_021fbcf4
    str ip, [r3, #0x148]
    add r1, r1, #0x800
    strh r2, [r1, #0x44]
    mov r1, #0x96
    str r1, [r0, #0x664]
    cmp r8, #0x3
    bgt L_021fb98c
    bl genrand_int32
    ldr r1, L_021fbcf8
    mov r2, #0x0
    and lr, r0, r1
    mov r0, #0x3000
    umull r1, r3, lr, r0
    adds ip, r1, #0x800
    mla r3, lr, r2, r3
    mov r1, lr, asr #0x1f
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, ip, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r1, r1, #0x1800
    add r0, r9, r7, lsl #0x4
    str r1, [r0, #0x140]
    bl genrand_int32
    ldr r1, L_021fbcfc
    add r2, r9, r7, lsl #0x4
    and r0, r0, r1
    sub r0, r0, #0x3800
    str r0, [r2, #0x144]
    b L_021fbbe8
L_021fb98c:
    cmp r8, #0x4
    bne L_021fb9f8
    bl genrand_int32
    ldr r1, L_021fbcf8
    ldr r2, L_021fbd00
    and ip, r0, r1
    umull r3, r1, ip, r2
    mov r0, #0x0
    adds r3, r3, #0x800
    mla r1, ip, r0, r1
    mov r0, ip, asr #0x1f
    mla r1, r0, r2, r1
    adc r1, r1, #0x0
    mov r2, r3, lsr #0xc
    ldr r0, L_021fbd04
    orr r2, r2, r1, lsl #0x14
    add r1, r2, r0
    add r0, r9, r7, lsl #0x4
    str r1, [r0, #0x140]
    bl genrand_int32
    ldr r1, L_021fbcf8
    ldr r2, L_021fbd08
    and r0, r0, r1
    add r1, r0, r2
    add r0, r9, r7, lsl #0x4
    str r1, [r0, #0x144]
    b L_021fbbe8
L_021fb9f8:
    cmp r8, #0x5
    bne L_021fbab0
    bl genrand_int32
    ldr r1, L_021fbcf8
    ldr r2, L_021fbd0c
    and ip, r0, r1
    umull r3, r1, ip, r2
    mov r0, #0x0
    adds r3, r3, #0x800
    mla r1, ip, r0, r1
    mov r0, ip, asr #0x1f
    mla r1, r0, r2, r1
    adc r1, r1, #0x0
    mov r2, r3, lsr #0xc
    ldr r0, L_021fbd10
    orr r2, r2, r1, lsl #0x14
    add r1, r2, r0
    add r0, r9, r7, lsl #0x4
    str r1, [r0, #0x140]
    bl genrand_int32
    ldr r1, L_021fbd14
    add r3, r9, r7, lsl #0x4
    and r0, r0, r1
    sub r0, r0, #0x1000
    str r0, [r3, #0x144]
    add r0, r9, r7, lsl #0x2
    ldr r2, [r0, #0x4c]
    ldr r0, [r3, #0x140]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsl #0x4
    add r0, r1, r0
    str r0, [r2, #0x30]
    bl genrand_int32
    and r2, r0, #0x1f
    mov r1, r2, asr #0x2
    add r0, r9, r7, lsl #0x1
    rsb r2, r2, #0x1f
    rsb r1, r1, #0x1f
    orr r1, r1, r2, lsl #0x5
    orr r1, r1, r2, lsl #0xa
    add r0, r0, #0x800
    strh r1, [r0, #0x44]
    add r0, r9, r7, lsl #0x2
    mov r1, #0x46
    str r1, [r0, #0x664]
    b L_021fbbe8
L_021fbab0:
    cmp r8, #0x6
    bne L_021fbb40
    bl genrand_int32
    ldr r1, L_021fbcf8
    ldr r2, L_021fbd00
    and ip, r0, r1
    umull r3, r1, ip, r2
    mov r0, #0x0
    adds r3, r3, #0x800
    mla r1, ip, r0, r1
    mov r0, ip, asr #0x1f
    mla r1, r0, r2, r1
    adc r1, r1, #0x0
    mov r2, r3, lsr #0xc
    ldr r0, L_021fbd04
    orr r2, r2, r1, lsl #0x14
    add r1, r2, r0
    add r0, r9, r7, lsl #0x4
    str r1, [r0, #0x140]
    bl genrand_int32
    ldr r1, L_021fbcf8
    ldr r2, L_021fbd18
    and r0, r0, r1
    add r0, r0, r2
    add r1, r9, r7, lsl #0x4
    str r0, [r1, #0x144]
    add r0, r9, r7, lsl #0x2
    ldr ip, [r0, #0x4c]
    ldr r2, [r1, #0x140]
    ldr r3, [ip, #0x30]
    mov r1, #0xd
    mla r1, r2, r1, r3
    str r1, [ip, #0x30]
    mov r1, #0x50
    str r1, [r0, #0x664]
    b L_021fbbe8
L_021fbb40:
    cmp r8, #0x7
    bne L_021fbbe8
    bl genrand_int32
    ldr r1, L_021fbcf8
    mov r2, #0x800
    and r3, r0, r1
    mov r0, r3, asr #0x1f
    mov r0, r0, lsl #0xb
    adds r1, r2, r3, lsl #0xb
    orr r0, r0, r3, lsr #0x15
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r1, r1, #0x400
    add r0, r9, r7, lsl #0x4
    str r1, [r0, #0x140]
    bl genrand_int32
    ldr r1, L_021fbd14
    add r3, r9, r7, lsl #0x4
    and r0, r0, r1
    sub r0, r0, #0x1000
    str r0, [r3, #0x144]
    add r0, r9, r7, lsl #0x2
    ldr r2, [r0, #0x4c]
    ldr r0, [r3, #0x140]
    ldr r1, [r2, #0x30]
    rsb r0, r0, r0, lsl #0x3
    add r0, r1, r0
    str r0, [r2, #0x30]
    bl genrand_int32
    and r2, r0, #0x1f
    mov r1, r2, asr #0x2
    add r0, r9, r7, lsl #0x1
    rsb r2, r2, #0x1f
    rsb r1, r1, #0x1f
    orr r1, r1, r2, lsl #0x5
    orr r1, r1, r2, lsl #0xa
    add r0, r0, #0x800
    strh r1, [r0, #0x44]
    add r0, r9, r7, lsl #0x2
    mov r1, #0x32
    str r1, [r0, #0x664]
L_021fbbe8:
    bl genrand_int32
    add r1, r9, r7, lsl #0x1
    add r1, r1, #0x400
    strh r0, [r1, #0xfc]
    bl genrand_int32
    ldr r1, L_021fbd14
    add r2, r9, r7, lsl #0x2
    and r0, r0, r1
    sub r0, r0, #0x400
    str r0, [r2, #0x574]
    cmp r8, #0x7
    addls pc, pc, r8, lsl #0x2
    b L_021fbce8
L_021fbc1c: ; jump table
    b L_021fbc3c ; case 0
    b L_021fbc3c ; case 1
    b L_021fbc48 ; case 2
    b L_021fbc60 ; case 3
    b L_021fbc7c ; case 4
    b L_021fbc94 ; case 5
    b L_021fbcac ; case 6
    b L_021fbcc4 ; case 7
L_021fbc3c:
    mov r0, #0x1
    str r0, [r2, #0x754]
    b L_021fbce8
L_021fbc48:
    bl genrand_int32
    and r0, r0, #0x1
    add r1, r0, #0x1
    add r0, r9, r7, lsl #0x2
    str r1, [r0, #0x754]
    b L_021fbce8
L_021fbc60:
    bl genrand_int32
    mov r1, #0x6
    bl func_020bf1f8
    add r1, r1, #0x4
    add r0, r9, r7, lsl #0x2
    str r1, [r0, #0x754]
    b L_021fbce8
L_021fbc7c:
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0xa
    add r0, r9, r7, lsl #0x2
    str r1, [r0, #0x754]
    b L_021fbce8
L_021fbc94:
    bl genrand_int32
    and r0, r0, #0x7
    add r1, r0, #0xe
    add r0, r9, r7, lsl #0x2
    str r1, [r0, #0x754]
    b L_021fbce8
L_021fbcac:
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0xa
    add r0, r9, r7, lsl #0x2
    str r1, [r0, #0x754]
    b L_021fbce8
L_021fbcc4:
    mov r0, #0x0
    str r0, [r2, #0x754]
    ldr r1, [r2, #0x4c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    b L_021fbce8
L_021fbce0:
    subs r7, r7, #0x1
    bpl L_021fb8dc
L_021fbce8:
    subs r4, r4, #0x1
    bpl L_021fb8d0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fbcf4: .word 0x7fff
L_021fbcf8: .word 0xfff
L_021fbcfc: .word 0x1fff
L_021fbd00: .word 0x2333
L_021fbd04: .word 0xffffee66
L_021fbd08: .word 0xffffd99a
L_021fbd0c: .word 0x1ccd
L_021fbd10: .word 0xfffff19a
L_021fbd14: .word 0x7ff
L_021fbd18: .word 0xffffc99a

    .size Overlay008_SpawnParticles, . - Overlay008_SpawnParticles
