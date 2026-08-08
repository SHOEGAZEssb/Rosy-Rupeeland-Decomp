.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_lifecycle.c. */
.extern func_020bf1f8
.extern func_ov041_021fec04
.extern genrand_int32

    .global func_ov041_021ff5a8
func_ov041_021ff5a8: ; 0x021ff5a8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x1ac]
    mvn r0, #0x0
    b .L_021ff644
.L_021ff5bc:
    ldr lr, [r5, #0x80]
    mov ip, r4, lsl #0x1
    ldrsh r3, [lr, ip]
    cmp r3, r0
    bgt .L_021ff644
    mov r0, #0xc
    mul r3, r4, r0
    strh r1, [lr, ip]
    ldr r0, [r5, #0x84]
    ldr r1, [r2, #0x4]
    add r0, r0, r3
    str r1, [r0, #0x4]
    ldr r0, [r5, #0x84]
    ldr r1, [r2, #0x8]
    add r0, r0, r3
    str r1, [r0, #0x8]
    ldr r0, [r5, #0x88]
    ldr r1, [r5, #0x84]
    add r0, r0, r3
    add r1, r1, r3
    bl func_ov041_021fec04
    bl genrand_int32
    ldr r1, .L_021ff654
    bl func_020bf1f8
    ldr r0, [r5, #0x94]
    mov r3, r4, lsl #0x1
    strh r1, [r0, r3]
    ldr r0, [r5, #0x8c]
    mov r2, #0x0
    strh r2, [r0, r3]
    ldr r1, [r5, #0x90]
    mov r0, r4
    str r2, [r1, r4, lsl #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_021ff644:
    subs r4, r4, #0x1
    bpl .L_021ff5bc
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021ff654: .word 0xffff
    .size func_ov041_021ff5a8, . - func_ov041_021ff5a8

