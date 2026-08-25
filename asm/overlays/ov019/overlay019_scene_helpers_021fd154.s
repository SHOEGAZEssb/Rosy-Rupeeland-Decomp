    .text
/* Exact fallback; see src/overlays/ov019/overlay019_scene_helpers.c. */
    .extern gGamePhaseRuntime
    .extern GamePhaseRuntime_UpdateActorPresentationState
    .extern GamePhaseCurrencyHud_Update
    .extern func_ov002_021fba00
    .extern gGamePhaseCurrencyHud

.global Overlay019_SetLcdRouting
.global func_ov019_021fd170
Overlay019_SetLcdRouting:
    ldr r2, L_021fd16c
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
L_021fd16c: .word 0x4000304
    .size Overlay019_SetLcdRouting, . - Overlay019_SetLcdRouting
func_ov019_021fd170:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq L_021fd198
    ldr r0, L_021fd1b0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    b L_021fd1a4
L_021fd198:
    ldr r0, L_021fd1b4
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
L_021fd1a4:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fba00
    ldmia sp!, {r4, pc}
L_021fd1b0: .word gGamePhaseRuntime
L_021fd1b4: .word gGamePhaseCurrencyHud
    .size func_ov019_021fd170, . - func_ov019_021fd170
