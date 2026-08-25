    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern InventoryScroll_UpdatePresentation
    .extern SpriteMotionController_Update
    .extern Overlay020_DetailPanel_RenderSelection

.global Overlay020_UpdateSceneUi
.global func_ov020_021fde9c
.global func_ov020_021fdee0
Overlay020_UpdateSceneUi:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x70
    bl SpriteMotionController_Update
    ldr r0, [r4, #0x1dc]
    cmp r0, #0x0
    beq L_021fde90
    ldr r0, [r0, #0x44]
    bl InventoryScroll_UpdatePresentation
L_021fde90:
    ldr r0, [r4, #0x6c]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
    .size Overlay020_UpdateSceneUi, . - Overlay020_UpdateSceneUi
func_ov020_021fde9c:
    ldr ip, [r0, #0x11c]
    mov r1, #0x18
    ldrh r3, [ip, #0x24]
    mov r2, #0x84
    bic r3, r3, #0x4
    strh r3, [ip, #0x24]
    ldr ip, [r0, #0x1dc]
    ldr r3, [r0, #0x11c]
    ldr r0, [ip, #0x44]
    ldr ip, [r0, #0xc]
    ldr r0, [r0, #0x14]
    sub r0, r0, ip
    mul r1, r0, r1
    strh r2, [r3, #0x2c]
    add r0, r1, #0x1e
    strh r0, [r3, #0x2e]
    bx lr
    .size func_ov020_021fde9c, . - func_ov020_021fde9c
func_ov020_021fdee0:
    mov r2, r0
    ldr r1, [r2, #0x1dc]
    ldr ip, L_021fdf04
    ldr r1, [r1, #0x44]
    ldr r0, [r2, #0x1e0]
    ldr r1, [r1, #0x14]
    add r1, r2, r1, lsl #0x2
    ldr r1, [r1, #0x124]
    bx ip
L_021fdf04: .word Overlay020_DetailPanel_RenderSelection
    .size func_ov020_021fdee0, . - func_ov020_021fdee0
