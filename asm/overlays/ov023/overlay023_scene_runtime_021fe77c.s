.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern InventoryScroll_UpdatePresentation
.extern SpriteMotionController_Update
.extern func_ov045_0220c18c


    .global func_ov023_021fe77c
func_ov023_021fe77c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x17c
    bl SpriteMotionController_Update
    add r0, r5, #0xd0
    bl SpriteMotionController_Update
    add r0, r5, #0x228
    bl SpriteMotionController_Update
    add r0, r5, #0x2d4
    bl SpriteMotionController_Update
    ldr r0, [r5, #0x4bc]
    cmp r0, #0x0
    beq L_021fe7b4
    bl func_ov045_0220c18c
L_021fe7b4:
    ldr r0, [r5, #0x390]
    cmp r0, #0x0
    beq L_021fe7c8
    ldr r0, [r0, #0x38]
    bl InventoryScroll_UpdatePresentation
L_021fe7c8:
    ldr r0, [r5, #0x478]
    cmp r0, #0x0
    beq L_021fe7dc
    ldr r0, [r0, #0x48]
    bl InventoryScroll_UpdatePresentation
L_021fe7dc:
    mov r4, #0x0
L_021fe7e0:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x380]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r4, r4, #0x1
    cmp r4, #0x2
    blt L_021fe7e0
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov023_021fe77c, .-func_ov023_021fe77c

