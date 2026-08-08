.text

/* Exact fallback; see src/overlays/ov035/overlay035_secondary_scene_lifecycle.c for documented portable C. */

    .extern func_02095360
    .extern func_020773a8


    .global func_ov035_021ff164
func_ov035_021ff164: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10c
    bl func_02095360
    add r0, r4, #0x11c
    bl func_02095360
    add r0, r4, #0x12c
    bl func_02095360
    ldr r0, [r4, #0xf8]
    bl func_020773a8
    ldmia sp!, {r4, pc}
.size func_ov035_021ff164, .-func_ov035_021ff164

