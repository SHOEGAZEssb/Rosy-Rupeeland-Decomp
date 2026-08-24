; Matching retail form; see src/game/actor_runtime_grid_canvas_init.c for
; the documented portable implementation and recovered behavior.
.text
.extern GXS_SetGraphicsMode
.extern GX_SetBankForSubBG
.extern func_020afd28
.extern func_020afaec
.extern SoftwareCanvas_InitWithBuffer
.extern SoftwareCanvas_Destroy
.extern SoftwareCanvas_DrawRect
.extern DebugPhaseGridCanvas_DrawGrid
.global DebugPhaseGridCanvas_SetupSubBg2
DebugPhaseGridCanvas_SetupSubBg2:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    mov r0, #0x5
    bl GXS_SetGraphicsMode
    mov r0, #0x4
    bl GX_SetBankForSubBG
    ldr r1, L_0200c008
    mov r2, #0x0
    ldrh r0, [r1, #0x0]
    sub lr, r1, #0xc
    mov r3, #0x1000
    and r0, r0, #0x43
    orr r0, r0, #0x84
    orr r0, r0, #0x4000
    strh r0, [r1, #0x0]
    ldr ip, [lr, #0x0]
    add r0, r1, #0x14
    bic ip, ip, #0x1f00
    orr ip, ip, #0x1400
    str ip, [lr, #0x0]
    str r3, [sp, #0x1c]
    str r3, [sp, #0x28]
    str r2, [sp, #0x20]
    str r2, [sp, #0x24]
    str r2, [sp, #0x0]
    add r1, sp, #0x1c
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    bl func_020afaec
    mov r3, #0x100
    mov r2, r0
    str r3, [sp, #0x0]
    add r0, sp, #0x8
    mov r1, #0x0
    bl SoftwareCanvas_InitWithBuffer
    ldr r1, [sp, #0xc]
    add r0, sp, #0x8
    str r1, [r4, #0x4]
    ldr r1, [sp, #0x10]
    str r1, [r4, #0x8]
    ldr r1, [sp, #0x14]
    str r1, [r4, #0xc]
    ldr r1, [sp, #0x18]
    str r1, [r4, #0x10]
    bl SoftwareCanvas_Destroy
    mov r3, #0x100
    mov r1, #0x0
    str r3, [sp, #0x0]
    mov r0, r4
    mov r2, r1
    str r1, [sp, #0x4]
    bl SoftwareCanvas_DrawRect
    mov r0, r4
    bl DebugPhaseGridCanvas_DrawGrid
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
L_0200c008: .word 0x400100c
.size DebugPhaseGridCanvas_SetupSubBg2, . - DebugPhaseGridCanvas_SetupSubBg2
