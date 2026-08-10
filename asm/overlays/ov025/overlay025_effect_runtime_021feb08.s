.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_runtime.c. */
.extern GraphicsSpriteState_GetSequenceDuration
.extern func_0209189c
.extern func_ov025_021fe174
.extern func_ov025_021fe904


    .global func_ov025_021feb08
func_ov025_021feb08:
    stmdb sp!, {r3, r4, r5, lr}
    mov r2, r1
    mov r5, r0
    mov r1, #0x1
    mov r3, #0x2
    bl func_ov025_021fe174
    ldr r0, [r5, #0xe8]
    bl GraphicsSpriteState_GetSequenceDuration
    mov r4, r0
    add r0, r5, #0xf8
    mov r1, #0x5
    mov r2, #0xa
    bl func_0209189c
    mul r1, r4, r0
    mov r0, r5
    bl func_ov025_021fe904
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov025_021feb08, .-func_ov025_021feb08

