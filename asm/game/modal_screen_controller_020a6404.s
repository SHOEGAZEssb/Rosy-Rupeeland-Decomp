.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.
.extern GraphicsBgMapResource_UploadToSubBg
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsCharacterResource_GetUploadSize
.extern GraphicsPaletteResource_GetUploadSize
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern GraphicsResourceSet_ReleaseHandles
.extern data_020f4e18
.extern func_020b18bc
.extern func_020b1ff0
.extern func_020b44e8

.global func_020a6404
func_020a6404:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r1, #0xc0
    mov r4, r0
    sub r2, r1, #0x1
    mov r3, #0x0
.L_020a641c:
    add r0, r4, r2, lsl #0x1
    strh r3, [r0, #0x24]
    add r0, r0, #0x100
    add r1, r4, r2
    strh r3, [r0, #0xa4]
    strb r3, [r1, #0x324]
    strb r3, [r1, #0x3e4]
    subs r2, r2, #0x1
    bpl .L_020a641c
    str r3, [r4, #0xc]
    str r3, [r4, #0x10]
    mov r0, #0x3c
    str r0, [r4, #0x14]
    mov r0, #0x82
    str r0, [r4, #0x18]
    str r3, [r4, #0x1c]
    ldr r2, .L_020a6538
    str r3, [r4, #0x20]
    ldrh r1, [r2, #0x0]
    add r0, sp, #0x4
    and r1, r1, #0x43
    orr r1, r1, #0x3a00
    strh r1, [r2, #0x0]
    bl GraphicsResourceSet_Init
    ldr r3, .L_020a653c
    ldr r0, .L_020a6540
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    ldr r5, [r0, #0x24]
    bl GraphicsCharacterResource_GetUploadSize
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b18bc
    bl func_020b44e8
    ldr r6, [sp, #0x8]
    mov r0, r6
    bl GraphicsBgResourceData_GetDecoded
    mov r5, r0
    mov r0, r6
    bl GraphicsPaletteResource_GetUploadSize
    mov r2, r0
    mov r0, r5
    mov r1, #0x0
    bl func_020b1ff0
    bl func_020b44e8
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToSubBg
    bl func_020b44e8
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    mov r3, #0x1
    ldr r2, .L_020a6544
    str r3, [r4, #0x8]
    ldr r1, [r2, #0x0]
    add r0, sp, #0x4
    bic r1, r1, #0x1f00
    orr r1, r1, #0x200
    str r1, [r2, #0x0]
    str r3, [r4, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_020a6538: .word 0x400100a
.L_020a653c: .word 0x9010
.L_020a6540: .word data_020f4e18
.L_020a6544: .word 0x4001000
.size func_020a6404, . - func_020a6404
