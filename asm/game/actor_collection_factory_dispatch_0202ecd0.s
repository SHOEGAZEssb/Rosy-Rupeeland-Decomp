; Matching retail form; see src/game/actor_collection_factory_dispatch.c.
.text
.extern Heap_Alloc
.extern OS_Halt
.extern data_020def5c
.extern data_020e8380
.extern data_020ed470
.extern OverlaySlot_LoadOverlay
.extern ActorCollection_RegisterActor
.extern Actor_RefreshCachedTerrainHeight
.extern ActorDerivedType1_Init
.extern ActorDerivedRuntime_InitAlternate
.extern ActorMotionProbe_Init
.extern ActorModeNibble_Init
.extern ActorTableRecord_InitAlternate
.extern ActorRegisteredSubclass_Init
.extern ActorExtendedType2_InitDuplicate
.extern ActorExtendedType3_Init
.extern ActorExtendedTransform_InitDuplicate
.extern ActorExtendedTable_InitDuplicate
.extern ActorExtendedTableCyclic_Init
.extern Type7Actor_Init
.extern SingletonTrackingActor_Init
.extern RuntimeActorScriptVariant_InitAlternate
.extern IndexedStateActor_Init
.extern PresentationBackedActor_Init
.extern EffectHandleActor_Init
.extern func_0204e944
.extern GridEffectActor_Init
.extern TrackedResourceActorType21_Init
.extern TrackedResourceActorType22And25_Init
.extern TrackedResourceActorType24_Init
.extern TrackedResourceActorType26_Init
.extern TrackedResourceActorType27_Init
.extern TrackedResourceActorType28_Init
.extern func_020525b0
.extern func_02052680
.extern func_02052978
.extern func_02052a70
.extern func_02052ec0
.extern func_020533e0
.extern func_02055784
.extern func_02055eb0
.extern func_02056360
.extern func_02056580
.extern func_020567f4
.extern func_02056880
.extern func_02056be0
.extern func_020579b0
.extern func_ov075_02212ae0
.extern func_ov075_02212bb8
.extern func_ov075_0221352c
.extern func_ov075_0221461c
.extern func_ov075_02215068
.extern func_ov075_022159c4
.extern func_ov076_022137c8
.extern func_ov076_02213858
.extern func_ov076_022140a4
.extern func_ov077_02212b7c
.extern func_ov077_02213110
.extern func_ov078_02214090
.extern func_ov078_02215338
.extern func_ov080_02212af4
.extern func_ov081_02212c40
.extern func_ov081_02214008
.extern func_ov082_02213218
.extern func_ov082_022143b0
.extern func_ov083_02213748
.extern func_ov084_02213e94
.extern func_ov085_02212aec
.extern func_ov087_022177e0
.extern func_ov088_02217a3c
.extern func_ov088_0221b394
.extern func_ov088_0221b508
.extern func_ov089_022177e4
.extern func_ov092_02217940
.extern func_ov092_0221a838
.extern func_ov093_022177f0
.extern func_ov095_0221b23c
.extern func_ov095_0221c0b0
.extern func_ov095_0221c724
.extern func_ov096_02218310
.extern func_ov097_02217804
.extern func_ov097_022195f4
.extern func_ov097_02219d20
.extern gHeapContext

    .global ActorCollection_SpawnActorFromDescriptor
    .type ActorCollection_SpawnActorFromDescriptor, @function
