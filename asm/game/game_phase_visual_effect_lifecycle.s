; Matching retail form; see src/game/game_phase_visual_effect_lifecycle.c.
.text
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern Heap_Free
.extern gGamePhaseVisualEffectVTable
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Stepper_Init
.extern VecFx32Stepper_Destroy
.extern GraphicsResourceSet_ReleaseHandles

    .global GamePhaseVisualEffect_Init
GamePhaseVisualEffect_Init: ; 0x0200fa40
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_0200fb2c
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl GraphicsResourceSet_Init
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    strh r0, [r4, #0x1c]
    mov r1, #0x1f
    add r0, r4, #0x20
    strh r1, [r4, #0x1e]
    bl VecFx32Object_Init
    add r0, r4, #0x30
    bl VecFx32Object_Init
    add r0, r4, #0x40
    bl VecFx32Object_Init
    add r0, r4, #0x50
    bl VecFx32Object_Init
    add r0, r4, #0x60
    bl VecFx32Stepper_Init
    ldr r1, [r4, #0x94]
    mov r0, #0x0
    bic r3, r1, #0x1
    bic r1, r3, #0x2
    bic r2, r1, #0x4
    orr r1, r2, #0x8
    bic r1, r1, #0xf0
    str r1, [r4, #0x94]
    str r0, [r4, #0x98]
    ldrsh r0, [r4, #0x9c]
    ldr r1, L_0200fb30
    bic r0, r0, #0xf
    strh r0, [r4, #0x9c]
    ldrsh r0, [r4, #0x9c]
    and r0, r0, r1
    strh r0, [r4, #0x9c]
    ldrsh r0, [r4, #0x9e]
    bic r0, r0, #0xf
    strh r0, [r4, #0x9e]
    ldrsh r0, [r4, #0x9e]
    and r0, r0, r1
    strh r0, [r4, #0x9e]
    ldrsh r0, [r4, #0xa0]
    bic r0, r0, #0xf
    strh r0, [r4, #0xa0]
    ldrsh r2, [r4, #0xa0]
    mov r0, r4
    and r2, r2, r1
    strh r2, [r4, #0xa0]
    ldrsh r2, [r4, #0xa2]
    bic r2, r2, #0xf
    strh r2, [r4, #0xa2]
    ldrsh r2, [r4, #0xa2]
    and r1, r2, r1
    strh r1, [r4, #0xa2]
    ldmia sp!, {r4, pc}
L_0200fb2c: .word gGamePhaseVisualEffectVTable
L_0200fb30: .word 0xffff000f
    .size GamePhaseVisualEffect_Init, . - GamePhaseVisualEffect_Init

    .global GamePhaseVisualEffect_Destroy
GamePhaseVisualEffect_Destroy: ; 0x0200fb34
    stmdb sp!, {r4, lr}
    ldr r1, L_0200fbc4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x94]
    add r0, r4, #0x4
    bic r1, r1, #0x1
    str r1, [r4, #0x94]
    mov r1, #0x0
    str r1, [r4, #0x18]
    bl GraphicsResourceSet_ReleaseHandles
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x60
    strh r1, [r2, #0x50]
    bl VecFx32Stepper_Destroy
    add r0, r4, #0x50
    bl VecFx32Object_Destroy
    add r0, r4, #0x40
    bl VecFx32Object_Destroy
    add r0, r4, #0x30
    bl VecFx32Object_Destroy
    add r0, r4, #0x20
    bl VecFx32Object_Destroy
    add r0, r4, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200fbc4: .word gGamePhaseVisualEffectVTable
    .size GamePhaseVisualEffect_Destroy, . - GamePhaseVisualEffect_Destroy

    .global GamePhaseVisualEffect_DestroyAndFree
GamePhaseVisualEffect_DestroyAndFree: ; 0x0200fbc8
    stmdb sp!, {r4, lr}
    ldr r1, L_0200fc60
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x94]
    add r0, r4, #0x4
    bic r1, r1, #0x1
    str r1, [r4, #0x94]
    mov r1, #0x0
    str r1, [r4, #0x18]
    bl GraphicsResourceSet_ReleaseHandles
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x60
    strh r1, [r2, #0x50]
    bl VecFx32Stepper_Destroy
    add r0, r4, #0x50
    bl VecFx32Object_Destroy
    add r0, r4, #0x40
    bl VecFx32Object_Destroy
    add r0, r4, #0x30
    bl VecFx32Object_Destroy
    add r0, r4, #0x20
    bl VecFx32Object_Destroy
    add r0, r4, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200fc60: .word gGamePhaseVisualEffectVTable
    .size GamePhaseVisualEffect_DestroyAndFree, . - GamePhaseVisualEffect_DestroyAndFree
