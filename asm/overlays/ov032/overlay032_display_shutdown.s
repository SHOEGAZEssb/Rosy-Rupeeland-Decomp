.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern GXS_SetGraphicsMode
.extern GX_SetGraphicsMode
.extern data_020f4e14
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_ApplyScreenMode
.extern GamePhaseState_SetEnabled
.extern GamePhaseAreaScene_SetEnabled
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GraphicsSpriteRenderer_ConfigureTextGridPriority
.extern GraphicsBankStateSnapshot_Restore
.extern func_ov032_021fde1c
.extern gDebugFont

    .global Overlay032Scene_ShutdownGraphics
Overlay032Scene_ShutdownGraphics:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0xf2c]
    ldr r0, [r4, #0xb50]
    bl func_ov032_021fde1c
    add r0, r4, #0x3e8
    add r0, r0, #0x800
    bl GraphicsBankStateSnapshot_Restore
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
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fdf28
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fdf24
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, L_021fdf28
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
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
    bl GamePhaseRuntime_ApplyScreenMode
    ldr r0, L_021fdf2c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_SetEnabled
    ldmia sp!, {r4, pc}
L_021fdf20: .word 0x4001000
L_021fdf24: .word data_020f4e14
L_021fdf28: .word gDebugFont
L_021fdf2c: .word gGamePhaseRuntime
.size Overlay032Scene_ShutdownGraphics, .-Overlay032Scene_ShutdownGraphics

