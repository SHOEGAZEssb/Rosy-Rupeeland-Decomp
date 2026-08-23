; Matching retail form; see src/game/overlay_2c_component_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d695c
.extern gOverlay2cComponentAllocationTag
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern FieldEffect_Init
.extern func_ov094_02217c74
.extern gHeapContext

    .global func_02023fa0
    .type func_02023fa0, @function
func_02023fa0: ; 0x02023fa0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_Init
    ldr r1, .L_02023ff4
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    ldr r1, .L_02023ff8
    add r0, r4, #0xc
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_02023ffc
    mov r0, #0x2c
    mov r2, #0x4
    ldr r3, .L_02024000
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02023fe8
    bl func_ov094_02217c74
.L_02023fe8:
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02023ff4: .word data_020d695c
.L_02023ff8: .word 0x5e
.L_02023ffc: .word gOverlay2cComponentAllocationTag
.L_02024000: .word gHeapContext
    .size func_02023fa0, . - func_02023fa0
