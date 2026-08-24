.text

/* Exact fallback for func_ov041_0220232c; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_camera_arc_update.c. */
.extern Sound_Play
.extern gFx32CosSinTable
.extern func_ov041_021fec04
.extern func_ov041_02202a70
.extern gSoundContext
.extern genrand_int32

    .global func_ov041_0220232c
func_ov041_0220232c: ; 0x0220232c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r1, [r5, #0x48]
    ldr r0, [r5, #0x4b4]
    ldr r2, [r1, #0x14]
    cmp r0, #0x0
    ldr r1, [r1, #0x194]
    ldr r2, [r2, #0x15c]
    subgt r0, r0, #0x1000
    strgt r0, [r5, #0x4b4]
    ldr r0, [r5, #0x930]
    sub r4, r2, r1
    add r1, r0, #0x320
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    sub r0, r0, #0x258
    str r1, [r5, #0x930]
    cmp r0, #0x0
    bgt .L_0220238c
    ldr r0, .L_022024bc
    ldr r1, .L_022024c0
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
.L_0220238c:
    ldr r0, [r5, #0x930]
    mov r2, #0x5b
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, .L_022024c4
    mov r1, r1, lsl #0x1
    ldrsh r3, [r0, r1]
    mov r0, #0x28000
    mov r1, #0x0
    umull ip, r6, r3, r0
    mla r6, r3, r1, r6
    mov r1, r3, asr #0x1f
    mla r6, r1, r0, r6
    adds r3, ip, #0x800
    adc r0, r6, #0x0
    mov r1, r3, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r4, r1
    ldr r3, [r5, #0x4b4]
    sub r7, r2, #0x1
    add r0, r3, r0
    str r0, [r5, #0x70]
    add r6, r5, #0x68
    mov r4, #0xc
.L_022023f8:
    mla r0, r7, r4, r6
    mov r1, r6
    bl func_ov041_021fec04
    sub r7, r7, #0x1
    cmp r7, #0x1
    bge .L_022023f8
    mov r0, #0x8000
    str r0, [r5, #0x4b8]
    ldr r0, [r5, #0x930]
    ldr r1, .L_022024c4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r0, [r1, r0]
    rsb r0, r0, #0x1000
    mov r0, r0, asr #0x1
    str r0, [r5, #0x940]
    ldr r0, [r5, #0x930]
    cmp r0, #0x20000
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0xa
    mov r0, #0x0
    str r1, [r5, #0x920]
    str r0, [r5, #0x934]
    str r0, [r5, #0x930]
    str r0, [r5, #0x91c]
    ldr r1, [r5, #0x48]
    mov r0, #0x50
    ldr r1, [r1, #0x14]
    ldr r1, [r1, #0x15c]
    sub r1, r1, #0xc8000
    str r1, [r5, #0x4b4]
    str r0, [r5, #0x94c]
    ldr r0, [r5, #0x6c]
    str r0, [r5, #0x948]
    bl genrand_int32
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1e
    sub r1, r0, #0x1
    ldr r2, [r5, #0x4b8]
    mov r0, #0x46
    mla r2, r1, r0, r2
    mov r0, r5
    str r2, [r5, #0x4b8]
    bl func_ov041_02202a70
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022024bc: .word gSoundContext
.L_022024c0: .word 0x12d
.L_022024c4: .word gFx32CosSinTable

    .size func_ov041_0220232c, . - func_ov041_0220232c

