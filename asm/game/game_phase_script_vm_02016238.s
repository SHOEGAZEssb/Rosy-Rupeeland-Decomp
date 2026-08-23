; Matching retail form; see src/game/game_phase_script_vm_runtime_command_dispatch.c.
.text
.extern Heap_Alloc
.extern OS_Halt
.extern data_020d5b3c
.extern data_020d5b44
.extern data_020d5b4c
.extern data_020d5b54
.extern data_020d5b5c
.extern data_020d5b64
.extern data_020d5b6c
.extern data_020d5b74
.extern data_020d5b7c
.extern data_020d5b84
.extern data_020d5b8c
.extern data_021052fc
.extern data_021f3d68
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseLoadScene_Init
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_0201cfd0
.extern PresentationList_AppendObject
.extern func_020200bc
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_GetOwningCollection
.extern func_0206ec68
.extern RuntimeRecordTable_FindByKey
.extern Overlay032Scene_Init
.extern func_0209d774
.extern func_0209f2f8
.extern func_0209fd50
.extern func_020a042c
.extern gHeapContext

.global func_02016238
func_02016238:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    cmp r6, #0x52
    addls pc, pc, r6, lsl #2
    b L_020167a4
    b L_020167a4
    b L_020163b0
    b L_020167a4
    b L_020163b8
    b L_020163c0
    b L_02016614
    b L_020167a4
    b L_020167a4
    b L_020163c8
    b L_020167a4
    b L_020163f8
    b L_02016508
    b L_02016604
    b L_020165b8
    b L_020165c8
    b L_020165d0
    b L_020167a4
    b L_020165fc
    b L_020167a8
    b L_020167a4
    b L_0201660c
    b L_020163d0
    b L_0201661c
    b L_0201662c
    b L_02016624
    b L_02016634
    b L_0201663c
    b L_0201665c
    b L_020167a4
    b L_02016680
    b L_02016688
    b L_02016690
    b L_02016690
    b L_02016690
    b L_0201670c
    b L_02016734
    b L_02016734
    b L_02016734
    b L_020165c0
    b L_02016794
    b L_0201679c
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_02016400
    b L_02016458
    b L_02016484
    b L_020167a4
    b L_0201642c
    b L_02016458
    b L_020164b0
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020167a4
    b L_020164dc
    b L_020164dc
    b L_020164dc
L_020163b0:
    mov r7, #2
    b L_020167a8
L_020163b8:
    mov r7, #5
    b L_020167a8
L_020163c0:
    mov r7, #6
    b L_020167a8
L_020163c8:
    mov r7, #1
    b L_020167a8
L_020163d0:
    ldr r1, L_020167dc
    ldr r3, L_020167e0
    mov r0, #0x30
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_020163f0
    bl Overlay032Scene_Init
L_020163f0:
    mov r0, #0
    b L_020167d4
L_020163f8:
    mov r7, #8
    b L_020167a8
L_02016400:
    ldr r1, L_020167e4
    ldr r3, L_020167e0
    mov r0, #0x38
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_02016424
    mov r1, #1
    bl func_0209d774
L_02016424:
    mov r0, #0
    b L_020167d4
L_0201642c:
    ldr r1, L_020167e8
    ldr r3, L_020167e0
    mov r0, #0x38
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_02016450
    mov r1, #2
    bl func_0209d774
L_02016450:
    mov r0, #0
    b L_020167d4
L_02016458:
    ldr r1, L_020167ec
    ldr r3, L_020167e0
    mov r0, #0x38
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_0201647c
    mov r1, #1
    bl func_0209f2f8
L_0201647c:
    mov r0, #0
    b L_020167d4
L_02016484:
    ldr r1, L_020167f0
    ldr r3, L_020167e0
    mov r0, #0x5c
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_020164a8
    mov r1, #1
    bl func_0209fd50
L_020164a8:
    mov r0, #0
    b L_020167d4
L_020164b0:
    ldr r1, L_020167f4
    ldr r3, L_020167e0
    mov r0, #0x5c
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_020164d4
    mov r1, #2
    bl func_0209fd50
L_020164d4:
    mov r0, #0
    b L_020167d4
L_020164dc:
    ldr r1, L_020167f8
    ldr r3, L_020167e0
    mov r0, #0x58
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_02016500
    mov r1, #1
    bl func_020a042c
L_02016500:
    mov r0, #0
    b L_020167d4
