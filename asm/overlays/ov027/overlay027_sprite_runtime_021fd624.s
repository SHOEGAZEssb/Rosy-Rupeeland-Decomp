.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_runtime.c. */
.extern data_ov027_021fe8ac
.extern GraphicsAnimationInstance_SetAnimation
.extern func_02094cf0
.extern func_02094dd4
.extern func_02095224
.extern func_ov027_021fd3f0
.extern func_ov027_021fd4dc


    .global func_ov027_021fd624
func_ov027_021fd624:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021fd704
L_021fd63c: ; jump table
    b L_021fd64c ; case 0
    b L_021fd698 ; case 1
    b L_021fd6d0 ; case 2
    b L_021fd6fc ; case 3
L_021fd64c:
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    beq L_021fd684
    ldr r0, [r4, #0x9c]
    mov r1, #0xc
    bl GraphicsAnimationInstance_SetAnimation
    ldr r1, L_021fd714
    mov r0, r4
    mov r2, #0x0
    bl func_02094cf0
    ldr r0, [r4, #0xb8]
    add r0, r0, #0x1
    str r0, [r4, #0xb8]
    b L_021fd704
L_021fd684:
    mov r0, r4
    mov r1, #0x100
    mov r2, #0x0
    bl func_ov027_021fd4dc
    b L_021fd704
L_021fd698:
    bl func_02095224
    cmp r0, #0x0
    beq L_021fd704
    ldr r0, [r4, #0x9c]
    mov r1, #0x0
    bl GraphicsAnimationInstance_SetAnimation
    mov r0, #0x78
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xb8]
    add r0, r0, #0x1
    str r0, [r4, #0xb8]
    b L_021fd704
L_021fd6d0:
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    ldrne r0, [r4, #0xb8]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb8]
    bne L_021fd704
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x100
    bl func_ov027_021fd4dc
    b L_021fd704
L_021fd6fc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd704:
    mov r0, r4
    bl func_02094dd4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd714: .word data_ov027_021fe8ac
.size func_ov027_021fd624, .-func_ov027_021fd624

