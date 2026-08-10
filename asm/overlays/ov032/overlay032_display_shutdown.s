.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern GXS_SetGraphicsMode
.extern GX_SetGraphicsMode
.extern data_020f4e14
.extern data_021052fc
.extern func_02008570
.extern GamePhaseState_SetEnabled
.extern GamePhaseAreaScene_SetEnabled
.extern func_020755bc
.extern func_02075a04
.extern func_02092418
.extern func_ov032_021fde1c
.extern gDebugFont

    .global func_ov032_021fde38
func_ov032_021fde38:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0xf2c]
    ldr r0, [r4, #0xb50]
    bl func_ov032_021fde1c
    add r0, r4, #0x3e8
    add r0, r0, #0x800
    bl func_02092418
    mov r3, #0x4000000
    ldr r0, [r3, #0x0]
    mov r1, #0x0
    bic r0, r0, #0x1f00
    orr ip, r0, #0x1000
    mov r2, r1
    mov r0, #0x1
    str ip, [r3, #0x0]
    bl GX_SetGraphicsMode
    ldr r2, L_021fdf20
    mov r0, #0x5
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    bl GXS_SetGraphicsMode
    ldr r0, L_021fdf24
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fdf28
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fdf24
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_02075a04
    ldr r0, L_021fdf28
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_02075a04
    ldr r0, L_021fdf2c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    ldr r0, L_021fdf2c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_02008570
    ldr r0, L_021fdf2c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldmia sp!, {r4, pc}
L_021fdf20: .word 0x4001000
L_021fdf24: .word data_020f4e14
L_021fdf28: .word gDebugFont
L_021fdf2c: .word data_021052fc
.size func_ov032_021fde38, .-func_ov032_021fde38

