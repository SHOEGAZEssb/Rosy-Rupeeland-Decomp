.text
.extern GraphicsResourceSet_Destroy
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern Heap_Free
.extern __destroy_arr
.extern data_020f4e14
.extern data_ov058_0220fcc4
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern func_0201e28c
.extern func_02071eb8
.extern func_0207419c
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern GraphicsSpriteRenderer_ConfigureTextGridPriority
.extern func_020927b8
.extern gDebugFont

.global func_ov058_0220ea68
func_ov058_0220ea68:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220eb40
    mov r4, r0
    ldr r0, .L_0220eb44
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, .L_0220eb48
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, .L_0220eb44
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, .L_0220eb48
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r5, [r4, #0x14]
    cmp r5, #0x0
    beq .L_0220eadc
    add r0, r5, #0xc
    bl func_02071eb8
    mov r0, r5
    bl func_02071eb8
    mov r0, r5
    bl Heap_Free
.L_0220eadc:
    ldr r5, [r4, #0x80]
    cmp r5, #0x0
    beq .L_0220eaf8
    ldr r0, [r5, #0x0]
    bl Heap_Free
    mov r0, r5
    bl Heap_Free
.L_0220eaf8:
    ldr r0, [r4, #0xc]
    bl func_0207419c
    ldr r0, [r4, #0x10]
    bl func_0207419c
    bl OverlayManager_GetGlobal
    mov r1, #0x1
    bl OverlayManager_UnloadOverlay
    add r0, r4, #0x84
    bl func_020927b8
    add r0, r4, #0x18
    mov r1, #0x4
    mov r2, #0xc
    ldr r3, .L_0220eb4c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0220eb40: .word data_ov058_0220fcc4
.L_0220eb44: .word data_020f4e14
.L_0220eb48: .word gDebugFont
.L_0220eb4c: .word GraphicsResourceSet_Destroy
.size func_ov058_0220ea68, . - func_ov058_0220ea68
