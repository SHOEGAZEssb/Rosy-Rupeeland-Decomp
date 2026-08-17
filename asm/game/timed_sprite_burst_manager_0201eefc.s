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
.extern TimedSpritePresentation_InitBase
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

.global TimedSpriteBurstManager_Init
.type TimedSpriteBurstManager_Init, @function

TimedSpriteBurstManager_Init: ; 0x0201eefc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x44
    mov r10, r0
    mov r4, r1
    mov r5, r2
    bl TimedSpritePresentation_InitBase
    ldr r0, .L_0201f09c
    mov r1, #0x0
    str r0, [r10, #0x0]
    str r1, [r10, #0x8]
    str r1, [r10, #0xc]
    add r0, sp, #0xc
    str r1, [r10, #0x14]
    bl TimedSpriteConfig_InitTracks
    ldr r0, .L_0201f0a0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x10]
    str r0, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x28]
    mov r0, #0x2
    str r0, [sp, #0x40]
    mov r0, #0x12c
    str r0, [sp, #0x3c]
    mov r1, r5
    add r0, r10, #0x8
    bl OwnedPointerArray_Resize
    ldr r1, [r4, #0x8]
    ldmia r4, {r3, r5}
    ldr r2, [r4, #0xc]
    sub r1, r1, r3
    sub r2, r2, r5
    mov r1, r1, lsl #0x3
    mov r2, r2, lsl #0x3
    add r1, r1, r3, lsl #0x4
    add r2, r2, r5, lsl #0x4
    add r0, sp, #0x0
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    bl TouchPoint_Init
    mov r9, #0x0
    add r11, sp, #0xc
    ldr r8, .L_0201f0a4
    mov r7, #0x2c
    ldr r6, .L_0201f0a8
    mov r5, #0x4
    ldr r4, .L_0201f0ac
    b .L_0201f06c
.L_0201efcc:
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    and r0, r1, #0x7
    add r2, r0, #0xc
    mov r0, r1, asr #0x4
    mov r3, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r1, [r8, r0]
    add r0, r8, r3, lsl #0x1
    ldrsh r0, [r0, #0x2]
    mov r1, r1, asr #0x3
    mul r1, r2, r1
    rsb r1, r1, #0x0
    mov r0, r0, asr #0x3
    mul r0, r2, r0
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r3, [sp, #0x4]
    ldr r2, [sp, #0x8]
    add r1, r3, r1
    add r0, r2, r0
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0201f050
    mov r1, r11
    bl func_0201e454
.L_0201f050:
    ldr r2, [r10, #0x8]
    mov r1, #0x1
    str r0, [r2, r9, lsl #0x2]
    ldr r0, [r10, #0x8]
    ldr r0, [r0, r9, lsl #0x2]
    bl TimedSpritePresentation_SetVisible
    add r9, r9, #0x1
.L_0201f06c:
    ldr r0, [r10, #0xc]
    cmp r9, r0
    blt .L_0201efcc
    mov r1, #0x12c
    add r0, sp, #0x2c
    str r1, [r10, #0x24]
    bl VecFx32Object_Destroy
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
    mov r0, r10
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0201f09c: .word gTimedSpriteBurstManagerVtable
.L_0201f0a0: .word gDebugFont
.L_0201f0a4: .word data_020c9670
.L_0201f0a8: .word gTimedSpritePresentationAllocationTag
.L_0201f0ac: .word gHeapContext
    .size TimedSpriteBurstManager_Init, .-TimedSpriteBurstManager_Init

