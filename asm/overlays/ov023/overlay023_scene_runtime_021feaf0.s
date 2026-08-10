.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern data_020f4e14
.extern data_ov023_021ffb28
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_02095928
.extern func_ov023_021fd9d0
.extern func_ov023_021fe77c
.extern gDebugFont


    .global func_ov023_021feaf0
func_ov023_021feaf0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne L_021feb44
    ldr r0, L_021feb54
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021feb58
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, r4, #0x17c
    bl func_02095928
    ldr r0, [r4, #0x20]
    ldr r1, L_021feb5c
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
L_021feb44:
    mov r0, r4
    bl func_ov023_021fe77c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021feb54: .word data_020f4e14
L_021feb58: .word gDebugFont
L_021feb5c: .word data_ov023_021ffb28
.size func_ov023_021feaf0, .-func_ov023_021feaf0

