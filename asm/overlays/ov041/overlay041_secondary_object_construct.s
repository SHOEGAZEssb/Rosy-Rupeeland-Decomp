.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_secondary_object_construct.c. */
.extern __construct_array
.extern data_020f4e14
.extern data_ov041_0220582c
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020755e0
.extern func_0209a208
.extern func_020bf1f8
.extern func_ov041_021fce00
.extern func_ov041_021fd000
.extern func_ov041_021ff1cc
.extern genrand_int32

    .global func_ov041_02200660
func_ov041_02200660: ; 0x02200660
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r5, r1
    mov r9, r2
    bl func_ov041_021ff1cc
    ldr r0, .L_022008f4
    ldr r4, .L_022008f8
    str r0, [r10, #0x0]
    ldr r3, .L_022008fc
    add r0, r10, #0x64
    mov r1, #0x4
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    mov r0, #0x4
    str r5, [r10, #0x48]
    ldr r11, .L_02200900
    sub r8, r0, #0x1
    mov r4, #0x2bc
    mov r6, #0x2
    mov r5, #0x0
.L_022006b8:
    ldr r1, .L_02200904
    str r9, [sp, #0x0]
    mov r2, r1
    mov r3, r1
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r6, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    mov r7, r8, lsl #0x12
    ldr r1, [r1, #0x4c]
    ldr ip, [ip, #0x0]
    mov r2, r7
    mov r3, r5
    blx ip
    ldr r0, [r10, #0x48]
    add r2, r10, r8, lsl #0x2
    ldr r0, [r0, #0x1f4]
    cmp r0, #0x2
    add r0, r10, r8, lsl #0x2
    ldreq r1, [r0, #0x4c]
    ldreqh r0, [r1, #0x42]
    orreq r0, r0, #0x4
    ldrne r1, [r0, #0x4c]
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    strh r0, [r1, #0x42]
    mov r1, r8, lsr #0x1f
    rsb r0, r1, r8, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    add r1, r0, #0x3
    ldr r2, [r2, #0x4c]
    and r1, r1, #0xff
    ldr r0, [r2, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0xc
    mla r2, r8, r0, r10
    add r3, r7, #0x20000
    mul r1, r8, r11
    add r0, r10, r8, lsl #0x1
    str r3, [r2, #0x68]
    strh r1, [r0, #0x94]
    strh r4, [r0, #0x9c]
    subs r8, r8, #0x1
    bpl .L_022006b8
    ldr r1, .L_02200908
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x5c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    mov r2, #0xf4000
    ldr r1, [r10, #0x5c]
    ldr r4, [r4, #0x0]
    sub r3, r2, #0x154000
    blx r4
    ldr r0, [r10, #0x5c]
    mov r2, #0x0
    ldr r0, [r0, #0xc]
    sub r6, r2, #0x80
    strb r2, [r0, #0x3a]
    ldr r5, [r10, #0x5c]
    ldr r1, .L_02200908
    ldrh r3, [r5, #0x42]
    mov r4, #0x2
    mov r0, r10
    bic r3, r3, #0x4
    strh r3, [r5, #0x42]
    ldr r5, [r10, #0x5c]
    add r2, r1, #0x1
    str r6, [r5, #0x44]
    str r9, [sp, #0x0]
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_0209a208
    str r0, [r10, #0x60]
    ldr r0, [r10, #0x48]
    mov r2, #0xf4000
    ldr r0, [r0, #0x1f4]
    sub r3, r2, #0x154000
    cmp r0, #0x2
    moveq r1, r4
    mov r0, #0x0
    movne r1, #0x1
    str r0, [sp, #0x0]
    and r0, r1, #0xff
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0x60]
    ldr r4, [r4, #0x0]
    blx r4
    ldr r0, [r10, #0x60]
    mov r2, #0x0
    ldr r1, [r0, #0xc]
    ldr r0, .L_0220090c
    strb r2, [r1, #0x3a]
    ldr r2, [r10, #0x60]
    ldrh r1, [r2, #0x42]
    bic r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r0, [r0, #0x0]
    bl func_020755e0
    mov r1, #0x1f
    mov r7, #0x0
    strh r1, [r0, #0x8]
    mov r5, #0x64
    mov r6, r7
    mov r9, #0x12
.L_022008a4:
    mul r0, r7, r9
    mov r8, r6
    add r4, r0, r10
.L_022008b0:
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    add r0, r4, r8, lsl #0x1
    add r8, r8, #0x1
    strh r1, [r0, #0xa4]
    cmp r8, #0x9
    blt .L_022008b0
    add r7, r7, #0x1
    cmp r7, #0xa
    blt .L_022008a4
    mov r1, #0x0
    str r1, [r10, #0x15c]
    mov r0, r10
    str r1, [r10, #0x158]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022008f4: .word data_ov041_0220582c
.L_022008f8: .word func_ov041_021fce00
.L_022008fc: .word func_ov041_021fd000
.L_02200900: .word 0x1388
.L_02200904: .word 0x23a5
.L_02200908: .word 0x1375
.L_0220090c: .word data_020f4e14
    .size func_ov041_02200660, . - func_ov041_02200660

