; Matching retail form; see src/game/overlay_prompt_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d653c
.extern data_020d65ac
.extern DisplayBrightness_IsSubTransitionComplete
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern GamePhaseCurrencyHud_SetVisible
.extern func_0201e250
.extern func_0201e28c
.extern func_020755bc
.extern func_02091fb0
.extern func_02092c8c
.extern func_ov001_021fbe6c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext

.global func_020222dc
    .type func_020222dc, @function
func_020222dc: ; 0x020222dc
    stmdb sp!, {r4, lr}
    ldr r1, .L_0202234c
    mov r4, r0
    str r1, [r4, #0x0]
    mov r0, #0x0
    str r0, [r4, #0x20]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02022318
    beq .L_02022310
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02022310:
    add r0, r4, #0x10
    bl OverlaySlot_UnloadOverlay
.L_02022318:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_02022334
    ldr r0, .L_02022350
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
.L_02022334:
    add r0, r4, #0x10
    bl OverlaySlot_Destroy
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202234c: .word data_020d653c
.L_02022350: .word gLupyContext
    .size func_020222dc, .-func_020222dc