L_02016508:
    ldr r0, L_020167fc
    ldr r1, [r0]
    add r0, r1, #0x3bc
    add r1, r1, #0x2000
    add r0, r0, #0x2c00
    ldr r5, [r1, #0xea4]
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, sp, #4
    bl VecFx32Object_InitCopy
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x20]
    mov r1, r0, asr #12
    ldr r3, [sp, #8]
    ldr r0, [sp, #0xc]
    rsb r1, r1, r2, asr #12
    sub r2, r1, r0, asr #12
    mov r0, r3, asr #12
    ldr r5, [r5, #0x1c]
    sub r7, r2, #0x10
    rsb r6, r0, r5, asr #12
    ldr r1, L_02016800
    ldr r3, L_020167e0
    mov r0, #0x1c
    mov r2, #4
    bl Heap_Alloc
    movs r1, r0
    beq L_02016594
    mov r5, #0x1e
    mov r1, r4
    mov r2, r6
    mov r3, r7
    str r5, [sp]
    bl func_020200bc
    mov r1, r0
L_02016594:
    ldr r0, L_020167fc
    ldr r0, [r0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl PresentationList_AppendObject
    add r0, sp, #4
    bl VecFx32Object_Destroy
    mov r0, #0
    b L_020167d4
L_020165b8:
    mov r7, #0xa
    b L_020167a8
L_020165c0:
    mov r7, #0x17
    b L_020167a8
L_020165c8:
    mov r7, #0xb
    b L_020167a8
L_020165d0:
    ldr r1, L_02016804
    ldr r3, L_020167e0
    mov r0, #0x2c
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_020165f4
    mov r1, r4
    bl func_0201cfd0
L_020165f4:
    mov r0, #0
    b L_020167d4
L_020165fc:
    mov r7, #0xc
    b L_020167a8
L_02016604:
    mov r7, #0xd
    b L_020167a8
L_0201660c:
    mov r7, #0xf
    b L_020167a8
L_02016614:
    mov r7, #0x10
    b L_020167a8
L_0201661c:
    mov r7, #0x11
    b L_020167a8
L_02016624:
    mov r7, #0x12
    b L_020167a8
L_0201662c:
    mov r7, #0x13
    b L_020167a8
L_02016634:
    mov r7, #0x14
    b L_020167a8
L_0201663c:
    ldr r0, [r5, #0x84]
    mov r1, r4, lsl #16
    ldr r3, [r0, #0x54]
    mov r0, #0
    ldrh r2, [r3, #0x24]
    orr r1, r2, r1, lsr #16
    strh r1, [r3, #0x24]
    b L_020167d4
L_0201665c:
    ldr r1, [r5, #0x84]
    mov r0, r4, lsl #16
    ldr r3, [r1, #0x54]
    mvn r1, r0, lsr #16
    ldrh r2, [r3, #0x24]
    mov r0, #0
    and r1, r2, r1
    strh r1, [r3, #0x24]
    b L_020167d4
L_02016680:
    mov r7, #0x15
    b L_020167a8
L_02016688:
    mov r7, #0x16
    b L_020167a8
L_02016690:
    ldr r0, [r5, #0x84]
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_FindActorByRuntimeId
    cmp r0, #0
    ldrne r0, [r0, #0x54]
    cmpne r0, #0
    beq L_02016704
    cmp r6, #0x1f
    beq L_020166cc
    cmp r6, #0x20
    beq L_020166e0
    cmp r6, #0x21
    beq L_020166f4
    b L_02016704
L_020166cc:
    ldr r1, [r0, #0x14]
    mov r0, r5
    ldr r1, [r1, #0x10]
    bl GamePhaseScriptVm_SetResult
    b L_02016704
L_020166e0:
    ldr r1, [r0, #0x18]
    mov r0, r5
    ldr r1, [r1, #0x10]
    bl GamePhaseScriptVm_SetResult
    b L_02016704
L_020166f4:
    ldr r1, [r0, #0x1c]
    mov r0, r5
    ldr r1, [r1, #0x10]
    bl GamePhaseScriptVm_SetResult
L_02016704:
    mov r0, #0
    b L_020167d4
L_0201670c:
    ldr r1, L_02016808
    ldr r3, L_020167e0
    mov r0, #0x38
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_0201672c
    bl func_0206ec68
L_0201672c:
    mov r0, #0
    b L_020167d4
L_02016734:
    ldr r0, L_0201680c
    mov r1, r4
    bl RuntimeRecordTable_FindByKey
    cmp r6, #0x23
    beq L_0201675c
    cmp r6, #0x24
    beq L_0201676c
    cmp r6, #0x25
    beq L_0201677c
    b L_0201678c
L_0201675c:
    ldrh r1, [r0, #0x12]
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    b L_0201678c
L_0201676c:
    ldrh r1, [r0, #0x14]
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    b L_0201678c
L_0201677c:
    ldrh r1, [r0, #0x10]
    mov r0, r5
    and r1, r1, #0xff
    bl GamePhaseScriptVm_SetResult
L_0201678c:
    mov r0, #0
    b L_020167d4
L_02016794:
    mov r7, #0x18
    b L_020167a8
L_0201679c:
    mov r7, #0x19
    b L_020167a8
L_020167a4:
    bl OS_Halt
L_020167a8:
    ldr r1, L_02016810
    ldr r3, L_020167e0
    mov r0, #0x9c
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_020167d0
    mov r1, r7
    mov r2, r4
    bl GamePhaseLoadScene_Init
L_020167d0:
    mov r0, #0
L_020167d4:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
L_020167dc: .word data_020d5b3c
L_020167e0: .word gHeapContext
L_020167e4: .word data_020d5b44
L_020167e8: .word data_020d5b4c
L_020167ec: .word data_020d5b54
L_020167f0: .word data_020d5b5c
L_020167f4: .word data_020d5b64
L_020167f8: .word data_020d5b6c
L_020167fc: .word data_021052fc
L_02016800: .word data_020d5b74
L_02016804: .word data_020d5b7c
L_02016808: .word data_020d5b84
L_0201680c: .word data_021f3d68
L_02016810: .word data_020d5b8c
    .size func_02016238, . - func_02016238
