; Matching retail form; see src/game/timed_sprite_attached_variant.c.
.text
.extern Heap_Free
.extern TimedSpritePresentation_Init
.extern TimedSpritePresentation_DestroyBase
.extern TimedSpritePresentation_SetVisible
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern VecFx32_Subtract
.extern CPoint2DS16_InitFromRectangle
.extern func_020adae4
.extern func_020ae024
.extern GraphicsSpriteState_SetAnimationIndex
.extern gFx32CosSinTable
.extern data_020d6138
.global func_0201e6e4
.type func_0201e6e4, @function
func_0201e6e4: ; 0x0201e6e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r2
    mov r4, r1
    mov r1, r7
    mov r5, r0
    mov r6, r3
    bl TimedSpritePresentation_Init
    ldr r1, .L_0201e760
    mov r0, #0x0
    str r1, [r5, #0x0]
    str r0, [r5, #0x30]
    mov r2, #0x1800
    add r0, r5, #0x8
    add r1, r7, #0x10
    str r2, [r5, #0x34]
    bl VecFx32Object_Assign
    add r0, r5, #0x18
    add r1, r7, #0x20
    bl VecFx32Object_Assign
    ldr r0, [r7, #0x30]
    mov r1, r6
    str r0, [r5, #0x28]
    ldr r2, [r5, #0x4]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r5
    str r4, [r5, #0x2c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0201e760: .word data_020d6138
    .size func_0201e6e4, .-func_0201e6e4

.global func_0201e764
.type func_0201e764, @function
func_0201e764: ; 0x0201e764
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201e764, .-func_0201e764

.global func_0201e778
.type func_0201e778, @function
func_0201e778: ; 0x0201e778
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TimedSpritePresentation_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201e778, .-func_0201e778

.global func_0201e794
.type func_0201e794, @function
func_0201e794: ; 0x0201e794
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0x0]
    mov r5, r0
    ldr r2, [r2, #0xc]
    mov r4, r1
    blx r2
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0201e794, .-func_0201e794

.global func_0201e7d0
.type func_0201e7d0, @function
func_0201e7d0: ; 0x0201e7d0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x28]
    subs r1, r1, #0x1
    str r1, [r4, #0x28]
    bpl .L_0201e7fc
    mov r1, #0x0
    bl TimedSpritePresentation_SetVisible
    mov r0, #0x1
    b .L_0201e838
.L_0201e7fc:
    ldr r1, [r4, #0x2c]
    add r0, sp, #0x0
    add r1, r1, #0x68
    bl CPoint2DS16_InitFromRectangle
    mov r0, r4
    ldr r3, [r0, #0x0]
    ldr r1, [r4, #0x2c]
    ldr r3, [r3, #0x14]
    add r2, sp, #0x0
    add r1, r1, #0x18
    blx r3
    add r0, r4, #0x8
    add r1, r4, #0x18
    bl VecFx32Object_Add
    mov r0, #0x0
.L_0201e838:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    .size func_0201e7d0, .-func_0201e7d0

.global func_0201e840
.type func_0201e840, @function
func_0201e840: ; 0x0201e840
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x14]
    ldr r2, [r4, #0x30]
    mov r0, #0x8
    add r2, r3, r2
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    ldr r2, [r4, #0xc]
    ldr r3, [r4, #0x10]
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x28]
    strh r0, [r1, #0x28]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    .size func_0201e840, .-func_0201e840

.global func_0201e888
.type func_0201e888, @function
func_0201e888: ; 0x0201e888
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r3, [r5, #0x1c]
    mov r0, #0x5f
    mul r0, r3, r0
    mov r6, r1
    mov r1, #0x64
    mov r4, r2
    bl func_020adae4
    str r0, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    mov r0, #0x5f
    mul r0, r1, r0
    mov r1, #0x64
    bl func_020adae4
    str r0, [r5, #0x20]
    add r0, sp, #0x0
    mov r1, r6
    add r2, r5, #0x8
    bl VecFx32_Subtract
    ldrsh r0, [r4, #0x6]
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0x4]
    add ip, r1, r0, lsl #0xc
    str ip, [sp, #0x8]
    ldrsh r1, [r4, #0x4]
    smull r3, r0, ip, ip
    add r1, r2, r1, lsl #0xc
    smlal r3, r0, r1, r1
    str r1, [sp, #0x4]
    mov r0, r0, lsl #0x2
    ldr r2, .L_0201e9cc
    mov r1, #0x1
    strh r1, [r2, #0x0]
    mov r1, r3, lsl #0x2
    str r1, [r2, #0x8]
    orr r0, r0, r3, lsr #0x1e
    str r0, [r2, #0xc]
.L_0201e924:
    ldrh r0, [r2, #0x0]
    tst r0, #0x8000
    bne .L_0201e924
    ldr r0, .L_0201e9d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    cmp r0, #0x4000
    ble .L_0201e9bc
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r4, r0, lsl #0x1
    add r0, r4, #0x1
    ldr r3, .L_0201e9d4
    mov r0, r0, lsl #0x1
    ldrsh r2, [r3, r0]
    ldr r1, [r5, #0x34]
    mov r0, r4, lsl #0x1
    smull r4, r1, r2, r1
    adds r2, r4, #0x800
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    ldr r4, [r5, #0x1c]
    orr r2, r2, r1, lsl #0x14
    add r1, r4, r2
    str r1, [r5, #0x1c]
    ldrsh r1, [r3, r0]
    ldr r0, [r5, #0x34]
    ldr r3, [r5, #0x20]
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [r5, #0x20]
.L_0201e9bc:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0201e9cc: .word 0x40002b0
.L_0201e9d0: .word 0x40002b4
.L_0201e9d4: .word gFx32CosSinTable
    .size func_0201e888, .-func_0201e888
