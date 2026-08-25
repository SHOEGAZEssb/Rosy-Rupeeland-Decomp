.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern Heap_Free
.extern data_020f4e14
.extern data_020f4e18
.extern GraphicsArchive_ReleaseCharacterResource
.extern GraphicsArchive_ReleasePaletteResource
.extern GraphicsArchive_ReleaseCellResource
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern func_ov066_02210534

.global func_ov066_0221096c
func_ov066_0221096c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r5, #0x0
    b .L_0221099c
.L_0221097c:
    ldr r6, [r4, r5, lsl #0x2]
    cmp r6, #0x0
    beq .L_02210998
    mov r0, r6
    bl func_ov066_02210534
    mov r0, r6
    bl Heap_Free
.L_02210998:
    add r5, r5, #0x1
.L_0221099c:
    ldr r0, [r4, #0x190]
    cmp r5, r0
    blt .L_0221097c
    ldr r0, [r4, #0x1a4]
    bl GraphicsSpriteGroup_Clear
    ldr r0, .L_022109f8
    ldr r1, [r4, #0x1a4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, .L_022109fc
    ldr r1, [r4, #0x1a8]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseCharacterResource
    ldr r0, .L_022109fc
    ldr r1, [r4, #0x1ac]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleasePaletteResource
    ldr r0, .L_022109fc
    ldr r1, [r4, #0x1b0]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseCellResource
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_022109f8: .word data_020f4e14
.L_022109fc: .word data_020f4e18
.size func_ov066_0221096c, . - func_ov066_0221096c
