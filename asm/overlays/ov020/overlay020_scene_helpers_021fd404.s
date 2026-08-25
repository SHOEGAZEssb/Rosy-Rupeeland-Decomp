    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern TitleCharacterResourceCollection_Destroy

.global Overlay020_DetailPanel_Deinit
Overlay020_DetailPanel_Deinit:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq L_021fd424
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd424:
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x28
    bl TitleCharacterResourceCollection_Destroy
    add r0, r4, #0x1c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x10
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size Overlay020_DetailPanel_Deinit, . - Overlay020_DetailPanel_Deinit
