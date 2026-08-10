.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern GamePhaseRegionTable_Init
.extern GamePhaseRegionTable_Destroy
.extern GamePhaseRegionTable_Load
.extern GamePhaseRegionTable_GetCount
.extern GamePhaseRegionTable_SetGameWorkFlagBase
.extern func_020706c4
.extern func_02070bc4
.extern func_02070eac
.extern func_02070f34
.extern func_02071ee0
.extern GraphicsSpriteGroup_CreateState
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_020af9e0
.extern func_020afaec
.extern func_020afbf8
.extern func_020b44e8
.extern func_020b57d4
.extern func_ov059_022100c0
.extern func_ov059_022100dc
.extern func_ov059_022100f8
.extern func_ov059_02210178
.extern func_ov059_022101b0
.extern func_ov059_02210284
.extern gDebugFont

.global func_ov059_0220fd80
func_ov059_0220fd80:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    add r0, sp, #0x14
    mov r5, r2
    mov r9, r1
    mov r4, r3
    bl GraphicsResourceSet_Init
    str r5, [r10, #0x54]
    ldrh r2, [r9, #0x10]
    ldr r1, .L_022100a0
    add r0, sp, #0x14
    str r2, [sp, #0x0]
    ldrh r2, [r9, #0xc]
    ldrh r3, [r9, #0xe]
    ldr r1, [r1, #0x0]
    bl GraphicsResourceSet_Load
    ldr r0, [r10, #0x54]
    cmp r0, #0x1
    beq .L_0220fde4
    cmp r0, #0x2
    beq .L_0220fe58
    cmp r0, #0x3
    beq .L_0220fecc
    b .L_0220ff3c
.L_0220fde4:
    mov r1, #0x2
    ldr r0, .L_022100a4
    str r1, [r10, #0x58]
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x2
    orr r1, r2, r1, lsl #0x8
    str r1, [r0, #0x0]
    ldrh r1, [r0, #0xa]
    ldr r2, [sp, #0x48]
    and r1, r1, #0x43
    orr r1, r1, #0x8000
    orr r1, r1, r2, lsl #0x8
    orr r1, r1, r4, lsl #0x2
    strh r1, [r0, #0xa]
    ldr r0, [r10, #0x58]
    bl func_ov059_022100c0
    ldr r1, .L_022100a8
    ldr r0, .L_022100ac
    str r1, [r0, #0x0]
    bl func_020afbf8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_020b57d4
    b .L_0220ff3c
.L_0220fe58:
    mov r1, #0x2
    ldr r0, .L_022100a4
    str r1, [r10, #0x58]
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r0, #0x0]
    ldrh r1, [r0, #0xc]
    ldr r2, [sp, #0x48]
    and r1, r1, #0x43
    orr r1, r1, #0x8000
    orr r1, r1, r2, lsl #0x8
    orr r1, r1, r4, lsl #0x2
    strh r1, [r0, #0xc]
    ldr r0, [r10, #0x58]
    bl func_ov059_022100dc
    ldr r1, .L_022100a8
    ldr r0, .L_022100b0
    str r1, [r0, #0x0]
    bl func_020afaec
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_020b57d4
    b .L_0220ff3c
.L_0220fecc:
    mov r1, #0x2
    ldr r0, .L_022100a4
    str r1, [r10, #0x58]
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x8
    orr r1, r2, r1, lsl #0x8
    str r1, [r0, #0x0]
    ldrh r1, [r0, #0xe]
    ldr r2, [sp, #0x48]
    and r1, r1, #0x43
    orr r1, r1, #0x8000
    orr r1, r1, r2, lsl #0x8
    orr r1, r1, r4, lsl #0x2
    strh r1, [r0, #0xe]
    ldr r0, [r10, #0x58]
    bl func_ov059_022100f8
    ldr r1, .L_022100a8
    ldr r0, .L_022100b4
    str r1, [r0, #0x0]
    bl func_020af9e0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_020b57d4
.L_0220ff3c:
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x4c]
    bl func_02070f34
    bl func_020b44e8
    ldr r0, [sp, #0x14]
    ldr r1, [r10, #0x54]
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x1c]
    ldr r1, [r10, #0x54]
    mov r2, #0x0
    bl func_02070eac
    ldr r1, [sp, #0x4c]
    ldr r0, [sp, #0x18]
    mov r1, r1, lsl #0x5
    bl func_02070bc4
    ldr r1, .L_022100b8
    mov r2, #0x30c0
    str r1, [sp, #0x0]
    ldr r1, .L_022100a0
    add r0, r10, #0x44
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl func_02071ee0
    ldr r0, .L_022100bc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x0]
    mov r7, #0x0
    mov r6, #0x2
    mov r11, #0x1e
.L_0220ffb8:
    mul r0, r7, r11
    mov r1, r7, lsl #0x2
    mov r0, r0, lsl #0x10
    mov r8, #0x0
    add r5, r10, r1, lsl #0x2
    mov r4, r0, asr #0x10
.L_0220ffd0:
    str r6, [sp, #0x0]
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0x44]
    ldr r2, [r10, #0x48]
    ldr r3, [r10, #0x4c]
    bl GraphicsSpriteGroup_CreateState
    mov r1, #0x28
    add r2, r5, r8, lsl #0x2
    mul r1, r8, r1
    str r0, [r2, #0x4]
    strh r1, [r0, #0x2c]
    strh r4, [r0, #0x2e]
    add r8, r8, #0x1
    ldr r1, [r10, #0x58]
    ldr r0, [r2, #0x4]
    cmp r8, #0x4
    strb r1, [r0, #0x3a]
    blt .L_0220ffd0
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0220ffb8
    ldr r3, [r10, #0x0]
    mov r1, #0x2c
    str r1, [r3, #0x18]
    mov r2, #0x3c
    mov r0, r10
    mov r1, #0x0
    str r2, [r3, #0x1c]
    bl func_ov059_02210178
    add r0, sp, #0x4
    bl GamePhaseRegionTable_Init
    ldr r1, [r9, #0x4]
    add r0, sp, #0x4
    bl GamePhaseRegionTable_Load
    ldr r1, [r9, #0x48]
    add r0, sp, #0x4
    bl GamePhaseRegionTable_SetGameWorkFlagBase
    add r1, sp, #0x4
    mov r0, r10
    bl func_ov059_022101b0
    add r0, sp, #0x4
    bl GamePhaseRegionTable_GetCount
    cmp r0, #0x0
    bgt .L_02210088
    mov r0, r10
    bl func_ov059_02210284
.L_02210088:
    add r0, sp, #0x4
    bl GamePhaseRegionTable_Destroy
    add r0, sp, #0x14
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022100a0: .word data_020f4e18
.L_022100a4: .word 0x4001000
.L_022100a8: .word 0x1d301e8
.L_022100ac: .word 0x4001014
.L_022100b0: .word 0x4001018
.L_022100b4: .word 0x400101c
.L_022100b8: .word 0x30c2
.L_022100bc: .word gDebugFont
.size func_ov059_0220fd80, . - func_ov059_0220fd80