ActorCollection_SpawnActorFromDescriptor: ; 0x0202ecd0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x30
    mov r5, r1
    ldrh r1, [r5, #0x0]
    mov r6, r0
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_02030a18
.L_0202ecf0: ; jump table
    b .L_02030a18 ; case 0
    b .L_0202ed18 ; case 1
    b .L_0202ed58 ; case 2
    b .L_0202fb84 ; case 3
    b .L_02030174 ; case 4
    b .L_020307d4 ; case 5
    b .L_0202f940 ; case 6
    b .L_0203083c ; case 7
    b .L_0203087c ; case 8
    b .L_020308bc ; case 9
.L_0202ed18:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2b8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202ed40
    mov r1, r5
    bl ActorDerivedType1_Init
    mov r4, r0
.L_0202ed40:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0202ed58:
    ldrh r2, [r5, #0x2]
    ldr r1, .L_0202fcb0
    mov r0, #0x30
    mla r3, r2, r0, r1
    add r2, sp, #0x0
    mov r1, #0x18
.L_0202ed70:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0202ed70
    ldrsb r7, [sp, #0x24]
    cmp r7, #0x23
    addls pc, pc, r7, lsl #0x2
    b .L_0202f900
.L_0202ed90: ; jump table
    b .L_0202ee20 ; case 0
    b .L_0202ef74 ; case 1
    b .L_0202efcc ; case 2
    b .L_0202f168 ; case 3
    b .L_0202f900 ; case 4
    b .L_0202eea0 ; case 5
    b .L_0202eef4 ; case 6
    b .L_0202ee4c ; case 7
    b .L_0202ef48 ; case 8
    b .L_0202f1e0 ; case 9
    b .L_0202f1e0 ; case 10
    b .L_0202f230 ; case 11
    b .L_0202f284 ; case 12
    b .L_0202f2dc ; case 13
    b .L_0202f330 ; case 14
    b .L_0202f384 ; case 15
    b .L_0202f3d8 ; case 16
    b .L_0202f42c ; case 17
    b .L_0202f4a4 ; case 18
    b .L_0202f1e0 ; case 19
    b .L_0202f51c ; case 20
    b .L_0202f56c ; case 21
    b .L_0202f5c0 ; case 22
    b .L_0202f614 ; case 23
    b .L_0202f668 ; case 24
    b .L_0202f6bc ; case 25
    b .L_0202f70c ; case 26
    b .L_0202f75c ; case 27
    b .L_0202f020 ; case 28
    b .L_0202f078 ; case 29
    b .L_0202f7b0 ; case 30
    b .L_0202f804 ; case 31
    b .L_0202f0f0 ; case 32
    b .L_0202f2b0 ; case 33
    b .L_0202f858 ; case 34
    b .L_0202f8ac ; case 35
.L_0202ee20:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x298
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl ActorExtendedType2_InitDuplicate
    mov r4, r0
    b .L_0202f928
.L_0202ee4c:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcb4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202ee74
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202ee74:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02212ae0 ; func_ov076_02212ae0, func_ov077_02212ae0, func_ov078_02212ae0, func_ov079_02212ae0, func_ov080_02212ae0, func_ov081_02212ae0, func_ov082_02212ae0, func_ov083_02212ae0, func_ov084_02212ae0, func_ov085_02212ae0, func_ov086_02212ae0
    mov r4, r0
    b .L_0202f928
.L_0202eea0:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcb8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202eec8
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202eec8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x29c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02212ae0 ; func_ov076_02212ae0, func_ov077_02212ae0, func_ov078_02212ae0, func_ov079_02212ae0, func_ov080_02212ae0, func_ov081_02212ae0, func_ov082_02212ae0, func_ov083_02212ae0, func_ov084_02212ae0, func_ov085_02212ae0, func_ov086_02212ae0
    mov r4, r0
    b .L_0202f928
.L_0202eef4:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcb8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202ef1c
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202ef1c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2b4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov083_02213748 ; func_ov084_02213748, func_ov085_02213748
    mov r4, r0
    b .L_0202f928
.L_0202ef48:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2ac
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl ActorExtendedTransform_InitDuplicate
    mov r4, r0
    b .L_0202f928
.L_0202ef74:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcbc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202ef9c
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202ef9c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2c8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    mov r2, #0x1
    bl func_ov078_02214090
    mov r4, r0
    b .L_0202f928
.L_0202efcc:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcbc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202eff4
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202eff4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2c0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov078_02215338
    mov r4, r0
    b .L_0202f928
.L_0202f020:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcbc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f048
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f048:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2c8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    mov r2, #0x0
    bl func_ov078_02214090
    mov r4, r0
    b .L_0202f928
.L_0202f078:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcbc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f0a0
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f0a0:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f0c4
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f0c4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2e8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov097_02217804
    mov r4, r0
    b .L_0202f928
.L_0202f0f0:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcbc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f118
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f118:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f13c
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f13c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x324
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov087_022177e0 ; func_ov088_022177e0, func_ov089_022177e0, func_ov090_022177e0, func_ov091_022177e0, func_ov092_022177e0, func_ov093_022177e0, func_ov094_022177e0, func_ov095_022177e0, func_ov096_022177e0, func_ov097_022177e0
    mov r4, r0
    b .L_0202f928
.L_0202f168:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcbc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f190
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f190:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f1b4
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f1b4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2c0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov097_022195f4
    mov r4, r0
    b .L_0202f928
.L_0202f1e0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x29c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f208
    mov r1, r5
    bl ActorExtendedType3_Init
    mov r4, r0
.L_0202f208:
    cmp r7, #0x9
    addeq r0, r4, #0x200
    moveq r1, #0x0
    streqh r1, [r0, #0x98]
    beq .L_0202f928
    cmp r7, #0xa
    addeq r0, r4, #0x200
    moveq r1, #0x1
    streqh r1, [r0, #0x98]
    b .L_0202f928
.L_0202f230:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcc8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f258
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f258:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x29c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02212ae0 ; func_ov076_02212ae0, func_ov077_02212ae0, func_ov078_02212ae0, func_ov079_02212ae0, func_ov080_02212ae0, func_ov081_02212ae0, func_ov082_02212ae0, func_ov083_02212ae0, func_ov084_02212ae0, func_ov085_02212ae0, func_ov086_02212ae0
    mov r4, r0
    b .L_0202f928
.L_0202f284:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl ActorExtendedTable_InitDuplicate
    mov r4, r0
    b .L_0202f928
.L_0202f2b0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2ac
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl ActorExtendedTableCyclic_Init
    mov r4, r0
    b .L_0202f928
.L_0202f2dc:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcb4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f304
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f304:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2ac
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov076_02213858 ; func_ov084_02213858
    mov r4, r0
    b .L_0202f928
.L_0202f330:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcc8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f358
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f358:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov082_02213218
    mov r4, r0
    b .L_0202f928
.L_0202f384:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fccc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f3ac
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f3ac:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2c0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_0221352c
    mov r4, r0
    b .L_0202f928
.L_0202f3d8:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fccc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f400
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f400:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02212bb8
    mov r4, r0
    b .L_0202f928
.L_0202f42c:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcd0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f454
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f454:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcd4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f478
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f478:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2c4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov077_02212b7c
    mov r4, r0
    b .L_0202f928
.L_0202f4a4:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcd0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f4cc
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f4cc:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcd4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f4f0
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f4f0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x30c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov077_02213110
    mov r4, r0
    b .L_0202f928
.L_0202f51c:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcd8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f540
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f540:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov087_022177e0 ; func_ov088_022177e0, func_ov089_022177e0, func_ov090_022177e0, func_ov091_022177e0, func_ov092_022177e0, func_ov093_022177e0, func_ov094_022177e0, func_ov095_022177e0, func_ov096_022177e0, func_ov097_022177e0
    mov r4, r0
    b .L_0202f928
.L_0202f56c:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcb4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f594
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f594:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x29c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov084_02213e94
    mov r4, r0
    b .L_0202f928
.L_0202f5c0:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcdc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f5e8
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f5e8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2d4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov076_022137c8 ; func_ov081_022137c8
    mov r4, r0
    b .L_0202f928
.L_0202f614:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcdc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f63c
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f63c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2ac
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02212ae0 ; func_ov076_02212ae0, func_ov077_02212ae0, func_ov078_02212ae0, func_ov079_02212ae0, func_ov080_02212ae0, func_ov081_02212ae0, func_ov082_02212ae0, func_ov083_02212ae0, func_ov084_02212ae0, func_ov085_02212ae0, func_ov086_02212ae0
    mov r4, r0
    b .L_0202f928
.L_0202f668:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcc8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f690
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f690:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x29c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov082_022143b0
    mov r4, r0
    b .L_0202f928
.L_0202f6bc:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f6e0
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f6e0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2ac
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov095_0221b23c
    mov r4, r0
    b .L_0202f928
.L_0202f70c:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcd8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f730
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f730:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2b0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov096_02218310
    mov r4, r0
    b .L_0202f928
.L_0202f75c:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fce0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f784
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f784:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov080_02212af4 ; func_ov081_02212af4
    mov r4, r0
    b .L_0202f928
.L_0202f7b0:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fccc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f7d8
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f7d8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2bc
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_022159c4
    mov r4, r0
    b .L_0202f928
.L_0202f804:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fccc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f82c
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f82c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2b8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02215068
    mov r4, r0
    b .L_0202f928
.L_0202f858:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcdc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f880
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f880:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov076_022140a4
    mov r4, r0
    b .L_0202f928
.L_0202f8ac:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fce4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f8d4
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f8d4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2ac
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl func_ov075_02212ae0 ; func_ov076_02212ae0, func_ov077_02212ae0, func_ov078_02212ae0, func_ov079_02212ae0, func_ov080_02212ae0, func_ov081_02212ae0, func_ov082_02212ae0, func_ov083_02212ae0, func_ov084_02212ae0, func_ov085_02212ae0, func_ov086_02212ae0
    mov r4, r0
    b .L_0202f928
.L_0202f900:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x298
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f928
    mov r1, r5
    bl ActorExtendedType2_InitDuplicate
    mov r4, r0
.L_0202f928:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0202f940:
    ldrh r0, [r5, #0x2]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_0202fb4c
.L_0202f950: ; jump table
    b .L_0202fb4c ; case 0
    b .L_0202f964 ; case 1
    b .L_0202f9fc ; case 2
    b .L_0202fa6c ; case 3
    b .L_0202fadc ; case 4
.L_0202f964:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcd0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f98c
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202f98c:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcd4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202f9b0
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202f9b0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x250
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202f9d8
    mov r1, r5
    bl func_ov087_022177e0 ; func_ov088_022177e0, func_ov089_022177e0, func_ov090_022177e0, func_ov091_022177e0, func_ov092_022177e0, func_ov093_022177e0, func_ov094_022177e0, func_ov095_022177e0, func_ov096_022177e0, func_ov097_022177e0
    mov r4, r0
.L_0202f9d8:
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0xe
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0202f9fc:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fce8
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fa20
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202fa20:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x23c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202fa48
    mov r1, r5
    bl func_ov087_022177e0 ; func_ov088_022177e0, func_ov089_022177e0, func_ov090_022177e0, func_ov091_022177e0, func_ov092_022177e0, func_ov093_022177e0, func_ov094_022177e0, func_ov095_022177e0, func_ov096_022177e0, func_ov097_022177e0
    mov r4, r0
.L_0202fa48:
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0xe
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0202fa6c:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcec
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fa90
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202fa90:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202fab8
    mov r1, r5
    bl func_ov092_02217940
    mov r4, r0
.L_0202fab8:
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0xe
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0202fadc:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcf0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fb00
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202fb00:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x250
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202fb28
    mov r1, r5
    bl func_ov093_022177f0
    mov r4, r0
.L_0202fb28:
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0xe
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0202fb4c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x1ec
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202fb74
    mov r1, r5
    bl RuntimeActorScriptVariant_InitAlternate
    mov r4, r0
.L_0202fb74:
    ldr r0, [r4, #0x14]
    orr r0, r0, #0xe
    str r0, [r4, #0x14]
    b .L_02030a1c
.L_0202fb84:
    ldrh r0, [r5, #0x2]
    cmp r0, #0x18
    addls pc, pc, r0, lsl #0x2
    b .L_02030158
.L_0202fb94: ; jump table
    b .L_0202fbf8 ; case 0
    b .L_0202fc24 ; case 1
    b .L_0202fbf8 ; case 2
    b .L_0202fc50 ; case 3
    b .L_0202fbf8 ; case 4
    b .L_0202fc7c ; case 5
    b .L_0202fcf8 ; case 6
    b .L_0202fd4c ; case 7
    b .L_0202fda0 ; case 8
    b .L_0202fdf4 ; case 9
    b .L_0202fe44 ; case 10
    b .L_0202fe94 ; case 11
    b .L_0202ff3c ; case 12
    b .L_0202ff6c ; case 13
    b .L_0202ff9c ; case 14
    b .L_0202ffcc ; case 15
    b .L_0203002c ; case 16
    b .L_0203005c ; case 17
    b .L_02030088 ; case 18
    b .L_0202fffc ; case 19
    b .L_0202fee8 ; case 20
    b .L_020300b4 ; case 21
    b .L_02030108 ; case 22
    b .L_0202fbf8 ; case 23
    b .L_0202fbf8 ; case 24
.L_0202fbf8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl ActorDerivedRuntime_InitAlternate
    mov r4, r0
    b .L_0203015c
.L_0202fc24:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x258
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl ActorMotionProbe_Init
    mov r4, r0
    b .L_0203015c
.L_0202fc50:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x218
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl SingletonTrackingActor_Init
    mov r4, r0
    b .L_0203015c
.L_0202fc7c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl IndexedStateActor_Init
    mov r4, r0
    b .L_0203015c
.L_0202fca8: .word data_020def5c
.L_0202fcac: .word gHeapContext
.L_0202fcb0: .word data_020e8380
.L_0202fcb4: .word 0x54
.L_0202fcb8: .word 0x53
.L_0202fcbc: .word 0x4e
.L_0202fcc0: .word 0x61
.L_0202fcc4: .word 0x5f
.L_0202fcc8: .word 0x52
.L_0202fccc: .word 0x4b
.L_0202fcd0: .word 0x4d
.L_0202fcd4: .word 0x5a
.L_0202fcd8: .word 0x60
.L_0202fcdc: .word 0x4c
.L_0202fce0: .word 0x50
.L_0202fce4: .word 0x56
.L_0202fce8: .word 0x5b
.L_0202fcec: .word 0x5c
.L_0202fcf0: .word 0x5d
.L_0202fcf4: .word 0x51
.L_0202fcf8:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcf4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fd20
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202fd20:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x244
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov081_02212c40
    mov r4, r0
    b .L_0203015c
.L_0202fd4c:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcf4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fd74
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202fd74:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x244
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov081_02212c40
    mov r4, r0
    b .L_0203015c
.L_0202fda0:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcf4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fdc8
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202fdc8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x244
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov081_02212c40
    mov r4, r0
    b .L_0203015c
.L_0202fdf4:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_02030a68
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fe18
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202fe18:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x230
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov087_022177e0 ; func_ov088_022177e0, func_ov089_022177e0, func_ov090_022177e0, func_ov091_022177e0, func_ov092_022177e0, func_ov093_022177e0, func_ov094_022177e0, func_ov095_022177e0, func_ov096_022177e0, func_ov097_022177e0
    mov r4, r0
    b .L_0203015c
.L_0202fe44:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_02030a6c
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202fe68
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0202fe68:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x248
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov089_022177e4
    mov r4, r0
    b .L_0203015c
.L_0202fe94:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fcf4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202febc
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202febc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x258
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov081_02214008
    mov r4, r0
    b .L_0203015c
.L_0202fee8:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_0202fccc
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202ff10
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_0202ff10:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x22c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov075_0221461c
    mov r4, r0
    b .L_0203015c
.L_0202ff3c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    mov r2, #0x0
    bl ActorModeNibble_Init
    mov r4, r0
    b .L_0203015c
.L_0202ff6c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    mov r2, #0x1
    bl ActorModeNibble_Init
    mov r4, r0
    b .L_0203015c
.L_0202ff9c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    mov r2, #0x2
    bl ActorModeNibble_Init
    mov r4, r0
    b .L_0203015c
.L_0202ffcc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    mov r2, #0x3
    bl ActorModeNibble_Init
    mov r4, r0
    b .L_0203015c
.L_0202fffc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    mov r2, #0x4
    bl ActorModeNibble_Init
    mov r4, r0
    b .L_0203015c
.L_0203002c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    mov r2, #0x5
    bl ActorModeNibble_Init
    mov r4, r0
    b .L_0203015c
.L_0203005c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x218
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl ActorTableRecord_InitAlternate
    mov r4, r0
    b .L_0203015c
.L_02030088:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x21c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl ActorRegisteredSubclass_Init
    mov r4, r0
    b .L_0203015c
.L_020300b4:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_02030a70
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020300dc
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_020300dc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x258
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov085_02212aec
    mov r4, r0
    b .L_0203015c
.L_02030108:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_02030a74
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203012c
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0203012c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203015c
    mov r1, r5
    bl func_ov088_0221b508
    mov r4, r0
    b .L_0203015c
.L_02030158:
    bl OS_Halt
.L_0203015c:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_02030174:
    ldrh r1, [r5, #0x2]
    cmp r1, #0x68
    bgt .L_02030240
    bge .L_02030608
    cmp r1, #0x65
    bgt .L_02030224
    bge .L_02030634
    cmp r1, #0x26
    bgt .L_02030218
    subs r0, r1, #0xa
    addpl pc, pc, r0, lsl #0x2
    b .L_020307b8
    b .L_02030284
    b .L_02030284
    b .L_02030284
    b .L_02030284
    b .L_020302dc
    b .L_020302dc
    b .L_020302dc
    b .L_020302dc
    b .L_020302b0
    b .L_02030284
    b .L_02030308
    b .L_02030334
    b .L_02030360
    b .L_020307b8
    b .L_020303b8
    b .L_02030360
    b .L_020303e4
    b .L_0203038c
    b .L_02030410
    b .L_0203043c
    b .L_02030468
    b .L_020304b8
    b .L_020304e4
    b .L_02030710
    b .L_0203073c
    b .L_02030510
    b .L_0203053c
    b .L_0203058c
    b .L_02030768
.L_02030218:
    cmp r1, #0x64
    beq .L_020305dc
    b .L_020307b8
.L_02030224:
    cmp r1, #0x66
    bgt .L_02030234
    beq .L_02030634
    b .L_020307b8
.L_02030234:
    cmp r1, #0x67
    beq .L_02030634
    b .L_020307b8
.L_02030240:
    cmp r1, #0x6e
    bgt .L_02030268
    bge .L_020306b8
    cmp r1, #0x6b
    bgt .L_0203025c
    beq .L_02030660
    b .L_020307b8
.L_0203025c:
    cmp r1, #0x6c
    beq .L_0203068c
    b .L_020307b8
.L_02030268:
    cmp r1, #0x70
    bgt .L_02030278
    beq .L_02030660
    b .L_020307b8
.L_02030278:
    cmp r1, #0x71
    beq .L_020306e4
    b .L_020307b8
.L_02030284:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x1fc
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl PresentationBackedActor_Init
    mov r4, r0
    b .L_020307bc
.L_020302b0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl EffectHandleActor_Init
    mov r4, r0
    b .L_020307bc
.L_020302dc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x1f0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_0204e944
    mov r4, r0
    b .L_020307bc
.L_02030308:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x21c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl GridEffectActor_Init
    mov r4, r0
    b .L_020307bc
.L_02030334:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl TrackedResourceActorType21_Init
    mov r4, r0
    b .L_020307bc
.L_02030360:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl TrackedResourceActorType22And25_Init
    mov r4, r0
    b .L_020307bc
.L_0203038c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl TrackedResourceActorType27_Init
    mov r4, r0
    b .L_020307bc
.L_020303b8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl TrackedResourceActorType24_Init
    mov r4, r0
    b .L_020307bc
.L_020303e4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl TrackedResourceActorType26_Init
    mov r4, r0
    b .L_020307bc
.L_02030410:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl TrackedResourceActorType28_Init
    mov r4, r0
    b .L_020307bc
.L_0203043c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_020525b0
    mov r4, r0
    b .L_020307bc
.L_02030468:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcec
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203048c
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0203048c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x218
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_ov092_0221a838
    mov r4, r0
    b .L_020307bc
.L_020304b8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02052680
    mov r4, r0
    b .L_020307bc
.L_020304e4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02052978
    mov r4, r0
    b .L_020307bc
.L_02030510:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_020533e0
    mov r4, r0
    b .L_020307bc
.L_0203053c:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02030560
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_02030560:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_ov095_0221c0b0
    mov r4, r0
    b .L_020307bc
.L_0203058c:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc4
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020305b0
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_020305b0:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_ov095_0221c724
    mov r4, r0
    b .L_020307bc
.L_020305dc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02055784
    mov r4, r0
    b .L_020307bc
.L_02030608:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02056360
    mov r4, r0
    b .L_020307bc
.L_02030634:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02055eb0
    mov r4, r0
    b .L_020307bc
.L_02030660:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02056580
    mov r4, r0
    b .L_020307bc
.L_0203068c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_020567f4
    mov r4, r0
    b .L_020307bc
.L_020306b8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02056880
    mov r4, r0
    b .L_020307bc
.L_020306e4:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x20c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02056be0
    mov r4, r0
    b .L_020307bc
.L_02030710:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x218
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02052a70
    mov r4, r0
    b .L_020307bc
.L_0203073c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x204
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_02052ec0
    mov r4, r0
    b .L_020307bc
.L_02030768:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_0202fcc0
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0203078c
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_0203078c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x208
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020307bc
    mov r1, r5
    bl func_ov097_02219d20
    mov r4, r0
    b .L_020307bc
.L_020307b8:
    bl OS_Halt
.L_020307bc:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_020307d4:
    ldr r0, [r6, #0xe04]
    ldr r1, .L_02030a78
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020307fc
    add r0, r6, #0x204
    add r0, r0, #0xc00
    bl OverlaySlot_LoadOverlay
.L_020307fc:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2a8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02030824
    mov r1, r5
    bl func_ov075_02212ae0 ; func_ov076_02212ae0, func_ov077_02212ae0, func_ov078_02212ae0, func_ov079_02212ae0, func_ov080_02212ae0, func_ov081_02212ae0, func_ov082_02212ae0, func_ov083_02212ae0, func_ov084_02212ae0, func_ov085_02212ae0, func_ov086_02212ae0
    mov r4, r0
.L_02030824:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0203083c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x2b8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02030864
    mov r1, r5
    bl Type7Actor_Init
    mov r4, r0
.L_02030864:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_0203087c:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x3e0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020308a4
    mov r1, r5
    bl func_020579b0
    mov r4, r0
.L_020308a4:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_020308bc:
    ldrh r2, [r5, #0x2]
    ldr r1, .L_02030a7c
    mov r0, #0x30
    mla r0, r2, r0, r1
    ldrb r0, [r0, #0x1]
    cmp r0, #0x0
    beq .L_020308ec
    cmp r0, #0x1
    beq .L_02030950
    cmp r0, #0x2
    beq .L_020309b4
    b .L_02030a1c
.L_020308ec:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_02030a74
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02030910
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_02030910:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x274
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02030938
    mov r1, r5
    bl func_ov088_02217a3c ; func_ov090_02217a3c
    mov r4, r0
.L_02030938:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_02030950:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_02030a74
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02030974
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_02030974:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x274
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0203099c
    mov r1, r5
    bl func_ov088_0221b394
    mov r4, r0
.L_0203099c:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_020309b4:
    ldr r0, [r6, #0xe10]
    ldr r1, .L_02030a74
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020309d8
    add r0, r6, #0xe10
    bl OverlaySlot_LoadOverlay
.L_020309d8:
    ldr r1, .L_0202fca8
    ldr r3, .L_0202fcac
    mov r0, #0x274
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02030a00
    mov r1, r5
    bl func_ov088_02217a3c ; func_ov090_02217a3c
    mov r4, r0
.L_02030a00:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
    b .L_02030a1c
.L_02030a18:
    bl OS_Halt
.L_02030a1c:
    add r0, r6, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x2
    ldreq r0, [r4, #0x14]
    orreq r0, r0, #0x4000000
    streq r0, [r4, #0x14]
    beq .L_02030a40
    mov r0, r4
    bl Actor_RefreshCachedTerrainHeight
.L_02030a40:
    ldrsh r0, [r5, #0x52]
    cmp r4, #0x0
    strh r0, [r4, #0xe4]
    beq .L_02030a5c
    mov r0, r6
    mov r1, r4
    bl ActorCollection_RegisterActor
.L_02030a5c:
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02030a68: .word 0x57
.L_02030a6c: .word 0x59
.L_02030a70: .word 0x55
.L_02030a74: .word 0x58
.L_02030a78: .word 0x4f
.L_02030a7c: .word data_020ed470
    .size ActorCollection_SpawnActorFromDescriptor, . - ActorCollection_SpawnActorFromDescriptor

