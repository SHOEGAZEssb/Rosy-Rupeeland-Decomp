.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern SceneManager_GetCurrent
.extern data_020c9670
.extern data_020f4e14
.extern data_021052fc
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern func_02008e10
.extern func_02010c00
.extern ActorDerivedType1_ApplyResourceIndex
.extern func_02072b68
.extern func_020740a4
.extern func_020755bc
.extern func_020befec
.extern func_ov065_0220ff20
.extern func_ov065_02210a04
.extern gDebugFont
.extern gLupyContext
.extern gSceneManager

.global func_ov065_02210600
func_ov065_02210600:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, .L_022108e0
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    cmp r0, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, .L_022108e4
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, .L_022108e8
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, .L_022108ec
    add r1, r4, #0x100
    ldr r0, [r0, #0x0]
    ldrh r2, [r1, #0x1a]
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    cmp r2, #0x0
    subne r0, r2, #0x1
    strneh r0, [r1, #0x1a]
    ldr r0, [r4, #0x8]
    mov r6, #0x0
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_0221082c
.L_02210670:
    b .L_02210684
    b .L_022106a0
    b .L_0221071c
    b .L_0221082c
    b .L_0221082c
.L_02210684:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    mov r0, #0x1
    str r0, [r4, #0x8]
.L_022106a0:
    add r0, r4, #0x100
    ldrh r1, [r0, #0x20]
    add r1, r1, #0x1
    strh r1, [r0, #0x20]
    ldrh r0, [r0, #0x20]
    cmp r0, #0x14
    bls .L_0221082c
    mov r0, #0x2
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x158]
    mov r1, #0x14
    bl func_02072b68
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0x20]
    ldr r5, [r4, #0x15c]
    ldr r0, [r4, #0x11c]
    ldr r1, [r4, #0x11c]
    cmp r0, r5
    movle r5, r0
    sub r1, r1, r5
    str r1, [r4, #0x11c]
    ldr r0, .L_022108f0
    rsb r1, r5, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_02010c00
    mov r0, r4
    mov r1, r5
    bl func_ov065_02210a04
    b .L_0221082c
.L_0221071c:
    add r0, r4, #0x100
    ldrh r1, [r0, #0x20]
    add r1, r1, #0x1
    strh r1, [r0, #0x20]
    ldrh r0, [r0, #0x20]
    cmp r0, #0x1e
    bls .L_022107e0
    ldr r0, [r4, #0x11c]
    cmp r0, #0x0
    ble .L_0221076c
    ldr r0, [r4, #0x158]
    mov r1, #0xc
    bl func_02072b68
    mov r0, #0x1
    str r0, [r4, #0x8]
    add r0, r4, #0x100
    ldrsh r1, [r0, #0x18]
    eor r1, r1, #0x1
    strh r1, [r0, #0x18]
    b .L_022107d0
.L_0221076c:
    mov r0, r5
    mov r1, #0x0
    bl ActorDerivedType1_ApplyResourceIndex
    ldr r5, [r5, #0x54]
    mov r1, #0x4
    mov r0, r5
    bl func_02072b68
    ldr r0, .L_022108ec
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldrh r1, [r5, #0x24]
    mov r0, #0x3
    orr r1, r1, #0x2
    bic r1, r1, #0x1
    strh r1, [r5, #0x24]
    ldr r2, [r4, #0x158]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    str r0, [r4, #0x8]
.L_022107d0:
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0x20]
    b .L_0221082c
.L_022107e0:
    mov r0, r0, lsl #0xf
    mov r1, #0x1e
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_022108f4
    mov r1, r1, lsl #0x2
    ldrsh r2, [r0, r1]
    mov r0, #0x6000
    mov r1, #0x0
    umull r5, r3, r2, r0
    adds r5, r5, #0x800
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r6, r5, lsr #0xc
    orr r6, r6, r0, lsl #0x14
.L_0221082c:
    mov r7, #0x0
    mov r8, r7
    mov r11, r7
    mov r5, #0x78
.L_0221083c:
    mla r10, r8, r5, r4
    mov r9, r11
.L_02210844:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x28]
    mov r1, r4
    bl func_ov065_0220ff20
    add r9, r9, #0x1
    cmp r9, #0x1e
    add r7, r7, r0
    blt .L_02210844
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_0221083c
    ldr r0, [r4, #0x8]
    cmp r0, #0x3
    cmpeq r7, #0x0
    bne .L_022108a0
    cmp r4, #0x0
    beq .L_02210898
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210898:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022108a0:
    ldr r0, .L_022108ec
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02008e10
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r3, [r4, #0x130]
    ldr r0, [r4, #0x158]
    ldr r1, [r4, #0x128]
    ldr r2, [r4, #0x12c]
    add r3, r3, r6
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r0, [r4, #0x24]
    bl func_020740a4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022108e0: .word gSceneManager
.L_022108e4: .word data_020f4e14
.L_022108e8: .word gDebugFont
.L_022108ec: .word data_021052fc
.L_022108f0: .word gLupyContext
.L_022108f4: .word data_020c9670
.size func_ov065_02210600, . - func_ov065_02210600
