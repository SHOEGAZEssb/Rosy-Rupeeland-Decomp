; Matching retail form; see src/game/timed_sprite_auxiliary_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern gAuxiliaryTimedSpritePresentationVtable
.extern gTimedSpriteAuxiliaryAllocationTag
.extern gGamePhaseRuntime
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern AnimationResource_Init
.extern ActorMotionAreaFollower_GetPosition
.extern RuntimePresentationManager_AppendFirstListEffect
.extern FieldEffect_Init
.extern OffsetTimedSprite_Init
.extern TimedSpriteConfig_InitTracks
.extern gHeapContext

.global AuxiliaryTimedSpritePresentation_Init
    .type AuxiliaryTimedSpritePresentation_Init, @function
AuxiliaryTimedSpritePresentation_Init: ; 0x0201f864
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x38
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl FieldEffect_Init
    ldr r0, .L_0201f994
    ldr r1, .L_0201f998
    ldr r3, .L_0201f99c
    str r0, [r4, #0x0]
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0201f8b4
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r1, r5
    bl AnimationResource_Init
.L_0201f8b4:
    str r0, [r4, #0xc]
    add r0, sp, #0x0
    bl TimedSpriteConfig_InitTracks
    str r6, [sp, #0x0]
    ldr r1, [r4, #0xc]
    add r0, sp, #0x10
    ldr r2, [r1, #0x4]
    mov r1, r7
    str r2, [sp, #0x4]
    ldr r2, [r4, #0xc]
    ldr r2, [r2, #0x8]
    str r2, [sp, #0x8]
    ldr r2, [r4, #0xc]
    ldr r2, [r2, #0xc]
    str r2, [sp, #0xc]
    bl VecFx32Object_Assign
    mov r2, #0x0
    mov r3, #0x2
    mov r0, #0x78
    str r3, [sp, #0x34]
    str r0, [sp, #0x30]
    ldr r1, .L_0201f998
    ldr r3, .L_0201f99c
    mov r0, #0x30
    str r2, [sp, #0x28]
    str r2, [sp, #0x24]
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0201f940
    ldr r2, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    add r1, sp, #0x0
    and r2, r2, #0xff
    bl OffsetTimedSprite_Init
.L_0201f940:
    ldr r1, [sp, #0x64]
    str r0, [r4, #0x8]
    mov r2, #0x78
    ldr r0, [sp, #0x60]
    strh r2, [r4, #0x10]
    strh r0, [r4, #0x12]
    cmp r1, #0x0
    beq .L_0201f978
    ldr r0, .L_0201f9a0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
.L_0201f978:
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0201f994: .word gAuxiliaryTimedSpritePresentationVtable
.L_0201f998: .word gTimedSpriteAuxiliaryAllocationTag
.L_0201f99c: .word gHeapContext
.L_0201f9a0: .word gGamePhaseRuntime
    .size AuxiliaryTimedSpritePresentation_Init, .-AuxiliaryTimedSpritePresentation_Init
