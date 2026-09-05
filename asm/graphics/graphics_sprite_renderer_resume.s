.text
; Matching fallback for the portable implementation in src/graphics/graphics_sprite_renderer.c.
.extern GX_VBlankIntr
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsCharacterResource_GetUploadSize
.extern GraphicsSpriteGraphicsResource_Prepare
.extern GraphicsSpriteRenderer_ConfigureObjectDisplay
.extern GraphicsSpriteResource_Prepare
.extern GraphicsTransferQueue_Enqueue
.extern gGraphicsSpriteStatePool

.global GraphicsSpriteRenderer_Resume
GraphicsSpriteRenderer_Resume:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r1, [r10, #0x30]
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    bl GraphicsSpriteRenderer_ConfigureObjectDisplay
    add r0, r10, #0x48
    add r6, r0, #0x400
    add r4, r10, #0x114
    mov r11, #0x1
    ldr r5, .L_02075234
    b .L_020750c4
.L_02075050:
    ldrb r0, [r6, #0xd]
    cmp r0, #0x1
    bne .L_020750b8
    ldr r7, [r6, #0x8]
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    bne .L_02075074
    mov r0, r7
    bl GraphicsSpriteGraphicsResource_Prepare
.L_02075074:
    mov r0, #0x0
    bl GX_VBlankIntr
    str r0, [r5, #0x4]
    strb r11, [r6, #0xc]
    ldrh r8, [r6, #0xe]
    ldr r9, [r7, #0x24]
    mov r0, r7
    bl GraphicsCharacterResource_GetUploadSize
    str r0, [sp, #0x0]
    mov r2, r9
    mov r3, r8, lsl #0x7
    add r0, r4, #0x1c00
    mov r1, #0x1
    bl GraphicsTransferQueue_Enqueue
    ldr r0, [r5, #0x4]
    bl GX_VBlankIntr
    b .L_020750c0
.L_020750b8:
    mov r0, #0x0
    strb r0, [r6, #0xc]
.L_020750c0:
    ldr r6, [r6, #0x4]
.L_020750c4:
    cmp r6, #0x0
    bne .L_02075050
    ldr r0, [r10, #0x43c]
    b .L_020750ec
.L_020750d4:
    ldr r1, [r0, #0xc]
    b .L_020750e0
.L_020750dc:
    ldr r1, [r1, #0x8]
.L_020750e0:
    cmp r1, #0x0
    bne .L_020750dc
    ldr r0, [r0, #0x8]
.L_020750ec:
    cmp r0, #0x0
    bne .L_020750d4
    ldr r6, [r10, #0xd10]
    add r4, r10, #0x114
    mov r11, #0x20
    ldr r5, .L_02075234
    b .L_02075180
.L_02075108:
    ldr r9, [r6, #0xc]
    ldr r0, [r9, #0x14]
    cmp r0, #0x0
    bne .L_02075120
    mov r0, r9
    bl GraphicsSpriteResource_Prepare
.L_02075120:
    mov r0, #0x0
    mov r7, r6
    bl GX_VBlankIntr
    mov r8, #0x0
    str r0, [r5, #0x4]
    b .L_02075164
.L_02075138:
    mov r0, r9
    bl GraphicsBgResourceData_GetDecoded
    str r11, [sp, #0x0]
    ldrb r3, [r7, #0x12]
    add r2, r0, r8, lsl #0x5
    add r0, r4, #0x1c00
    mov r1, #0x2
    mov r3, r3, lsl #0x5
    bl GraphicsTransferQueue_Enqueue
    ldr r7, [r7, #0x8]
    add r8, r8, #0x1
.L_02075164:
    ldr r0, [r9, #0x20]
    ldrh r0, [r0, #0x6]
    cmp r8, r0
    blt .L_02075138
    ldr r0, [r5, #0x4]
    bl GX_VBlankIntr
    ldr r6, [r6, #0x4]
.L_02075180:
    cmp r6, #0x0
    bne .L_02075108
    ldr r0, [r10, #0x34]
    cmp r0, #0x0
    beq .L_02075228
    ldr r9, [r10, #0xe60]
    add r4, r10, #0x114
    mov r11, #0x200
    ldr r5, .L_02075234
    b .L_02075220
.L_020751a8:
    ldr r8, [r9, #0xc]
    ldr r0, [r8, #0x14]
    cmp r0, #0x0
    bne .L_020751c0
    mov r0, r8
    bl GraphicsSpriteResource_Prepare
.L_020751c0:
    mov r0, #0x0
    mov r6, r9
    bl GX_VBlankIntr
    mov r7, #0x0
    str r0, [r5, #0x4]
    b .L_02075204
.L_020751d8:
    mov r0, r8
    bl GraphicsBgResourceData_GetDecoded
    str r11, [sp, #0x0]
    ldrb r3, [r6, #0x12]
    add r2, r0, r7, lsl #0x9
    add r0, r4, #0x1c00
    mov r1, #0x3
    mov r3, r3, lsl #0x9
    bl GraphicsTransferQueue_Enqueue
    ldr r6, [r6, #0x8]
    add r7, r7, #0x1
.L_02075204:
    ldr r0, [r8, #0x20]
    ldrh r0, [r0, #0x6]
    cmp r7, r0
    blt .L_020751d8
    ldr r0, [r5, #0x4]
    bl GX_VBlankIntr
    ldr r9, [r9, #0x4]
.L_02075220:
    cmp r9, #0x0
    bne .L_020751a8
.L_02075228:
    mov r0, #0x1
    str r0, [r10, #0x30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02075234: .word gGraphicsSpriteStatePool
.size GraphicsSpriteRenderer_Resume, . - GraphicsSpriteRenderer_Resume
