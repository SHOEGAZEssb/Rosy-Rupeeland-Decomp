; Matching retail form; see src/game/arcing_sprite_effect_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern Sound_Play
.extern data_020c9670
.extern data_020d6740
.extern gArcingSpriteEffectAllocationTag
.extern data_02105610
.extern VecFx32Object_Destroy
.extern AnimationResource_Init
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern GraphicsSpriteState_Create
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern VecFx32Triple_InitWithValues
.extern VecFx32Object_InitSum
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern VecFx32Object_ScaleRounded
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReleaseState
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_020befec
.extern gHeapContext
.extern gSoundContext

.global func_020235a0
    .type func_020235a0, @function
func_020235a0: ; 0x020235a0
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02023618
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r1, [r5, #0x10]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r4, [r5, #0x1c]
    cmp r4, #0x0
    beq .L_020235d8
    mov r0, r4
    bl VecFx32Triple_Destroy
    mov r0, r4
    bl Heap_Free
.L_020235d8:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_020235f0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020235f0:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_02023608
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02023608:
    mov r0, r5
    bl FieldEffect_DestroyBase
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02023618: .word data_020d6740
    .size func_020235a0, .-func_020235a0

