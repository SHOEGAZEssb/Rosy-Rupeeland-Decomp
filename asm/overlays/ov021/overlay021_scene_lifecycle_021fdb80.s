    .text
/* Exact fallback; see src/overlays/ov021/overlay021_scene_lifecycle.c. */
    .extern __destroy_arr
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov021_02202f64
    .extern OverlaySlot_Destroy
    .extern GraphicsArchive_ReleasePaletteResource
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern GraphicsSpriteRenderer_QueuePaletteUploads
    .extern func_020927b8
    .extern func_ov002_021fb9c4
    .extern func_ov021_021fd074
    .extern func_ov021_021fd790
    .extern func_ov045_0220b8cc
    .extern func_ov045_0220d2d8
    .extern gDebugFont
    .extern Heap_Free

.global func_ov021_021fdb80
func_ov021_021fdb80:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fdd1c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    mvn r1, #0x0
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x2d0]
    cmp r0, r1
    beq L_021fdbb0
    bl func_ov045_0220d2d8
L_021fdbb0:
    ldr r5, [r4, #0x3ec]
    cmp r5, #0x0
    beq L_021fdbcc
    mov r0, r5
    bl func_ov045_0220b8cc
    mov r0, r5
    bl Heap_Free
L_021fdbcc:
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_021fdbe4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdbe4:
    ldr r0, [r4, #0x358]
    cmp r0, #0x0
    beq L_021fdbfc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdbfc:
    ldr r5, [r4, #0x390]
    cmp r5, #0x0
    beq L_021fdc18
    mov r0, r5
    bl func_ov002_021fb9c4
    mov r0, r5
    bl Heap_Free
L_021fdc18:
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_021fdc30
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdc30:
    ldr r0, [r4, #0x38c]
    cmp r0, #0x0
    beq L_021fdc48
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdc48:
    ldr r0, [r4, #0x388]
    cmp r0, #0x0
    beq L_021fdc60
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdc60:
    mov r5, #0x0
L_021fdc64:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0x2a4]
    cmp r6, #0x0
    beq L_021fdc84
    mov r0, r6
    bl func_ov021_021fd074
    mov r0, r6
    bl Heap_Free
L_021fdc84:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt L_021fdc64
    ldr r0, [r4, #0x94]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fdd20
    ldr r1, [r4, #0x400]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleasePaletteResource
    ldr r0, L_021fdd24
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fdd28
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fdd2c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x1c
    add r0, r0, #0x400
    bl OverlaySlot_Destroy
    add r0, r4, #0x14c
    mov r1, #0x2
    mov r2, #0xac
    ldr r3, L_021fdd30
    bl __destroy_arr
    add r0, r4, #0xa0
    bl func_ov021_021fd790
    add r0, r4, #0x88
    bl AnimationResourceState_Destroy
    add r0, r4, #0x7c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x58
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fdd1c: .word data_ov021_02202f64
L_021fdd20: .word data_020f4e18
L_021fdd24: .word 0x4000050
L_021fdd28: .word data_020f4e14
L_021fdd2c: .word gDebugFont
L_021fdd30: .word func_ov021_021fd790
.size func_ov021_021fdb80, . - func_ov021_021fdb80
