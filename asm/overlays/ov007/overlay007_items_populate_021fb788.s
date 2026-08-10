    .text
    .extern func_0209a208
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_0200500c
    .extern func_020050a4
    .extern func_02005058
    .extern data_ov007_021fc280
    .extern data_ov007_021fc28c
    .extern data_ov007_021fc294
    .extern data_ov007_021fc29c
    .extern data_ov007_021fc2a4
    .extern data_ov007_021fc2ac
    .extern data_ov007_021fc2b4
    .extern data_ov007_021fc2bc
    .extern data_ov007_021fc2c4
    .extern data_ov007_021fc2cc
    .extern data_ov007_021fc284

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov007/overlay007_items_populate.c. */
    .global func_ov007_021fb788
func_ov007_021fb788: ; 0x021fb788
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r2, [r5, #0x4c]
    mov r4, r1
    cmp r2, #0x0
    bne L_021fba18
    ldr r1, L_021fbab4
    str r4, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r6, [r0, #0x0]
    ldr r1, [r5, #0x4c]
    ldr r6, [r6, #0x0]
    mov r2, #0xa0000
    mov r3, #0x87000
    blx r6
    ldr r10, L_021fbab8
    ldr r9, [r10, #0x0]
    tst r9, #0x1
    bne L_021fb8c0
    mov r0, #0xbb
    str r0, [r10, #0x4]
    mov r0, #0x72
    str r0, [r10, #0x8]
    orr r9, r9, #0x1
    str r9, [r10, #0x0]
    ldr r8, L_021fbabc
    mov r9, #0xd0
    mov r10, #0x63
    str r9, [r8, #0x0]
    str r10, [r8, #0x4]
    ldr r7, L_021fbac0
    mov r9, #0xe4
    mov r8, #0x55
    str r9, [r7, #0x0]
    str r8, [r7, #0x4]
    ldr r6, L_021fbac4
    mov r10, #0xb8
    mov r9, #0x4f
    str r10, [r6, #0x0]
    str r9, [r6, #0x4]
    ldr lr, L_021fbac8
    mov r7, #0xd6
    mov r8, #0x40
    str r7, [lr, #0x0]
    str r8, [lr, #0x4]
    ldr ip, L_021fbacc
    mov r10, #0x9d
    mov r6, #0x3e
    str r10, [ip, #0x0]
    str r6, [ip, #0x4]
    ldr r3, L_021fbad0
    mov r9, #0xba
    mov r7, #0x35
    ldr r2, L_021fbad4
    mov r8, #0xe6
    mov lr, #0x31
    str r9, [r3, #0x0]
    str r7, [r3, #0x4]
    ldr r1, L_021fbad8
    ldr r11, L_021fbadc
    stmia r2, {r8, lr}
    mov r0, #0x28
    mov r10, #0xae
    mov r6, #0xcd
    str r10, [r1, #0x0]
    str r0, [r1, #0x4]
    str r6, [r11, #0x0]
    str r0, [r11, #0x4]
L_021fb8c0:
    mov r0, #0xa
    mov r8, #0x0
    ldr r11, L_021fbae0
    ldr r7, L_021fbae4
    sub r10, r0, #0x1
    mov r9, #0x2
    mov r6, r8
L_021fb8dc:
    mov r0, r5
    mov r1, r11
    add r2, r11, #0x1
    add r3, r11, #0x2
    stmia sp, {r4, r9}
    bl func_0209a208
    add r1, r5, r10, lsl #0x2
    str r0, [r1, #0x50]
    str r8, [sp, #0x0]
    str r8, [sp, #0x4]
    mov r0, r5
    add r3, r7, r10, lsl #0x3
    ldr ip, [r0, #0x0]
    ldr r2, [r7, r10, lsl #0x3]
    ldr r3, [r3, #0x4]
    ldr r1, [r1, #0x50]
    ldr ip, [ip, #0x0]
    mov r2, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    blx ip
    add r0, r5, r10, lsl #0x2
    mov r2, r10, lsr #0x1f
    ldr r0, [r0, #0x50]
    rsb r1, r2, r10, lsl #0x1e
    add r1, r2, r1, ror #0x1e
    mov r1, r1, lsl #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r5, r10, lsl #0x2
    str r6, [r0, #0xa4]
    subs r10, r10, #0x1
    bpl L_021fb8dc
    ldr r1, L_021fbae8
    str r4, [sp, #0x0]
    mov r2, #0x2
    mov r0, r5
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r5, #0x78]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r6, [r0, #0x0]
    ldr r1, [r5, #0x78]
    ldr r6, [r6, #0x0]
    mov r2, #0x2b000
    mov r3, #0x49000
    blx r6
    mov r1, #0x2
    ldr r0, [r5, #0x78]
    mov r2, #0x4
    strh r2, [r0, #0x42]
    str r4, [sp, #0x0]
    ldr r2, L_021fbaec
    mov r0, r5
    str r1, [sp, #0x4]
    rsb r1, r1, #0x1380
    mov r3, #0x1380
    bl func_0209a208
    str r0, [r5, #0x7c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r5
    ldr r1, [r5, #0x7c]
    mov r2, #0x2a000
    mov r3, #0xb4000
    ldr r4, [r0, #0x0]
    ldr r4, [r4, #0x0]
    blx r4
    ldr r1, [r5, #0x7c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    b L_021fba60
L_021fba18:
    ldrh r1, [r2, #0x42]
    mov r0, #0xa
    sub r3, r0, #0x1
    bic r0, r1, #0x4
    strh r0, [r2, #0x42]
L_021fba2c:
    add r1, r5, r3, lsl #0x2
    ldr r0, [r1, #0xa4]
    cmp r0, #0x8
    ldrle r1, [r1, #0x50]
    ldrleh r0, [r1, #0x42]
    bicle r0, r0, #0x4
    strleh r0, [r1, #0x42]
    subs r3, r3, #0x1
    bpl L_021fba2c
    ldr r1, [r5, #0x7c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
L_021fba60:
    mov r1, #0x0
    add r0, sp, #0x8
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    add r1, sp, #0x8
    add r0, r5, #0x80
    bl func_020050a4
    add r0, sp, #0x8
    bl func_02005058
    mov r0, #0x0
    str r0, [r5, #0x98]
    strb r0, [r5, #0xa0]
    strb r0, [r5, #0xa1]
    strh r0, [r5, #0xd8]
    str r0, [r5, #0xcc]
    strb r0, [r5, #0xd0]
    mov r0, #0x1
    str r0, [r5, #0xd4]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fbab4: .word 0x104f
L_021fbab8: .word data_ov007_021fc280
L_021fbabc: .word data_ov007_021fc28c
L_021fbac0: .word data_ov007_021fc294
L_021fbac4: .word data_ov007_021fc29c
L_021fbac8: .word data_ov007_021fc2a4
L_021fbacc: .word data_ov007_021fc2ac
L_021fbad0: .word data_ov007_021fc2b4
L_021fbad4: .word data_ov007_021fc2bc
L_021fbad8: .word data_ov007_021fc2c4
L_021fbadc: .word data_ov007_021fc2cc
L_021fbae0: .word 0x1160
L_021fbae4: .word data_ov007_021fc284
L_021fbae8: .word 0x13ba
L_021fbaec: .word 0x137f

    .size func_ov007_021fb788, .-func_ov007_021fb788
