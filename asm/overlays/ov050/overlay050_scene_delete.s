.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_recovery.c.
.extern Heap_Free
.extern data_020f4e14
.extern data_ov050_0220e3c0
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Destroy
.extern func_0201e28c
.extern func_02071eb8
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern func_ov050_0220d8f4
.extern gDebugFont

.global func_ov050_0220dd50
func_ov050_0220dd50:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_0220dde4
    mov r6, r0
    str r1, [r6, #0x0]
    mov r4, #0x0
.L_0220dd64:
    add r0, r6, r4, lsl #0x2
    ldr r5, [r0, #0x1c]
    cmp r5, #0x0
    beq .L_0220dd84
    mov r0, r5
    bl func_ov050_0220d8f4
    mov r0, r5
    bl Heap_Free
.L_0220dd84:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_0220dd64
    ldr r0, .L_0220dde8
    ldr r1, [r6, #0x14]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, .L_0220ddec
    ldr r1, [r6, #0x18]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    bl OverlayManager_GetGlobal
    mov r1, #0x0
    bl OverlayManager_UnloadOverlay
    add r0, r6, #0x30
    bl VecFx32Object_Destroy
    add r0, r6, #0x8
    bl func_02071eb8
    mov r0, r6
    bl func_0201e28c
    mov r0, r6
    bl Heap_Free
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_0220dde4: .word data_ov050_0220e3c0
.L_0220dde8: .word data_020f4e14
.L_0220ddec: .word gDebugFont
.size func_ov050_0220dd50, . - func_ov050_0220dd50
