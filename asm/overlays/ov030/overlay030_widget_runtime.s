.text

/* Exact fallback; see src/overlays/ov030/overlay030_widget_runtime.c. */
.extern gFx32CosSinTable
.extern data_020f4e14
.extern func_02070958
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteRenderer_QueueStatePaletteUploads
.extern GraphicsSpriteRenderer_SetTextGridPosition
.extern func_02091e1c
.extern func_020958d8
.extern func_020befec
.extern func_ov030_021fcf18
.extern Heap_Free


    .global func_ov030_021fd27c
func_ov030_021fd27c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1b0]
    cmp r0, #0x0
    beq L_021fd294
    bl Heap_Free
L_021fd294:
    ldr r0, [r4, #0x28]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x2c]
    bl GraphicsSpriteGroup_Destroy
    mov r1, #0x0
    ldr r0, [r4, #0x0]
    mov r2, r1
    bl GraphicsSpriteRenderer_SetTextGridPosition
    add r0, r4, #0x1e8
    bl func_02091e1c
    add r0, r4, #0x1e0
    bl func_02091e1c
    add r0, r4, #0x1d8
    bl func_02091e1c
    add r0, r4, #0x1d0
    bl func_02091e1c
    add r0, r4, #0x104
    bl func_ov030_021fcf18
    add r0, r4, #0x58
    bl func_ov030_021fcf18
    add r0, r4, #0x1c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x10
    bl AnimationResourceState_Destroy
    add r0, r4, #0x4
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov030_021fd27c, .-func_ov030_021fd27c
    .global func_ov030_021fd304
func_ov030_021fd304:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c8]
    ldr r1, L_021fd3e0
    add r0, r0, #0x1000
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r2, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r1, [r1, r0]
    str r2, [r4, #0x1c8]
    ldr r0, [r4, #0x8]
    mov r2, r1, lsl #0x7
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r3, r1, asr #0xc
    add r1, r3, #0x180
    mov r2, r1
    add r3, r3, #0x180
    bl func_02070958
    mov r2, #0x0
    b L_021fd38c
L_021fd35c:
    add r0, r4, r2, lsl #0x2
    ldr r1, [r0, #0x34]
    ldrh r0, [r1, #0x24]
    and r0, r0, #0x4
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne L_021fd388
    ldr r0, L_021fd3e4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    b L_021fd394
L_021fd388:
    add r2, r2, #0x1
L_021fd38c:
    cmp r2, #0x7
    blt L_021fd35c
L_021fd394:
    add r0, r4, #0x58
    bl func_020958d8
    add r0, r4, #0x104
    bl func_020958d8
    ldr r2, [r4, #0x1c4]
    ldr r0, [r4, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x18]
    rsb r2, r2, #0x0
    str r2, [r0, #0x1c]
    ldr r2, [r4, #0x1c4]
    ldr r0, [r4, #0x0]
    rsb r2, r2, #0x0
    bl GraphicsSpriteRenderer_SetTextGridPosition
    ldr r0, [r4, #0x28]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x2c]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
L_021fd3e0: .word gFx32CosSinTable
L_021fd3e4: .word data_020f4e14
.size func_ov030_021fd304, .-func_ov030_021fd304
    .global func_ov030_021fd3e8
func_ov030_021fd3e8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x1b4]
    mov r1, #0xa
    mov r0, r4
    bl func_020befec
    add r1, r0, #0x8
    ldr r0, [r5, #0x50]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r4
    mov r1, #0xa
    bl func_020befec
    mov r4, r1
    add r1, r4, #0x8
    ldr r0, [r5, #0x54]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov030_021fd3e8, .-func_ov030_021fd3e8
