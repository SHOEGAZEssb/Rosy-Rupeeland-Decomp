.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern data_ov025_02202c78
.extern Sound_PlayEffectWithParameters
.extern func_0209189c
.extern TitleRandom_NextBounded
.extern func_02091b98
.extern func_02091c7c
.extern gSoundContext


    .global func_ov025_0220088c
func_ov025_0220088c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    mov r4, r0
    add r0, r4, #0x218
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02200930
    ldr r3, L_02200938
    add r2, sp, #0x8
    mov r1, #0x6
L_022008bc:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_022008bc
    add r0, r4, #0x234
    add r0, r0, #0x400
    mov r1, #0x6
    bl TitleRandom_NextBounded
    add r1, sp, #0x8
    mov r0, r0, lsl #0x1
    ldrh r2, [r1, r0]
    mov r1, #0x0
    ldr r0, L_0220093c
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    mov r3, #0x20
    bl Sound_PlayEffectWithParameters
    add r0, r4, #0x234
    add r0, r0, #0x400
    mov r1, #0xa
    mov r2, #0x1e
    bl func_0209189c
    add r2, r4, #0x218
    mov r1, r0
    add r0, r2, #0x400
    bl func_02091b98
L_02200930:
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
L_02200938: .word data_ov025_02202c78
L_0220093c: .word gSoundContext
.size func_ov025_0220088c, .-func_ov025_0220088c

