.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_reset.c. */
.extern data_ov041_02204c1c
.extern data_ov041_02204ca0
.extern func_0209a208
.extern func_020bf1f8
.extern genrand_int32

    .global func_ov041_021ff6f8
func_ov041_021ff6f8: ; 0x021ff6f8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    ldr r2, .L_021ff85c
    add r3, sp, #0x8
    mov r8, r0
    mov r7, r1
    ldmia r2, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r4, #0x0
    str r4, [r8, #0x1a4]
    str r4, [r8, #0x1b8]
    mov r0, #0xb
    str r4, [r8, #0x1b0]
    ldr r1, .L_021ff860
    str r4, [r8, #0x1b4]
    sub r2, r0, #0x1
.L_021ff738:
    ldr r0, [r1, r2, lsl #0x2]
    subs r2, r2, #0x1
    add r4, r4, r0
    bpl .L_021ff738
    add r0, r4, r4, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r8, #0x1bc]
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    mov r2, #0x3e
    sub r5, r2, #0x1
    add r6, r1, r0
    mov r9, #0x6
    mov r4, #0x8
.L_021ff770:
    ldr r0, [sp, #0x8]
    cmp r0, r5
    addgt r0, r8, r5, lsl #0x2
    strgt r4, [r0, #0xac]
    bgt .L_021ff7b8
    cmp r6, r5
    ble .L_021ff7a4
    bl genrand_int32
    and r0, r0, #0x1
    add r1, r0, #0x6
    add r0, r8, r5, lsl #0x2
    str r1, [r0, #0xac]
    b .L_021ff7b8
.L_021ff7a4:
    bl genrand_int32
    mov r1, r9
    bl func_020bf1f8
    add r0, r8, r5, lsl #0x2
    str r1, [r0, #0xac]
.L_021ff7b8:
    subs r5, r5, #0x1
    bpl .L_021ff770
    mov r0, #0x3e
    sub r5, r0, #0x1
    mov r4, r0
.L_021ff7cc:
    bl genrand_int32
    mov r1, r4
    bl func_020bf1f8
    add r3, r8, r5, lsl #0x2
    add r1, r8, r1, lsl #0x2
    ldr r2, [r3, #0xac]
    ldr r0, [r1, #0xac]
    subs r5, r5, #0x1
    str r0, [r3, #0xac]
    str r2, [r1, #0xac]
    bpl .L_021ff7cc
    ldr r1, .L_021ff864
    str r7, [sp, #0x0]
    mov r2, #0x1
    mov r0, r8
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r8, #0x7c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r8
    ldr r4, [r0, #0x0]
    ldr r1, [r8, #0x7c]
    ldr r4, [r4, #0x0]
    mov r2, #0x40000
    mov r3, #0x64000
    blx r4
    ldr r1, [r8, #0x7c]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_021ff85c: .word data_ov041_02204c1c
.L_021ff860: .word data_ov041_02204ca0
.L_021ff864: .word 0x14c3
    .size func_ov041_021ff6f8, . - func_ov041_021ff6f8

