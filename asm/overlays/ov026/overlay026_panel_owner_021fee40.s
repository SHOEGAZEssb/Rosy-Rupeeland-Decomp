.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_owner.c. */
.extern data_020f4e18
.extern data_ov026_0220497c
.extern GraphicsArchive_ReleaseOwlvResource
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_021fee40
func_ov026_021fee40:
    stmdb sp!, {r4, lr}
    ldr r1, L_021feec0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, L_021feec4
    ldr r1, [r4, #0x9c]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseOwlvResource
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fee78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fee78:
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    beq L_021fee90
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fee90:
    ldr r0, [r4, #0xa8]
    cmp r0, #0x0
    beq L_021feea8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feea8:
    mov r0, r4
    bl func_ov026_021fce50
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021feec0: .word data_ov026_0220497c
L_021feec4: .word data_020f4e18
.size func_ov026_021fee40, .-func_ov026_021fee40

