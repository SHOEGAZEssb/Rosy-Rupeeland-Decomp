.text

/* Exact fallback; see src/overlays/ov032/overlay032_runtime_choice_state.c for documented portable C. */
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern GraphicsResourceSet_Load
.extern Sound_Play
.extern gScenarioActionTables
.extern data_020f4e18
.extern data_021e9e00
.extern data_021f5f18
.extern data_ov032_02202220
.extern func_020594ec
.extern Sound_StopStream
.extern RetailPhaseDatabase_UnlockById
.extern GraphicsResource_GetFormat
.extern func_02070638
.extern func_02070b50
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsResourceSet_ReleaseHandles
.extern RetailSaveContext_PollOperation
.extern RetailSaveContext_BeginRecordOperation
.extern RetailSelectionHistory_InsertUniqueId
.extern RetailSelectionManager_AdvanceHistory
.extern RetailSelectionManager_HasInactiveSpecialRecord
.extern func_020b44e8
.extern func_ov032_021fe0e8
.extern func_ov032_021fe10c
.extern func_ov032_021fe134
.extern func_ov032_021fe23c
.extern func_ov032_021fe2bc
.extern Overlay032SpriteWrapper_HitTest
.extern gGameWork
.extern gRuntimeContext
.extern gSoundContext

    .global func_ov032_02200618
func_ov032_02200618:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0xb64]
    cmp r1, #0x5b
    bgt L_0220069c
    bge L_02200cc4
    cmp r1, #0x50
    bgt L_02200690
    bge L_02200bb8
    cmp r1, #0x10
    addls pc, pc, r1, lsl #0x2
    b L_02200d64
L_0220064c: ; jump table
    b L_022006c0 ; case 0
    b L_0220070c ; case 1
    b L_02200784 ; case 2
    b L_02200880 ; case 3
    b L_02200d64 ; case 4
    b L_02200d64 ; case 5
    b L_02200d64 ; case 6
    b L_02200d64 ; case 7
    b L_02200d64 ; case 8
    b L_02200d64 ; case 9
    b L_022008e0 ; case 10
    b L_02200900 ; case 11
    b L_0220094c ; case 12
    b L_022009c4 ; case 13
    b L_02200a08 ; case 14
    b L_02200a58 ; case 15
    b L_02200ab4 ; case 16
L_02200690:
    cmp r1, #0x5a
    beq L_02200bfc
    b L_02200d64
L_0220069c:
    cmp r1, #0x64
    bgt L_022006b4
    bge L_02200d0c
    cmp r1, #0x5c
    beq L_02200cdc
    b L_02200d64
L_022006b4:
    cmp r1, #0x65
    beq L_02200d38
    b L_02200d64
