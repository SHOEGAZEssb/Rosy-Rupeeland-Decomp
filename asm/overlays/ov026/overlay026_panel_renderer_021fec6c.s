.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_renderer.c. */
.extern data_020f4e18
.extern data_ov026_0220497c
.extern data_ov026_02204a50
.extern GraphicsArchive_AcquireOwlvResource
.extern PresentationScalar_SetImmediate
.extern Presentation_Init
.extern Presentation_SetPosition
.extern func_ov026_021fce54
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021fec6c
func_ov026_021fec6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Presentation_Init
    ldr r1, L_021fed8c
    ldr r0, L_021fed90
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x5000
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r4, #0x9c]
    ldr r1, L_021fed94
    ldr r3, L_021fed98
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fecc0
    ldr r1, [r4, #0x9c]
    ldr r3, L_021fed9c
    mov r2, #0x4
    bl func_ov026_021fce54
L_021fecc0:
    mov r1, #0x0
    str r0, [r4, #0xa0]
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    ldr r0, [r4, #0xa0]
    ldr r1, L_021feda0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, L_021fed94
    ldr r3, L_021fed98
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fed10
    ldr r1, [r4, #0x9c]
    ldr r3, L_021fed9c
    mov r2, #0x5
    bl func_ov026_021fce54
L_021fed10:
    mov r1, #0x0
    str r0, [r4, #0xa4]
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    ldr r0, [r4, #0xa4]
    ldr r1, L_021feda0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r1, L_021fed94
    ldr r3, L_021fed98
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fed60
    ldr r1, [r4, #0x9c]
    ldr r3, L_021fed9c
    mov r2, #0x6
    bl func_ov026_021fce54
L_021fed60:
    mov r1, #0x0
    str r0, [r4, #0xa8]
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    ldr r0, [r4, #0xa8]
    ldr r1, L_021feda0
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fed8c: .word data_ov026_0220497c
L_021fed90: .word data_020f4e18
L_021fed94: .word data_ov026_02204a50
L_021fed98: .word gHeapContext
L_021fed9c: .word 0x7fff
L_021feda0: .word 0x666
.size func_ov026_021fec6c, .-func_ov026_021fec6c

