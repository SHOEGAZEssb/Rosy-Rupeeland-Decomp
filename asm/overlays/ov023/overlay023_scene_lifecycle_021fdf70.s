.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_lifecycle.c. */
.extern __destroy_arr
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov023_021ffbc4
.extern func_02071c38
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_020926f8
.extern func_020927b8
.extern func_ov023_021fcfcc
.extern func_ov023_021fd5d0
.extern func_ov023_021fd9b4
.extern gDebugFont
.extern Heap_Free


    .global func_ov023_021fdf70
func_ov023_021fdf70:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fe0c8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_021fdfa4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdfa4:
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_021fdfbc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdfbc:
    ldr r0, [r4, #0x4bc]
    cmp r0, #0x0
    beq L_021fdfd4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdfd4:
    ldr r0, [r4, #0x4b8]
    cmp r0, #0x0
    beq L_021fdfec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdfec:
    ldr r5, [r4, #0x390]
    cmp r5, #0x0
    beq L_021fe008
    mov r0, r5
    bl func_ov023_021fcfcc
    mov r0, r5
    bl Heap_Free
L_021fe008:
    mov r5, #0x0
L_021fe00c:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0x430]
    cmp r6, #0x0
    beq L_021fe02c
    mov r0, r6
    bl func_ov023_021fd5d0
    mov r0, r6
    bl Heap_Free
L_021fe02c:
    add r5, r5, #0x1
    cmp r5, #0x12
    blt L_021fe00c
    ldr r0, [r4, #0xc8]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fe0cc
    ldr r1, [r4, #0x4c0]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fe0d0
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fe0d4
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fe0d8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x228
    mov r1, #0x2
    mov r2, #0xac
    ldr r3, L_021fe0dc
    bl __destroy_arr
    add r0, r4, #0x17c
    bl func_ov023_021fd9b4
    add r0, r4, #0xd0
    bl func_ov023_021fd9b4
    add r0, r4, #0xbc
    bl AnimationResourceState_Destroy
    add r0, r4, #0x78
    bl func_020926f8
    add r0, r4, #0x54
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fe0c8: .word data_ov023_021ffbc4
L_021fe0cc: .word data_020f4e18
L_021fe0d0: .word 0x4000050
L_021fe0d4: .word data_020f4e14
L_021fe0d8: .word gDebugFont
L_021fe0dc: .word func_ov023_021fd9b4
.size func_ov023_021fdf70, .-func_ov023_021fdf70

