; Matching retail form; see src/game/debug_phase_selector_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern Scene_Init
.extern ActorRuntimeGridCanvas_Init
.extern GXx_SetMasterBrightness_
.extern GX_SetGraphicsMode
.extern ActorRuntimeGridCanvas_SetupSubBg2
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern GameWork_Reset
.extern NdsDisplay_SetScreenSwap
.extern data_020d52c8
.global DebugPhaseSelector_Init
DebugPhaseSelector_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Scene_Init
    ldr r1, L_0200c2ec
    mov r0, #0x0
    str r1, [r4, #0x0]
    str r0, [r4, #0x24]
    sub r1, r0, #0x1
    add r0, r4, #0x34
    str r1, [r4, #0x28]
    bl ActorRuntimeGridCanvas_Init
    ldr r0, L_0200c2f0
    mvn r1, #0xf
    bl GXx_SetMasterBrightness_
    ldr r0, L_0200c2f4
    mvn r1, #0xf
    bl GXx_SetMasterBrightness_
    mov r1, #0x0
    mov r0, #0x1
    mov r2, r1
    bl GX_SetGraphicsMode
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    str r0, [r4, #0x2c]
    str r0, [r4, #0x30]
    add r0, r4, #0x34
    bl ActorRuntimeGridCanvas_SetupSubBg2
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    bl GameWork_Reset
    mov r0, #0x1
    bl NdsDisplay_SetScreenSwap
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200c2ec: .word data_020d52c8
L_0200c2f0: .word 0x400006c
L_0200c2f4: .word 0x400106c
.size DebugPhaseSelector_Init, . - DebugPhaseSelector_Init

