.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_collections.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_021f5128
.extern data_ov023_021ffc00
.extern data_ov023_021ffc08
.extern AnimationResourceState_ReplaceResources
.extern RecordMode_GetCharacterResourceId
.extern RecordMode_GetPaletteResourceId
.extern RecordMode_GetCellResourceId
.extern IndexedSelectionController_ConfigureRange
.extern func_ov023_021fce44
.extern func_ov023_021fd024
.extern func_ov023_021fd104
.extern func_ov023_021fd444
.extern func_ov023_021fd634
.extern func_ov023_021fe5f8
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov023_021fe39c
func_ov023_021fe39c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, L_021fe5e0
    mov r10, r0
    ldr r4, [r1, #0x0]
    ldr r1, L_021fe5e4
    ldr r3, L_021fe5e8
    mov r0, #0x40
    mov r2, #0x4
    ldr r9, [r4, #0xcc8]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe3dc
    ldr r1, L_021fe5ec
    mov r2, r9
    ldr r1, [r1, #0x0]
    bl func_ov023_021fce44
L_021fe3dc:
    str r0, [r10, #0x390]
    mov r7, #0x0
    str r7, [r10, #0x398]
    b L_021fe4e4
L_021fe3ec:
    ldr r1, L_021fe5e0
    ldr r0, [r10, #0x390]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x48
    add r4, r1, r7, lsl #0x4
    mov r1, r4
    bl func_ov023_021fd024
    ldr r2, [r4, #0x4]
    ldr r1, L_021fe5e0
    ldr r2, [r2, #0xc]
    ldr r1, [r1, #0x0]
    and r8, r2, #0xff
    ldr r4, [r1, r8, lsl #0x2]
    mov r6, r0
    add r0, r4, #0x660
    add r0, r0, #0x8
    bl RecordMode_GetCharacterResourceId
    mov r5, r0
    add r0, r4, #0x660
    add r0, r0, #0x8
    bl RecordMode_GetPaletteResourceId
    add r1, r4, #0x660
    mov r4, r0
    add r0, r1, #0x8
    bl RecordMode_GetCellResourceId
    str r0, [sp, #0x0]
    ldr r1, L_021fe5f0
    mov r2, r5
    ldr r1, [r1, #0x0]
    mov r3, r4
    add r0, r6, #0x4
    bl AnimationResourceState_ReplaceResources
    mov r0, #0x1a
    mov r2, #0x0
    mul r0, r7, r0
    strh r2, [r6, #0x14]
    strh r0, [r6, #0x16]
    ldr r3, [r10, #0x398]
    b L_021fe4a8
L_021fe488:
    add r1, r10, r2, lsl #0x2
    ldr r0, [r1, #0x3a0]
    cmp r8, r0
    ldreq r0, [r1, #0x3e8]
    addeq r0, r0, #0x1
    streq r0, [r1, #0x3e8]
    beq L_021fe4b0
    add r2, r2, #0x1
L_021fe4a8:
    cmp r2, r3
    blt L_021fe488
L_021fe4b0:
    ldr r0, [r10, #0x398]
    cmp r2, r0
    bne L_021fe4e0
    add r0, r10, r0, lsl #0x2
    str r8, [r0, #0x3a0]
    ldr r0, [r10, #0x398]
    mov r1, #0x1
    add r0, r10, r0, lsl #0x2
    str r1, [r0, #0x3e8]
    ldr r0, [r10, #0x398]
    add r0, r0, #0x1
    str r0, [r10, #0x398]
L_021fe4e0:
    add r7, r7, #0x1
L_021fe4e4:
    cmp r7, r9
    blt L_021fe3ec
    mov r8, #0x0
    mov r7, #0x50
    ldr r6, L_021fe5f4
    mov r5, #0x4
    ldr r11, L_021fe5e8
    ldr r4, L_021fe5ec
    b L_021fe540
L_021fe508:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe534
    add r2, r10, r8, lsl #0x2
    ldr r1, [r4, #0x0]
    ldr r2, [r2, #0x3e8]
    bl func_ov023_021fd444
L_021fe534:
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x430]
    add r8, r8, #0x1
L_021fe540:
    ldr r0, [r10, #0x398]
    cmp r8, r0
    blt L_021fe508
    mov r5, #0x0
    mov r4, r5
    ldr r6, L_021fe5e0
    b L_021fe5ac
L_021fe55c:
    ldr r1, [r6, #0x0]
    mov r0, r4
    add r1, r1, #0x48
    add r1, r1, r5, lsl #0x4
    ldr r2, [r1, #0x4]
    ldr r8, [r10, #0x398]
    ldr r2, [r2, #0xc]
    and r7, r2, #0xff
    b L_021fe5a0
L_021fe580:
    add r3, r10, r0, lsl #0x2
    ldr r2, [r3, #0x3a0]
    cmp r7, r2
    bne L_021fe59c
    ldr r0, [r3, #0x430]
    bl func_ov023_021fd634
    b L_021fe5a8
L_021fe59c:
    add r0, r0, #0x1
L_021fe5a0:
    cmp r0, r8
    blt L_021fe580
L_021fe5a8:
    add r5, r5, #0x1
L_021fe5ac:
    cmp r5, r9
    blt L_021fe55c
    ldr r2, [r10, #0x398]
    mov r1, #0x0
    mov r3, r1
    add r0, r10, #0x480
    sub r2, r2, #0x1
    bl IndexedSelectionController_ConfigureRange
    mov r0, r10
    bl func_ov023_021fe5f8
    ldr r0, [r10, #0x390]
    bl func_ov023_021fd104
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe5e0: .word data_021f5128
L_021fe5e4: .word data_ov023_021ffc00
L_021fe5e8: .word gHeapContext
L_021fe5ec: .word data_020f4e14
L_021fe5f0: .word data_020f4e18
L_021fe5f4: .word data_ov023_021ffc08
.size func_ov023_021fe39c, .-func_ov023_021fe39c

