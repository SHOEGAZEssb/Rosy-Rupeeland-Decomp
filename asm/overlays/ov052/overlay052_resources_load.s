.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern GXS_SetGraphicsMode
.extern GX_SetBankForSubBG
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern SceneManager_GetCurrent
.extern Scene_ClearFlags03
.extern Scene_HasFlags03
.extern Scene_SetFlags03
.extern data_020f4e18
.extern func_020706c4
.extern func_02070bc4
.extern func_02070eac
.extern GraphicsResourceSet_ReleaseHandles
.extern func_020aea7c
.extern func_020afd28
.extern func_020b44e8
.extern gSceneManager

.global func_ov052_0220ddb4
func_ov052_0220ddb4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x24
    ldr r0, .L_0220df7c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    bl Scene_HasFlags03
    ldr r1, .L_0220df7c
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    bl Scene_ClearFlags03
    mov r0, #0x5
    bl GXS_SetGraphicsMode
    ldr r2, .L_0220df80
    mov r0, #0x4
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1500
    str r1, [r2, #0x0]
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    ldr r1, .L_0220df84
    mov r2, #0x0
    ldrh r3, [r1, #0x0]
    add r0, sp, #0x18
    and r3, r3, #0x43
    orr r3, r3, #0x3c80
    strh r3, [r1, #0x0]
    ldrh r3, [r1, #0x4]
    and r3, r3, #0x43
    orr r3, r3, #0xe10
    orr r3, r3, #0x7000
    strh r3, [r1, #0x4]
    ldrh r3, [r1, #0x0]
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r1, #0x0]
    ldrh r3, [r1, #0x4]
    bic r3, r3, #0x3
    orr r3, r3, #0x1
    strh r3, [r1, #0x4]
    str r2, [r1, #0x8]
    bl GraphicsResourceSet_Init
    ldr r3, .L_0220df88
    ldr r1, .L_0220df8c
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, sp, #0x18
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [sp, #0x18]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x1c]
    mov r1, #0x4000
    bl func_02070bc4
    ldr r0, [sp, #0x20]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070eac
    add r0, sp, #0x18
    bl GraphicsResourceSet_ReleaseHandles
    ldr r3, .L_0220df90
    ldr r0, .L_0220df8c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x18
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x18]
    mov r2, r1
    bl func_020706c4
    mov r1, #0x0
    ldr r0, [sp, #0x20]
    mov r2, r1
    bl func_02070eac
    add r0, sp, #0x18
    bl GraphicsResourceSet_ReleaseHandles
    mov r2, #0x0
    mov r0, #0x1000
    str r0, [sp, #0x8]
    str r0, [sp, #0x14]
    str r2, [sp, #0xc]
    str r2, [sp, #0x10]
    str r2, [sp, #0x0]
    ldr r0, .L_0220df94
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r0, .L_0220df98
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    cmp r4, #0x0
    beq .L_0220df6c
    ldr r0, .L_0220df7c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    bl Scene_SetFlags03
.L_0220df6c:
    add r0, sp, #0x18
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, pc}
.L_0220df7c: .word gSceneManager
.L_0220df80: .word 0x4001000
.L_0220df84: .word 0x4001008
.L_0220df88: .word 0x900b
.L_0220df8c: .word data_020f4e18
.L_0220df90: .word 0x9009
.L_0220df94: .word 0x4001020
.L_0220df98: .word 0x4001030
.size func_ov052_0220ddb4, . - func_ov052_0220ddb4
