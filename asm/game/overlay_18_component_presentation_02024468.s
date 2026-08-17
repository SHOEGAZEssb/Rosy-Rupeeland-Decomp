; Matching retail form; see src/game/overlay_18_component_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d6984
.extern gOverlay18ComponentAllocationTag
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern TimedSpritePresentation_InitBase
.extern func_ov094_0221991c
.extern gHeapContext

    .global func_02024468
    .type func_02024468, @function
func_02024468: ; 0x02024468
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_InitBase
    ldr r1, .L_020244bc
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    ldr r1, .L_020244c0
    add r0, r4, #0xc
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_020244c4
    mov r0, #0x18
    mov r2, #0x4
    ldr r3, .L_020244c8
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020244b0
    bl func_ov094_0221991c
.L_020244b0:
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020244bc: .word data_020d6984
.L_020244c0: .word 0x5e
.L_020244c4: .word gOverlay18ComponentAllocationTag
.L_020244c8: .word gHeapContext
    .size func_02024468, . - func_02024468
