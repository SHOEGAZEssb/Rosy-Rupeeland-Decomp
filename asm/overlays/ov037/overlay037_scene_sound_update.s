.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_sound_update.c for documented portable C. */

    .extern func_02091c7c
    .extern func_020918f4
    .extern Sound_Play
    .extern func_0209189c
    .extern func_02091b98
    .extern data_ov037_021feaa4
    .extern gSoundContext

    .global func_ov037_021fe1f0
func_ov037_021fe1f0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    add r0, r4, #0x18c
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe274
    ldr r3, L_021fe27c
    add r2, sp, #0x0
    mov r1, #0x6
L_021fe21c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fe21c
    add r0, r4, #0xbc
    mov r1, #0x6
    bl func_020918f4
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1
    ldrh r2, [r1, r0]
    ldr r0, L_021fe280
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
    add r0, r4, #0xbc
    mov r1, #0xa
    mov r2, #0x1e
    bl func_0209189c
    mov r1, r0
    add r0, r4, #0x18c
    bl func_02091b98
L_021fe274:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
L_021fe27c: .word data_ov037_021feaa4
L_021fe280: .word gSoundContext
    .size func_ov037_021fe1f0, .-func_ov037_021fe1f0
