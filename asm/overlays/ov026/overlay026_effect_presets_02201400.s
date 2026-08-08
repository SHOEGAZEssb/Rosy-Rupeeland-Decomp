.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_presets.c. */
.extern func_020948d4


    .global func_ov026_02201400
func_ov026_02201400:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x168]
    mov r1, #0x5000
    add r0, r4, #0x1c
    rsb r1, r1, #0x0
    bl func_020948d4
    add r0, r4, #0x6c
    mov r1, #0x4000
    bl func_020948d4
    mov r0, #0x4000
    str r0, [r4, #0xb4]
    ldmia sp!, {r4, pc}
.size func_ov026_02201400, .-func_ov026_02201400

