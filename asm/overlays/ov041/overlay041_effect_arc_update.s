.text

/* Exact fallback for func_ov041_02202220; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_arc_update.c. */
.extern gFx32CosSinTable
.extern func_ov041_02202a70
.extern genrand_int32

    .global func_ov041_02202220
func_ov041_02202220: ; 0x02202220
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4b4]
    mov r3, #0x0
    cmp r0, #0xdc000
    subgt r0, r0, #0x1000
    strgt r0, [r4, #0x4b4]
    ldr r1, [r4, #0x930]
    ldr r0, .L_02202328
    add r1, r1, #0x320
    mov r2, r1, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh ip, [r0, r2]
    mov r2, #0x28000
    str r1, [r4, #0x930]
    umull r5, lr, ip, r2
    mla lr, ip, r3, lr
    mov ip, ip, asr #0x1f
    mla lr, ip, r2, lr
    adds r5, r5, #0x800
    mov r2, r5, lsr #0xc
    adc r1, lr, #0x0
    ldr r5, [r4, #0x4b4]
    orr r2, r2, r1, lsl #0x14
    add r1, r5, r2
    str r1, [r4, #0x70]
    mov r1, #0x8000
    str r1, [r4, #0x4b8]
    ldr r1, [r4, #0x930]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    rsb r0, r0, #0x1000
    mov r0, r0, asr #0x1
    str r0, [r4, #0x940]
    ldr r0, [r4, #0x930]
    cmp r0, #0x20000
    ldmleia sp!, {r3, r4, r5, pc}
    mov r0, #0xa
    str r0, [r4, #0x920]
    str r3, [r4, #0x934]
    str r3, [r4, #0x930]
    str r3, [r4, #0x91c]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x194]
    sub r0, r0, #0xaa000
    str r0, [r4, #0x4b4]
    bl genrand_int32
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1e
    sub r1, r0, #0x1
    ldr r2, [r4, #0x4b8]
    mov r0, #0x46
    mla r2, r1, r0, r2
    mov r0, r4
    str r2, [r4, #0x4b8]
    bl func_ov041_02202a70
    ldmia sp!, {r3, r4, r5, pc}
.L_02202328: .word gFx32CosSinTable

    .size func_ov041_02202220, . - func_ov041_02202220

