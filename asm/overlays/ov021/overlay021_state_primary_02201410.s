    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_primary.c. */
    .extern data_ov021_02202d30
    .extern data_ov021_02202de8
    .extern data_ov021_02202df0
    .extern data_ov021_02202df8
    .extern data_ov021_02202e00
    .extern data_ov021_02202e08
    .extern func_02092260
    .extern func_02092c8c
    .extern TitleDialog_ClearTextRect
    .extern func_02095860
    .extern func_ov000_021fc298
    .extern func_ov000_021fc3f8
    .extern func_ov000_021fc424
    .extern func_ov000_021fc450
    .extern func_ov000_021fc460
    .extern func_ov000_021fc4fc
    .extern func_ov000_021fc528
    .extern func_ov000_021fc538
    .extern func_ov000_021fc5ac
    .extern func_ov000_021fc5fc
    .extern func_ov000_021fc9d4
    .extern func_ov000_021fca4c
    .extern Overlay000_GetActiveMetadata
    .extern func_ov000_021fcb98
    .extern func_ov000_021fcc18
    .extern func_ov000_021fcca8
    .extern func_ov000_021fccfc
    .extern func_ov021_021fd7c0
    .extern Overlay021_IsAuxiliaryRecordAvailable
    .extern func_ov021_021feea4
    .extern func_ov021_021ff274
    .extern Overlay021Descriptor_GetFlags16_19
    .extern func_ov021_021ff5b8
    .extern func_ov021_021ff62c

.global func_ov021_02201410
func_ov021_02201410:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov021_021ff274
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_022017d8
L_0220142c: ; jump table
    b L_0220143c ; case 0
    b L_02201464 ; case 1
    b L_022014a8 ; case 2
    b L_02201798 ; case 3
L_0220143c:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc3f8
    mov r0, r4
    bl func_ov021_021ff5b8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022017d8
L_02201464:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc450
    cmp r0, #0x0
    beq L_0220148c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022014a8
L_0220148c:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc460 ; func_ov001_021fc460
    cmp r0, #0x0
    beq L_022017d8
    mov r0, r4
    bl func_ov021_021ff5b8
    b L_022017d8
L_022014a8:
    ldr r0, [r4, #0x354]
    ldr r1, [r4, #0x2c]
    bl func_ov000_021fcb98
    cmp r0, #0x0
    bne L_02201730
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_02201730
    ldr r0, [r4, #0x354]
    add r1, r4, #0x30
    bl func_ov000_021fcca8
    cmp r0, #0x0
    bne L_02201730
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02201730
    ldr r0, [r4, #0x354]
    add r1, r4, #0x30
    bl func_ov000_021fc298
    mov r5, r0
    ldr r0, [r4, #0x354]
    add r1, r4, #0x30
    bl func_ov000_021fcc18
    cmp r0, #0x0
    bne L_02201730
    ldr r0, [r4, #0x354]
    add r1, r4, #0x30
    bl func_ov000_021fccfc
    cmp r0, #0x0
    beq L_0220153c
    ldr r1, L_022017e8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022017d8
L_0220153c:
    cmp r5, #0x0
    blt L_0220157c
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r0, [r4, #0x354]
    ldr r1, [r0, #0x25c]
    cmp r5, r1
    beq L_022017d8
    mov r1, r5
    bl func_ov000_021fca4c
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc9d4
    mov r0, r4
    bl func_ov021_021ff5b8
    b L_022017d8
L_0220157c:
    ldr r0, [r4, #0x354]
    add r1, r4, #0x30
    bl func_ov000_021fc5ac
    cmp r0, #0x0
    beq L_022015b8
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_022017ec
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022017d8
L_022015b8:
    ldr r0, [r4, #0x354]
    add r1, r4, #0x30
    bl func_ov000_021fc5fc
    cmp r0, #0x0
    beq L_02201614
    mov r0, r4
    bl Overlay021_IsAuxiliaryRecordAvailable
    cmp r0, #0x0
    beq L_02201604
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0xb
    bl func_02092260
    ldr r1, L_022017f0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022017d8
L_02201604:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_022017d8
L_02201614:
    ldr r1, [r4, #0x2c4]
    add r2, r4, #0x14c
    mov r0, #0xac
    mla r0, r1, r0, r2
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_02201730
    ldr r0, [r4, #0x354]
    bl Overlay000_GetActiveMetadata
    mov r1, #0x1
    bl func_ov021_021ff62c
    cmp r0, #0x0
    bne L_02201720
    ldr r0, [r4, #0x354]
    bl Overlay000_GetActiveMetadata
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x37c]
    cmp r0, #0x0
    beq L_02201720
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_02201720
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x37c]
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x2bc]
    bl Overlay021Descriptor_GetFlags16_19
    cmp r0, #0x1
    bne L_022016e8
    ldr r1, [r4, #0x354]
    mov r0, #0x1
    ldr r2, [r1, #0x25c]
    sub r1, r0, #0x11
    str r2, [r4, #0x374]
    ldr r2, [r4, #0x37c]
    ldrh r2, [r2, #0x0]
    str r2, [r4, #0x378]
    bl func_02092c8c
    ldr r1, L_022017f4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022017d8
L_022016e8:
    ldr r0, [r4, #0x2bc]
    bl Overlay021Descriptor_GetFlags16_19
    cmp r0, #0x0
    bne L_0220170c
    ldr r1, L_022017f8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022017d8
L_0220170c:
    ldr r1, L_022017fc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov021_021fd7c0
    b L_022017d8
L_02201720:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_022017d8
L_02201730:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc424
    cmp r0, #0x0
    beq L_02201764
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022017d8
L_02201764:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc4fc
    cmp r0, #0x0
    beq L_022017d8
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022017d8
L_02201798:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc528
    cmp r0, #0x0
    beq L_022017c0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022017d8
L_022017c0:
    ldr r0, [r4, #0x354]
    bl func_ov000_021fc538
    cmp r0, #0x0
    beq L_022017d8
    mov r0, r4
    bl func_ov021_021ff5b8
L_022017d8:
    mov r0, r4
    bl func_ov021_021feea4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_022017e8: .word data_ov021_02202d30
L_022017ec: .word data_ov021_02202e08
L_022017f0: .word data_ov021_02202e00
L_022017f4: .word data_ov021_02202df8
L_022017f8: .word data_ov021_02202df0
L_022017fc: .word data_ov021_02202de8
.size func_ov021_02201410, . - func_ov021_02201410
