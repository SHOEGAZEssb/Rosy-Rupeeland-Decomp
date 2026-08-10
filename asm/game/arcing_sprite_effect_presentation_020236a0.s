; Matching retail form; see src/game/arcing_sprite_effect_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern Sound_Play
.extern data_020c9670
.extern data_020d6740
.extern data_020d6760
.extern data_02105610
.extern VecFx32Object_Destroy
.extern AnimationResource_Init
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern GraphicsSpriteState_Create
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern VecFx32Triple_InitWithValues
.extern func_02008378
.extern func_0201e250
.extern func_0201e28c
.extern func_020233c8
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReleaseState
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_020befec
.extern gHeapContext
.extern gSoundContext

.global func_020236a0
    .type func_020236a0, @function
func_020236a0: ; 0x020236a0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    mov r4, r0
    ldrsh r0, [r4, #0x18]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02023858
.L_020236bc: ; jump table
    b .L_020236cc ; case 0
    b .L_02023798 ; case 1
    b .L_02023808 ; case 2
    b .L_02023858 ; case 3
.L_020236cc:
    ldrsh r0, [r4, #0x14]
    ldrsh r1, [r4, #0x16]
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    ldr r1, [r4, #0x1c]
    add r0, sp, #0x4
    bl VecFx32Bezier_Evaluate3D
    ldrsh r0, [r4, #0x14]
    ldrsh r1, [r4, #0x16]
    mov r0, r0, lsl #0xf
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x2
    ldr r1, .L_02023884
    ldrsh r3, [r4, #0x1a]
    ldrsh r1, [r1, r2]
    ldr ip, [sp, #0x10]
    mov r0, #0x8
    smlabb r1, r3, r1, ip
    str r1, [sp, #0x10]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x10]
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x10]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldrsh r0, [r4, #0x14]
    add r0, r0, #0x1
    strh r0, [r4, #0x14]
    ldrsh r1, [r4, #0x16]
    ldrsh r0, [r4, #0x14]
    cmp r0, r1
    ble .L_0202378c
    strh r1, [r4, #0x14]
    ldrb r0, [r4, #0x20]
    cmp r0, #0x0
    movne r0, #0x1
    strneh r0, [r4, #0x18]
    bne .L_0202378c
    ldr r2, [r4, #0x10]
    mov r0, #0x3
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x8
    strh r1, [r2, #0x24]
    strh r0, [r4, #0x18]
.L_0202378c:
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    b .L_02023858
.L_02023798:
    ldr r3, [r4, #0xc]
    ldr r1, [r4, #0x10]
    ldr r0, [r3, #0xc]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldmib r3, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r4, #0x10]
    mov r1, #0x2
    ldrh r2, [r3, #0x24]
    ldr r0, .L_02023888
    bic r2, r2, #0x3
    strh r2, [r3, #0x24]
    strh r1, [r4, #0x18]
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02023808
    ldr r0, .L_0202388c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl Sound_Play
    ldr r0, .L_02023888
    mov r1, #0xa
    strb r1, [r0, #0x0]
.L_02023808:
    ldr r3, [r4, #0x1c]
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x10]
    ldr r1, [r3, #0x14]
    ldr r2, [r3, #0x18]
    ldr r3, [r3, #0x1c]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r0, [r4, #0x10]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02023858
    mov r0, #0x3
    strh r0, [r4, #0x18]
    ldr r1, [r4, #0x10]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x8
    strh r0, [r1, #0x24]
.L_02023858:
    ldr r0, .L_02023888
    ldrb r1, [r0, #0x0]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneb r1, [r0, #0x0]
    ldrsh r0, [r4, #0x18]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
.L_02023884: .word data_020c9670
.L_02023888: .word data_02105610
.L_0202388c: .word gSoundContext
    .size func_020236a0, .-func_020236a0

