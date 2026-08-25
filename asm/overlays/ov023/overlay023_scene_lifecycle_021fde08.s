.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_lifecycle.c. */
.extern __destroy_arr
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov023_021ffbc4
.extern GraphicsArchive_ReleasePaletteResource
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern TitleScreenResourceCollection_Destroy
.extern TitleCharacterResourceCollection_Destroy
.extern func_ov023_021fcfcc
.extern func_ov023_021fd5d0
.extern func_ov023_021fd9b4
.extern gDebugFont
.extern Heap_Free


    .global func_ov023_021fde08
func_ov023_021fde08:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fdf58
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_021fde3c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fde3c:
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_021fde54
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fde54:
    ldr r0, [r4, #0x4bc]
    cmp r0, #0x0
    beq L_021fde6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fde6c:
    ldr r0, [r4, #0x4b8]
    cmp r0, #0x0
    beq L_021fde84
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fde84:
    ldr r5, [r4, #0x390]
    cmp r5, #0x0
    beq L_021fdea0
    mov r0, r5
    bl func_ov023_021fcfcc
    mov r0, r5
    bl Heap_Free
L_021fdea0:
    mov r5, #0x0
L_021fdea4:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0x430]
    cmp r6, #0x0
    beq L_021fdec4
    mov r0, r6
    bl func_ov023_021fd5d0
    mov r0, r6
    bl Heap_Free
L_021fdec4:
    add r5, r5, #0x1
    cmp r5, #0x12
    blt L_021fdea4
    ldr r0, [r4, #0xc8]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fdf5c
    ldr r1, [r4, #0x4c0]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleasePaletteResource
    ldr r0, L_021fdf60
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fdf64
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fdf68
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x228
    mov r1, #0x2
    mov r2, #0xac
    ldr r3, L_021fdf6c
    bl __destroy_arr
    add r0, r4, #0x17c
    bl func_ov023_021fd9b4
    add r0, r4, #0xd0
    bl func_ov023_021fd9b4
    add r0, r4, #0xbc
    bl AnimationResourceState_Destroy
    add r0, r4, #0x78
    bl TitleScreenResourceCollection_Destroy
    add r0, r4, #0x54
    bl TitleCharacterResourceCollection_Destroy
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fdf58: .word data_ov023_021ffbc4
L_021fdf5c: .word data_020f4e18
L_021fdf60: .word 0x4000050
L_021fdf64: .word data_020f4e14
L_021fdf68: .word gDebugFont
L_021fdf6c: .word func_ov023_021fd9b4
.size func_ov023_021fde08, .-func_ov023_021fde08

