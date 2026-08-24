; Matching retail form; see src/game/timed_sprite_burst_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern TouchPoint_Init
.extern data_020c9670
.extern gTimedSpritePointerArrayAllocationTag
.extern gTimedSpriteBurstManagerVtable
.extern gTimedSpritePresentationAllocationTag
.extern data_020f4e18
.extern gGamePhaseRuntime
.extern func_02003e20
.extern func_02003e38
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotion_GetPosition
.extern FieldEffect_Init
.extern TimedSpritePresentation_SetVisible
.extern func_0201e454
.extern TimedSpriteBurstManager_Init
.extern OwnedPointerArray_Destroy
.extern OwnedPointerArray_Clear
.extern TimedSpriteConfig_InitTracks
.extern OwnedPointerArray_Resize
.extern TimedSpriteBurstManager_Destroy
.extern TimedSpriteBurstManager_DestroyAndFree
.extern TimedSpriteBurstManager_Update
.extern func_02071bdc
.extern func_02071c38
.extern func_02071c94
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont
.extern gHeapContext
.extern genrand_int32

.global TimedSpriteBurstManager_Destroy
.type TimedSpriteBurstManager_Destroy, @function

TimedSpriteBurstManager_Destroy: ; 0x0201f15c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0201f1f8
    mov r4, r0
    str r1, [r4, #0x0]
    mov r5, #0x0
    b .L_0201f194
.L_0201f174:
    ldr r0, [r4, #0x8]
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_0201f190
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201f190:
    add r5, r5, #0x1
.L_0201f194:
    ldr r0, [r4, #0xc]
    cmp r5, r0
    blt .L_0201f174
    add r0, r4, #0x8
    bl OwnedPointerArray_Clear
    ldr r0, .L_0201f1fc
    ldr r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, .L_0201f200
    ldr r1, [r4, #0x18]
    ldr r0, [r0, #0x0]
    bl func_02071bdc
    ldr r0, .L_0201f200
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, .L_0201f200
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x0]
    bl func_02071c94
    add r0, r4, #0x8
    bl OwnedPointerArray_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0201f1f8: .word gTimedSpriteBurstManagerVtable
.L_0201f1fc: .word gDebugFont
.L_0201f200: .word data_020f4e18
    .size TimedSpriteBurstManager_Destroy, .-TimedSpriteBurstManager_Destroy

