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

    .global func_ov034_021fe6f0

func_ov034_021fe6f0: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov034_021fce00
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov034_021fe6f0, .-func_ov034_021fe6f0

