.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern func_02072bdc
.extern func_020939d8
.extern func_ov032_021fe0c4

    .global func_ov032_021fe10c
func_ov032_021fe10c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    bl func_020939d8
    add r0, r4, #0xc4
    bl func_ov032_021fe0c4
    ldr r0, [r4, #0xc4]
    mov r1, #0x0
    bl func_02072bdc
    ldmia sp!, {r4, pc}
.size func_ov032_021fe10c, .-func_ov032_021fe10c

