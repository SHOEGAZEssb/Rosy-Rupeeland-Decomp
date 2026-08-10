.text

/* Exact fallback; see src/overlays/ov030/overlay030_frame_and_counts.c for documented portable C. */
.extern data_021f5ee8
.extern GamePhaseCurrencyHud_Update
.extern func_0206492c
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02092b70
.extern func_020958d8
.extern func_02095988
.extern func_020b1ff0
.extern func_020b2058
.extern func_020befec
.extern func_ov030_021fd304
.extern func_ov045_0220b908
.extern func_ov045_0220c18c
.extern gLupyContext


    .global func_ov030_021fe768
func_ov030_021fe768:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xb8
    bl func_020958d8
    add r0, r4, #0x164
    bl func_020958d8
    add r0, r4, #0x210
    bl func_020958d8
    ldr r0, L_021fe800
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    beq L_021fe7a4
    bl func_ov045_0220c18c
L_021fe7a4:
    ldr r0, [r4, #0x2c4]
    cmp r0, #0x0
    beq L_021fe7b4
    bl func_ov030_021fd304
L_021fe7b4:
    ldr r0, [r4, #0x2c8]
    bl func_ov045_0220b908
    ldr r0, [r4, #0x334]
    cmp r0, #0x10
    ldmgeia sp!, {r4, pc}
    add r2, r0, #0x1
    str r2, [r4, #0x334]
    ldr r0, [r4, #0x32c]
    ldr r1, [r4, #0x330]
    bl func_02092b70
    ldr r0, L_021fe804
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b2058
    ldr r0, L_021fe804
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    ldmia sp!, {r4, pc}
L_021fe800: .word gLupyContext
L_021fe804: .word data_021f5ee8
.size func_ov030_021fe768, .-func_ov030_021fe768
    .global func_ov030_021fe808
func_ov030_021fe808:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x37c]
    mov r1, #0x164
    bl func_0206492c
    str r0, [r4, #0x380]
    ldr r0, [r4, #0x37c]
    ldr r1, L_021fe950
    bl func_0206492c
    str r0, [r4, #0x388]
    mov r0, #0x0
    str r0, [r4, #0x384]
    str r0, [r4, #0x38c]
    ldr r2, [r4, #0x380]
    cmp r2, #0x0
    blt L_021fe860
    ldr r1, [r4, #0x37c]
    mov r0, #0x24
    ldr r1, [r1, #0x8]
    mla r0, r2, r0, r1
    ldrh r0, [r0, #0x4]
    str r0, [r4, #0x384]
L_021fe860:
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    add r0, r4, #0xb8
    ble L_021fe87c
    mov r1, #0x0
    bl func_02095988
    b L_021fe884
L_021fe87c:
    mov r1, #0x1
    bl func_02095988
L_021fe884:
    ldr r2, [r4, #0x388]
    cmp r2, #0x0
    blt L_021fe8a8
    ldr r1, [r4, #0x37c]
    mov r0, #0x24
    ldr r1, [r1, #0x8]
    mla r0, r2, r0, r1
    ldrh r0, [r0, #0x4]
    str r0, [r4, #0x38c]
L_021fe8a8:
    ldr r0, [r4, #0x38c]
    cmp r0, #0x0
    add r0, r4, #0x164
    ble L_021fe8c4
    mov r1, #0x2
    bl func_02095988
    b L_021fe8cc
L_021fe8c4:
    mov r1, #0x3
    bl func_02095988
L_021fe8cc:
    ldr r5, [r4, #0x384]
    mov r1, #0xa
    mov r0, r5
    bl func_020befec
    add r1, r0, #0x8
    ldr r0, [r4, #0xa8]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r5
    mov r1, #0xa
    bl func_020befec
    mov r5, r1
    add r1, r5, #0x8
    ldr r0, [r4, #0xac]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r5, [r4, #0x38c]
    mov r1, #0xa
    mov r0, r5
    bl func_020befec
    add r0, r0, #0x8
    and r1, r0, #0xff
    ldr r0, [r4, #0xb0]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r5
    mov r1, #0xa
    bl func_020befec
    mov r5, r1
    add r1, r5, #0x8
    ldr r0, [r4, #0xb4]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r3, r4, r5, pc}
L_021fe950: .word 0x165
.size func_ov030_021fe808, .-func_ov030_021fe808
