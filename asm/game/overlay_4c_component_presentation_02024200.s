; Matching retail form; see src/game/overlay_4c_component_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d690c
.extern gOverlay4cComponentAllocationTag
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern FieldEffect_Init
.extern func_ov094_02218f14
.extern gHeapContext

    .global Overlay4cComponentPresentation_Init
    .type Overlay4cComponentPresentation_Init, @function
Overlay4cComponentPresentation_Init: ; 0x02024200
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_Init
    ldr r1, .L_02024254
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    ldr r1, .L_02024258
    add r0, r4, #0xc
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0202425c
    mov r0, #0x4c
    mov r2, #0x4
    ldr r3, .L_02024260
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02024248
    bl func_ov094_02218f14
.L_02024248:
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02024254: .word data_020d690c
.L_02024258: .word 0x5e
.L_0202425c: .word gOverlay4cComponentAllocationTag
.L_02024260: .word gHeapContext
    .size Overlay4cComponentPresentation_Init, . - Overlay4cComponentPresentation_Init
