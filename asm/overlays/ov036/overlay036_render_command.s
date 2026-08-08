.text

/* Exact fallback; see src/overlays/ov036/overlay036_render_updates.c for documented portable C. */

    .extern Sound_Play
    .extern gSoundContext

    .global func_ov036_021fd19c
func_ov036_021fd19c:
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b L_021fd23c
L_021fd1b0: ; jump table
    b L_021fd1c0 ; case 0
    b L_021fd1d0 ; case 1
    b L_021fd1f4 ; case 2
    b L_021fd214 ; case 3
L_021fd1c0:
    ldr r1, [r1, #0x4]
    str r1, [r0, #0xa0]
    mov r0, #0x2
    ldmia sp!, {r3, pc}
L_021fd1d0:
    ldr r2, [r1, #0x4]
    str r2, [r0, #0xb0]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0xb4]
    ldrh r1, [r0, #0x98]
    orr r1, r1, #0x8
    strh r1, [r0, #0x98]
    mov r0, #0x3
    ldmia sp!, {r3, pc}
L_021fd1f4:
    ldr r1, [r1, #0x4]
    cmp r1, #0x0
    ldrh r1, [r0, #0x98]
    bicne r1, r1, #0x1
    orreq r1, r1, #0x1
    strh r1, [r0, #0x98]
    mov r0, #0x2
    ldmia sp!, {r3, pc}
L_021fd214:
    ldr r0, [r1, #0x4]
    ldr r1, L_021fd244
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
    mov r0, #0x2
    ldmia sp!, {r3, pc}
L_021fd23c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021fd244: .word gSoundContext
    .size func_ov036_021fd19c, .-func_ov036_021fd19c

