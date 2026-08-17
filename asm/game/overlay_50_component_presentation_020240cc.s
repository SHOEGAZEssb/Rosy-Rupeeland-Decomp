; Matching retail form; see src/game/overlay_50_component_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d69ac
.extern gOverlay50ComponentAllocationTag
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern TimedSpritePresentation_InitBase
.extern func_ov094_022185e4
.extern gHeapContext

    .global func_020240cc
    .type func_020240cc, @function
func_020240cc: ; 0x020240cc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl TimedSpritePresentation_InitBase
    ldr r1, .L_02024128
    add r0, r5, #0xc
    str r1, [r5, #0x0]
    bl OverlaySlot_Init
    ldr r1, .L_0202412c
    add r0, r5, #0xc
    bl OverlaySlot_LoadOverlay
    mov r0, #0x50
    ldr r1, .L_02024130
    mov r2, #0x4
    ldr r3, .L_02024134
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202411c
    mov r1, r4
    bl func_ov094_022185e4
.L_0202411c:
    str r0, [r5, #0x8]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02024128: .word data_020d69ac
.L_0202412c: .word 0x5e
.L_02024130: .word gOverlay50ComponentAllocationTag
.L_02024134: .word gHeapContext
    .size func_020240cc, . - func_020240cc
