.text
.extern func_0207419c
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern OverlaySlot_Destroy
.extern func_ov043_0220b740
.extern func_02071eb8
.extern func_020927b8
.extern Heap_Free
.extern data_ov043_0220c4bc
.extern data_020f4e14
.extern gDebugFont

    .global func_ov043_0220b864
func_ov043_0220b864:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220b900
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x2f4]
    cmp r0, #0x0
    beq .L_0220b898
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220b898:
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    beq .L_0220b8a8
    bl func_0207419c
.L_0220b8a8:
    ldr r0, .L_0220b904
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, .L_0220b908
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x2e8
    bl OverlaySlot_Destroy
    add r0, r4, #0x2dc
    bl OverlaySlot_Destroy
    add r0, r4, #0x1e8
    bl func_ov043_0220b740
    add r0, r4, #0x13c
    bl func_ov043_0220b740
    add r0, r4, #0x90
    bl func_ov043_0220b740
    add r0, r4, #0x80
    bl func_02071eb8
    add r0, r4, #0x5c
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220b900: .word data_ov043_0220c4bc
.L_0220b904: .word data_020f4e14
.L_0220b908: .word gDebugFont
.size func_ov043_0220b864, . - func_ov043_0220b864

    .global func_ov043_0220b90c
func_ov043_0220b90c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220b9b0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x2f4]
    cmp r0, #0x0
    beq .L_0220b940
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220b940:
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    beq .L_0220b950
    bl func_0207419c
.L_0220b950:
    ldr r0, .L_0220b9b4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, .L_0220b9b8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x2e8
    bl OverlaySlot_Destroy
    add r0, r4, #0x2dc
    bl OverlaySlot_Destroy
    add r0, r4, #0x1e8
    bl func_ov043_0220b740
    add r0, r4, #0x13c
    bl func_ov043_0220b740
    add r0, r4, #0x90
    bl func_ov043_0220b740
    add r0, r4, #0x80
    bl func_02071eb8
    add r0, r4, #0x5c
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220b9b0: .word data_ov043_0220c4bc
.L_0220b9b4: .word data_020f4e14
.L_0220b9b8: .word gDebugFont
.size func_ov043_0220b90c, . - func_ov043_0220b90c