L_022006c0:
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    ldr r3, L_02200d70
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1300
    str r0, [r1, #0x0]
    ldr r1, L_02200d74
    str r3, [sp, #0x0]
    add r0, r4, #0x318
    ldr r1, [r1, #0x0]
    add r0, r0, #0xc00
    sub r2, r3, #0x5
    sub r3, r3, #0x4
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_0220070c:
    ldr r0, [r4, #0xf18]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [r4, #0xf18]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r4, #0xf1c]
    moveq r1, #0x0
    bl func_02070b50
    ldr r0, [r4, #0xf20]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    add r0, r4, #0x318
    add r0, r0, #0xc00
    bl GraphicsResourceSet_ReleaseHandles
    ldr r1, L_02200d78
    mov r0, #0x5000000
    strh r1, [r0, #0x0]
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1700
    str r0, [r1, #0x0]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200784:
    ldr r0, L_02200d7c
    bl RetailSelectionManager_AdvanceHistory
    ldr r0, [r4, #0xf28]
    cmp r0, #0x0
    beq L_02200830
    ldr r0, L_02200d80
    ldr r1, L_02200d84
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_02200d80
    mov r1, #0x18
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200d80
    mov r1, #0x1f0
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200d80
    mov r1, #0x398
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200d88
    mov r1, #0xa
    bl RetailPhaseDatabase_UnlockById
    ldr r0, L_02200d8c
    ldr r0, [r0, #0x70]
    ldr r0, [r0, #0x4]
    blx r0
    ldr r0, L_02200d7c
    mov r1, #0x68
    bl RetailSelectionHistory_InsertUniqueId
    ldr r0, L_02200d7c
    mov r1, #0x36
    bl RetailSelectionHistory_InsertUniqueId
    ldr r0, L_02200d7c
    mov r1, #0x35
    bl RetailSelectionHistory_InsertUniqueId
    ldr r0, L_02200d7c
    mov r1, #0x34
    bl RetailSelectionHistory_InsertUniqueId
    ldr r0, L_02200d7c
    mov r1, #0x2e
    bl RetailSelectionHistory_InsertUniqueId
L_02200830:
    ldr r2, [r4, #0x2d4]
    add r0, r4, #0x2d4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
    ldr r0, L_02200d90
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_StopStream
    ldr r0, L_02200d94
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    mov r3, #0x1
    bl RetailSaveContext_BeginRecordOperation
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200880:
    ldr r0, L_02200d94
    ldr r0, [r0, #0x0]
    bl RetailSaveContext_PollOperation
    cmp r0, #0x0
    beq L_02200d64
    cmp r0, #0x1
    bne L_022008c0
    ldr r0, L_02200d80
    mov r3, #0x0
    ldr r2, [r0, #0x0]
    mov r1, #0xa
    str r3, [r2, #0x44]
    ldr r0, [r0, #0x0]
    str r3, [r0, #0x48]
    str r1, [r4, #0xb64]
    b L_02200d64
L_022008c0:
    ldr r0, L_02200d98
    mov r1, #0x0
    ldr r2, [r0, #0x60]
    ldr r0, [r0, #0x64]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
    b L_02200d64
L_022008e0:
    ldr r0, L_02200d90
    mov r1, #0x12
    ldr r0, [r0, #0x0]
    bl func_020594ec
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200900:
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    ldr r3, L_02200d9c
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1300
    str r0, [r1, #0x0]
    ldr r1, L_02200d74
    str r3, [sp, #0x0]
    add r0, r4, #0x318
    ldr r1, [r1, #0x0]
    add r0, r0, #0xc00
    sub r2, r3, #0x6
    sub r3, r3, #0x5
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_0220094c:
    ldr r0, [r4, #0xf18]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [r4, #0xf18]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r4, #0xf1c]
    moveq r1, #0x0
    bl func_02070b50
    ldr r0, [r4, #0xf20]
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    add r0, r4, #0x318
    add r0, r0, #0xc00
    bl GraphicsResourceSet_ReleaseHandles
    ldr r1, L_02200d78
    mov r0, #0x5000000
    strh r1, [r0, #0x0]
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1700
    str r0, [r1, #0x0]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_022009c4:
    ldr r3, [r4, #0x2d4]
    mov r1, #0x80
    ldrh r2, [r3, #0x24]
    mov r0, #0x6c
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r4, #0xb14]
    strh r1, [r2, #0x2c]
    strh r0, [r2, #0x2e]
    ldr r1, [r4, #0xb14]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200a08:
    ldr r0, [r4, #0xb84]
    cmp r0, #0x0
    beq L_02200d64
    add r0, r4, #0x314
    add r1, r4, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r0, #0x800
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_02200d64
    ldr r0, [r4, #0xf28]
    cmp r0, #0x0
    movne r0, #0x50
    strne r0, [r4, #0xb64]
    ldreq r0, [r4, #0xb64]
    addeq r0, r0, #0x1
    streq r0, [r4, #0xb64]
    b L_02200d64
L_02200a58:
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    mov r1, #0x18
    bic r2, r2, #0x1f00
    orr r2, r2, #0x1300
    str r2, [r3, #0x0]
    ldr r3, [r4, #0xb14]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r3, [r4, #0x214]
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r3, [r4, #0x244]
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200ab4:
    ldr r1, [r4, #0xb84]
    cmp r1, #0x0
    beq L_02200bac
    add r1, r4, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r4, #0x214
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_02200b34
    ldr r0, L_02200d90
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r2, [r4, #0x214]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x244]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe10c
    mov r0, r4
    mov r1, #0x1
    bl func_ov032_021fe23c
    mov r0, #0x5a
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200b34:
    add r1, r4, #0x354
    mvn r2, #0x0
    mov r3, r2
    add r0, r4, #0x244
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_02200b9c
    ldr r0, L_02200d90
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r2, [r4, #0x214]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x244]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe10c
    mov r0, #0x64
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200b9c:
    mov r0, r4
    mov r1, #0x0
    bl func_ov032_021fe134
    b L_02200d64
L_02200bac:
    mov r1, #0x0
    bl func_ov032_021fe134
    b L_02200d64
L_02200bb8:
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, L_02200d98
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1300
    str r1, [r2, #0x0]
    ldr r3, [r4, #0xb14]
    mov r1, #0xa
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r0, #0x58]
    ldr r0, [r0, #0x5c]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
    b L_02200d64
L_02200bfc:
    ldr r0, L_02200d7c
    ldr r1, [r0, #0x460]
    cmp r1, #0x0
    ble L_02200c40
    ldr r2, [r4, #0x184]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl RetailSelectionManager_HasInactiveSpecialRecord
    cmp r0, #0x0
    beq L_02200c40
    ldr r2, [r4, #0x1b4]
    add r0, r4, #0x1b4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_02200c40:
    ldr r1, [r4, #0xf4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x154]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0xc1c]
    cmp r0, #0x0
    ble L_02200cb4
    ldr r2, [r4, #0x124]
    ldr r0, L_02200d80
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r4, #0xc1c]
    ldr r0, [r0, #0x0]
    add r1, r4, r1, lsl #0x2
    ldr r1, [r1, #0xe60]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_02200cb4
    ldr r2, [r4, #0x1e4]
    add r0, r4, #0x1e4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov032_021fe0e8
L_02200cb4:
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200cc4:
    mov r1, #0x23
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200cdc:
    mov r1, #0x0
    bl func_ov032_021fe134
    cmp r0, #0x0
    beq L_02200d64
    ldr r0, L_02200d98
    mov r1, #0xa
    ldr r2, [r0, #0x50]
    ldr r0, [r0, #0x54]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
    b L_02200d64
L_02200d0c:
    ldr r0, L_02200d80
    ldr r1, L_02200da0
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    mov r1, #0x1a
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200d64
L_02200d38:
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    beq L_02200d64
    ldr r0, L_02200d98
    mov r1, #0x0
    ldr r2, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
L_02200d64:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02200d70: .word 0xa069
L_02200d74: .word data_020f4e18
L_02200d78: .word 0x24a3
L_02200d7c: .word data_021f5f18
L_02200d80: .word gGameWork
L_02200d84: .word 0x15a
L_02200d88: .word data_021e9e00
L_02200d8c: .word gScenarioActionTables
L_02200d90: .word gSoundContext
L_02200d94: .word gRuntimeContext
L_02200d98: .word data_ov032_02202220
L_02200d9c: .word 0xa06a
L_02200da0: .word 0x3fb
.size func_ov032_02200618, .-func_ov032_02200618

