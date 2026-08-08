.text

/* Exact fallback; see src/overlays/ov034/overlay034_selection_state.c for documented portable C. */

    .extern func_ov034_021fe2c4
    .extern func_020948e4
    .extern func_ov034_021fda1c
    .extern func_02094d28
    .extern func_020948d4
    .extern func_ov034_021fdac0
    .extern func_ov034_021fdf98
    .extern func_ov034_021fd9c0
    .extern func_ov034_021fe668
    .extern func_ov034_021fd9e8
    .extern func_ov034_021fd3f4
    .extern func_ov034_021fda00
    .extern func_0205929c
    .extern Sound_Play
    .extern func_02059278
    .extern func_ov034_021fd978
    .extern genrand_int32
    .extern func_020bf1f8
    .extern func_ov034_021fce00
    .extern data_020c9670
    .extern data_ov034_021fe740
    .extern gTouchPanelManager
    .extern gSoundContext
    .extern data_ov034_021fe704

    .global func_ov034_021fe668

func_ov034_021fe668: 
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r4, L_021fe6b8
    add lr, sp, #0x0
    mov r5, r0
    mov ip, #0x2
L_021fe680:
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_021fe680
    ldmia r4, {r0, r1}
    stmia lr, {r0, r1}
    bl genrand_int32
    mov r1, #0xa
    bl func_020bf1f8
    add r0, sp, #0x0
    ldr r0, [r0, r1, lsl #0x2]
    str r0, [r5, #0x1b4]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
L_021fe6b8: .word data_ov034_021fe704
.size func_ov034_021fe668, .-func_ov034_021fe668

