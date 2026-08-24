.text

/* Exact fallback; see src/overlays/ov033/overlay033_sprite_group.c for documented portable C. */

    .extern Presentation_Init
    .extern __construct_array
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_Destroy
    .extern func_02071ee0
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern gGamePhaseRuntime
    .extern data_020f4e18
    .extern data_ov033_021fdda8
    .extern data_ov033_021fde9c

    .global func_ov033_021fce00
func_ov033_021fce00:
    bx lr
.size func_ov033_021fce00, .-func_ov033_021fce00

    .global func_ov033_021fce04
func_ov033_021fce04:
    add r0, r0, r1, lsl #0x2
    ldr r1, [r0, #0x108]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    bx lr
.size func_ov033_021fce04, .-func_ov033_021fce04

    .global func_ov033_021fce1c
func_ov033_021fce1c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r5, r1
    bl Presentation_Init
    ldr r0, L_021fcf74
    ldr r4, L_021fcf78
    str r0, [r6, #0x0]
    ldr r3, L_021fcf7c
    add r0, r6, #0x9c
    mov r1, #0x9
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    mov r4, #0x0
    str r4, [r6, #0x12c]
    ldr r0, L_021fcf80
    str r4, [r6, #0x130]
    ldr r0, [r0, #0x0]
    ldr r7, L_021fcf84
    add r0, r0, #0x2000
    ldr r9, [r0, #0xea8]
    ldr r11, L_021fcf88
    add r8, r6, #0x9c
L_021fce7c:
    cmp r4, #0x8
    bne L_021fceb8
    cmp r9, #0x0
    beq L_021fceb8
    ldr r3, [r9, #0x29c]
    mov r0, #0xc
    mul r10, r4, r0
    ldrh r1, [r3, #0x18]
    add r0, r8, r10
    str r1, [sp, #0x0]
    ldrh r2, [r3, #0x14]
    ldrh r3, [r3, #0x16]
    ldr r1, [r11, #0x0]
    bl func_02071ee0
    b L_021fcee8
L_021fceb8:
    mov r0, #0x18
    mul r3, r4, r0
    add r1, r7, r3
    mov r0, #0xc
    mul r10, r4, r0
    ldrh r2, [r1, #0x4]
    add r0, r8, r10
    str r2, [sp, #0x0]
    ldrh r2, [r7, r3]
    ldrh r3, [r1, #0x2]
    ldr r1, [r11, #0x0]
    bl func_02071ee0
L_021fcee8:
    mov r0, #0x18
    add r1, r8, r10
    mla r10, r4, r0, r7
    ldr r2, [r10, #0x14]
    mov r0, r5
    and r2, r2, #0xff
    bl GraphicsSpriteGroup_CreateStateFromSource
    add r1, r6, r4, lsl #0x2
    str r0, [r1, #0x108]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x8]
    str r0, [sp, #0x4]
    mov r0, #0x42
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x108]
    ldrh r1, [r10, #0x6]
    ldr r2, [r10, #0xc]
    ldr r3, [r10, #0x10]
    bl GraphicsSpriteState_ApplyRenderConfig
    add r4, r4, #0x1
    cmp r4, #0x9
    blt L_021fce7c
    mov r1, #0x1000
    ldr r0, [r6, #0x124]
    rsb r1, r1, #0x0
    strh r1, [r0, #0x30]
    cmp r9, #0x0
    ldreq r1, [r6, #0x128]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fcf74: .word data_ov033_021fde9c
L_021fcf78: .word AnimationResourceState_Destroy
L_021fcf7c: .word AnimationResourceState_InitEmbedded
L_021fcf80: .word gGamePhaseRuntime
L_021fcf84: .word data_ov033_021fdda8
L_021fcf88: .word data_020f4e18
.size func_ov033_021fce1c, .-func_ov033_021fce1c
