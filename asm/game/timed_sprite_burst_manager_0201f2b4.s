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
.extern data_021052fc
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

.global TimedSpriteBurstManager_Update
.type TimedSpriteBurstManager_Update, @function

TimedSpriteBurstManager_Update: ; 0x0201f2b4
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r1, .L_0201f374
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_GetPosition
    mov r1, r0
    add r0, sp, #0x0
    bl VecFx32Object_InitCopy
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_0201f2f8
    cmp r0, #0x1
    beq .L_0201f348
    b .L_0201f358
.L_0201f2f8:
    mov r6, #0x0
    add r5, sp, #0x0
    b .L_0201f320
.L_0201f304:
    ldr r0, [r4, #0x8]
    mov r1, r5
    ldr r0, [r0, r6, lsl #0x2]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x8]
    blx r2
    add r6, r6, #0x1
.L_0201f320:
    ldr r0, [r4, #0xc]
    cmp r6, r0
    blt .L_0201f304
    ldr r0, [r4, #0x24]
    subs r0, r0, #0x1
    str r0, [r4, #0x24]
    ldrmi r0, [r4, #0x14]
    addmi r0, r0, #0x1
    strmi r0, [r4, #0x14]
    b .L_0201f358
.L_0201f348:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_0201f36c
.L_0201f358:
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_AdvanceAnimations
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_0201f36c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0201f374: .word data_021052fc
    .size TimedSpriteBurstManager_Update, .-TimedSpriteBurstManager_Update

