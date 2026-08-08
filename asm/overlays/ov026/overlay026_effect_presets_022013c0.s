.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_presets.c. */
.extern func_020948d4


    .global func_ov026_022013c0
func_ov026_022013c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x160]
    mov r5, r2
    add r0, r0, #0x1c
    bl func_020948d4
    ldr r4, [r4, #0x164]
    mov r1, r5
    add r0, r4, #0x1c
    bl func_020948d4
    add r0, r4, #0x6c
    mov r1, #0x6000
    bl func_020948d4
    mov r0, #0x6000
    str r0, [r4, #0xb8]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov026_022013c0, .-func_ov026_022013c0

