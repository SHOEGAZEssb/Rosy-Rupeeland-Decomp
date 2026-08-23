; Matching retail form; see src/graphics/scene_display_resource_setup.c.
.text
.extern GameWork_ClearFlag
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020d6418
.extern data_020f4e18
.extern data_021055dc
.extern MainBg1_SetControl
.extern SubBg2_SetControl
.extern func_02070638
.extern func_020706c4
.extern func_02070b50
.extern func_02070bc4
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsBgMapResource_UploadToSubBg
.extern func_020923a4
.extern func_020af1f8
.extern func_020b44e8
.extern gGameWork

.global SceneDisplayResources_Setup
    .type SceneDisplayResources_Setup, @function
SceneDisplayResources_Setup: ; 0x02021350
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    ldr r1, .L_02021580
    mov r5, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02021584
    bl GameWork_ClearFlag
    cmp r5, #0xd
    bne .L_020213f8
    ldr r0, .L_02021588
    bl func_020923a4
    mov r0, #0x40
    bl func_020af1f8
    mov r3, #0x4000000
    ldr r1, [r3, #0x0]
    ldr r0, [r3, #0x0]
    and r1, r1, #0x1f00
    mov r2, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r2, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r3, #0x0]
    ldrh r2, [r3, #0x8]
    mov r0, #0x1
    mov r1, r0
    and r2, r2, #0x43
    orr r2, r2, #0x890
    orr r2, r2, #0x7000
    strh r2, [r3, #0x8]
    mov r2, #0x1a
    mov r3, #0x4
    str r0, [sp, #0x0]
    bl MainBg1_SetControl
    ldr r1, .L_0202158c
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    b .L_02021468
.L_020213f8:
    ldr ip, .L_02021590
    mov r0, #0x1
    ldr r2, [ip, #0x0]
    ldr r1, [ip, #0x0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0xc
    orr r4, r2, r1, lsl #0x8
    mov r1, r0
    mov r2, #0x18
    mov r3, #0x4
    str r4, [ip, #0x0]
    bl SubBg2_SetControl
    ldr r2, .L_02021594
    ldrh r0, [r2, #0x0]
    sub r1, r2, #0x2
    and r0, r0, #0x43
    orr r0, r0, #0xa90
    orr r0, r0, #0x5000
    strh r0, [r2, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    strh r0, [r1, #0x0]
    ldrh r0, [r2, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r2, #0x0]
.L_02021468:
    add r0, sp, #0x10
    bl GraphicsResourceSet_Init
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    mov r0, #0xc
    mul r3, r5, r0
    ldr ip, .L_02021598
    ldr r1, .L_0202159c
    add r4, ip, r3
    ldrh r2, [r4, #0x4]
    add r0, sp, #0x10
    str r2, [sp, #0x0]
    ldrh r2, [ip, r3]
    ldrh r3, [r4, #0x2]
    ldr r1, [r1, #0x0]
    bl GraphicsResourceSet_Load
    ldrh r2, [r4, #0xa]
    ldr r1, .L_0202159c
    add r0, sp, #0x4
    str r2, [sp, #0x0]
    ldrh r2, [r4, #0x6]
    ldrh r3, [r4, #0x8]
    ldr r1, [r1, #0x0]
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    cmp r5, #0xd
    bne .L_02021520
    mov r1, #0x0
    ldr r0, [sp, #0x10]
    mov r2, r1
    bl func_02070638
    ldr r0, [sp, #0x14]
    mov r1, #0x4000
    bl func_02070b50
    ldr r0, [sp, #0x14]
    mov r1, #0x6000
    bl func_02070b50
    mov r1, #0x0
    ldr r0, [sp, #0x18]
    mov r2, r1
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    b .L_02021568
.L_02021520:
    ldr r0, [sp, #0x10]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x14]
    mov r1, #0x4000
    bl func_02070bc4
    ldr r0, [sp, #0x14]
    mov r1, #0x6000
    bl func_02070bc4
    ldr r0, [sp, #0x18]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
.L_02021568:
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add r0, sp, #0x10
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
.L_02021580: .word gGameWork
.L_02021584: .word 0x38e
.L_02021588: .word data_021055dc
.L_0202158c: .word 0x4000008
.L_02021590: .word 0x4001000
.L_02021594: .word 0x400100e
.L_02021598: .word data_020d6418
.L_0202159c: .word data_020f4e18
    .size SceneDisplayResources_Setup, .-SceneDisplayResources_Setup

