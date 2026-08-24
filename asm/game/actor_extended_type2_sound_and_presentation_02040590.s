; Matching retail form; see src/game/actor_extended_type2_sound_and_presentation.c.
.text
.extern Heap_Alloc
.extern gActorExtendedType2SpritePresentationAllocationTag
.extern data_020e7444
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_AppendFirstListEffect
.extern TimedSpriteOffsetPresentation_Init
.extern Actor_PlayHorizontalSpatialSound
.extern gHeapContext
.global ActorExtendedType2_PlayDescriptorSoundIfEnabled
.type ActorExtendedType2_PlayDescriptorSoundIfEnabled, @function
ActorExtendedType2_PlayDescriptorSoundIfEnabled: ; 0x02040590
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x4e]
    ldr r1, .L_020405c4
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, [r0, #0x10]
    tst r2, #0x4
    ldmeqia sp!, {r3, pc}
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    ldmia sp!, {r3, pc}
.L_020405c4: .word data_020e7444
.size ActorExtendedType2_PlayDescriptorSoundIfEnabled, . - ActorExtendedType2_PlayDescriptorSoundIfEnabled
.global ActorExtendedType2_SpawnOptionalPresentation
.type ActorExtendedType2_SpawnOptionalPresentation, @function

ActorExtendedType2_SpawnOptionalPresentation: ; 0x020405c8
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    ldr r0, [r7, #0x214]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    cmp r0, #0x0
    beq .L_02040668
    ldr r1, .L_02040670
    ldr r3, .L_02040674
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_02040648
    ldr lr, [r7, #0x214]
    mvn r3, #0x0
    ldr r2, [lr, #0x4]
    add r1, r7, #0x18
    str r2, [sp, #0x0]
    ldr ip, [lr, #0x8]
    and r2, r6, #0xff
    str ip, [sp, #0x4]
    ldr r6, [lr, #0xc]
    str r6, [sp, #0x8]
    str r4, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r3, [r7, #0x54]
    ldr r3, [r3, #0x0]
    bl TimedSpriteOffsetPresentation_Init
    mov r1, r0
.L_02040648:
    ldr r2, [r1, #0x8]
    ldr r0, .L_02040678
    ldr r2, [r2, #0x4]
    strh r5, [r2, #0x36]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
.L_02040668:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02040670: .word gActorExtendedType2SpritePresentationAllocationTag
.L_02040674: .word gHeapContext
.L_02040678: .word gGamePhaseRuntime
.size ActorExtendedType2_SpawnOptionalPresentation, . - ActorExtendedType2_SpawnOptionalPresentation

