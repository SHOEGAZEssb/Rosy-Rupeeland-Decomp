.text

/* Exact fallback; see src/overlays/ov036/overlay036_final_controller_sequence.c for documented portable C. */

    .extern func_02059278
    .extern func_02094cf0
    .extern func_02095248
    .extern Sound_Play
    .extern func_ov036_02201d60
    .extern func_020948d4
    .extern func_020948e4
    .extern func_ov036_021fd28c
    .extern func_02094d28
    .extern func_020956fc
    .extern func_02095224
    .extern func_0205929c
    .extern func_ov036_0220429c
    .extern gSoundContext
    .extern data_ov036_022055d0
    .extern data_ov036_022050e4

    .global func_ov036_022042e0
func_ov036_022042e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_022044f0
L_022042f8: ; jump table
    b L_02204310 ; case 0
    b L_02204350 ; case 1
    b L_022043d4 ; case 2
    b L_02204434 ; case 3
    b L_022044b0 ; case 4
    b L_022044e4 ; case 5
L_02204310:
    ldr r0, L_02204500
    mov r1, #0xb3
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0xf0]
    ldr r1, L_02204504
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xf8]
    ldr r1, L_02204508
    mov r2, #0x1
    bl func_02094cf0
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_02204350:
    ldr r0, [r4, #0xf8]
    bl func_02095248
    cmp r0, #0x0
    beq L_022044f0
    ldr r0, L_02204500
    ldr r1, L_0220450c
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, [r4, #0xf8]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xf4]
    mov r1, #0x1f
    bl func_ov036_02201d60
    ldr r0, [r4, #0xf4]
    mov r1, #0x0
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r0, [r4, #0xf4]
    mov r1, #0x1
    add r0, r0, #0x6c
    mov r2, #0x3000
    bl func_020948e4
    ldr r1, [r4, #0xf4]
    mov r0, #0xf
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022044f0
L_022043d4:
    ldr r0, [r4, #0xf4]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    ldreq r1, [r4, #0xf4]
    ldreqh r0, [r1, #0x98]
    biceq r0, r0, #0x1
    streqh r0, [r1, #0x98]
    beq L_022044f0
    ldr r0, L_02204500
    ldr r1, L_0220450c
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0xf0]
    mov r2, #0x0
    str r2, [r0, #0x90]
    ldr r1, [r4, #0xf4]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    str r2, [r1, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022044f0
L_02204434:
    ldr r0, [r4, #0xf4]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02204464
    ldr r1, [r4, #0xf4]
    ldrh r0, [r1, #0x98]
    orr r0, r0, #0x1
    strh r0, [r1, #0x98]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022044f0
L_02204464:
    mov r1, #0x1
    ldr r0, [r4, #0xf4]
    mov r3, r1
    mov r2, #0x1f
    bl func_02094d28
    mov r1, r0
    ldr r0, [r4, #0xf4]
    bl func_ov036_02201d60
    ldr r0, [r4, #0xd8]
    bl func_020956fc
    mov r1, #0x1
    ldr r0, [r4, #0xf4]
    mov r2, r1
    mov r3, #0x1f
    bl func_02094d28
    ldr r1, [r4, #0xd8]
    ldr r1, [r1, #0x9c]
    strb r0, [r1, #0x5b]
    b L_022044f0
L_022044b0:
    ldr r0, [r4, #0xf0]
    bl func_02095224
    cmp r0, #0x0
    beq L_022044f0
    ldr r0, L_02204500
    mov r1, #0xb3
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_022044f0
L_022044e4:
    bl func_ov036_0220429c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_022044f0:
    mov r0, r4
    bl func_ov036_0220429c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02204500: .word gSoundContext
L_02204504: .word data_ov036_022055d0
L_02204508: .word data_ov036_022050e4
L_0220450c: .word 0x1b3
    .size func_ov036_022042e0, .-func_ov036_022042e0

