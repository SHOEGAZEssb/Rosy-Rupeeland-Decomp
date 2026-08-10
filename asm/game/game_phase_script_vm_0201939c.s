; Matching retail form; see src/game/game_phase_script_vm_actor_effect_dispatch_opcode.c.
.text
.extern data_021052fc
.extern gActorCategory1DescriptorTable
.extern gActorCategory2DescriptorTable
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32_Subtract
.extern ActorBounds_GetWidth
.extern ActorBounds_GetHeight
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_02019890
.extern ActorCollection_QueueGroupForRemoval
.extern ActorCollection_SpawnActorFromDescriptor
.extern ActorCollection_SpawnDescriptorsBySelector
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_GetCollisionCenter
.extern Actor_GetCollection
.extern ActorDerivedType1_StartRecord
.extern ActorDerivedType1_IsIdleEligible
.extern PresentationBackedActor_SpawnSplitAmount
.extern GridEffectActor_SpawnWithRandomVelocity
.extern GridEffectActor_SpawnWithVelocity
.extern func_02050078
.global func_0201939c
func_0201939c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x150
    mov r9, r0
    bl GamePhaseScriptVm_Pop
    mov r10, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r11, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    str r0, [sp, #0x0]
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_02019878
L_0201940c: ; jump table
    b L_0201942c ; case 0
    b L_02019620 ; case 1
    b L_02019708 ; case 2
    b L_02019740 ; case 3
    b L_020197d8 ; case 4
    b L_02019804 ; case 5
    b L_02019788 ; case 6
    b L_02019818 ; case 7
L_0201942c:
    ldr r0, [r9, #0x84]
    bl Actor_GetCollection
    mov r1, r6
    bl ActorCollection_FindActorByDescriptorValue
    mov r8, #0x1000
    mov r4, r0
    ldr r6, [r4, #0x54]
    add r3, r8, #0x1
    cmp r6, #0x0
    add r10, r8, #0x2
    mov r1, #0x2
    mov r11, #0x0
    beq L_0201948c
    ldrb r0, [r6, #0x3b]
    ldr r8, [r6, #0x14]
    ldr r3, [r6, #0x18]
    ldr r2, [r6, #0x1c]
    and r0, r0, #0x1
    tst r0, #0xff
    ldrb r11, [r6, #0x38]
    ldr r8, [r8, #0x10]
    ldr r3, [r3, #0x10]
    ldr r10, [r2, #0x10]
    movne r1, #0x1
L_0201948c:
    ldrb r2, [r4, #0x4d]
    add r0, r4, #0x8
    strh r2, [sp, #0xec]
    ldrh r2, [r4, #0x4e]
    strh r2, [sp, #0xee]
    str r8, [sp, #0xf0]
    str r3, [sp, #0xf4]
    str r10, [sp, #0xf8]
    strb r1, [sp, #0xfc]
    strb r11, [sp, #0xfd]
    bl ActorBounds_GetWidth
    strb r0, [sp, #0xfe]
    add r0, r4, #0x8
    bl ActorBounds_GetHeight
    strb r0, [sp, #0xff]
    add r0, sp, #0x4
    mov r1, r4
    bl Actor_GetCollisionCenter
    add r0, sp, #0xdc
    add r1, sp, #0x4
    add r2, r4, #0x18
    bl VecFx32_Subtract
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    ldr r0, [sp, #0xe4]
    ldr r1, [sp, #0xe0]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    strb r0, [sp, #0x101]
    add r0, r4, #0x4
    strb r1, [sp, #0x100]
    bl ActorBounds_GetWidth
    strb r0, [sp, #0x102]
    add r0, r4, #0x4
    bl ActorBounds_GetHeight
    strb r0, [sp, #0x103]
    mov r0, #0x0
    strb r0, [sp, #0x104]
    strb r0, [sp, #0x105]
    ldrsh r1, [r4, #0x68]
    mov r1, r1, lsl #0x18
    mov r2, r1, asr #0x18
    add r1, sp, #0x104
    strh r2, [r1, #0x2]
    ldrsh r2, [r4, #0x6a]
    mov r2, r2, lsl #0x18
    mov r2, r2, asr #0x18
    strh r2, [r1, #0x4]
    ldrsh r2, [r4, #0x6c]
    mov r2, r2, lsl #0x18
    mov r2, r2, asr #0x18
    strh r2, [r1, #0x6]
    ldrsh r2, [r4, #0x6e]
    mov r2, r2, lsl #0x18
    mov r2, r2, asr #0x18
    strh r2, [r1, #0x8]
    ldr r2, [r4, #0x1c]
    mov r2, r2, asr #0xc
    strh r2, [r1, #0xa]
    ldr r2, [r4, #0x20]
    mov r2, r2, asr #0xc
    strh r2, [r1, #0xc]
    ldr r2, [r4, #0x24]
    mov r2, r2, asr #0xc
    strh r2, [r1, #0xe]
    ldr r2, [r4, #0x14]
    str r2, [sp, #0x114]
    str r5, [sp, #0x118]
    str r0, [sp, #0x11c]
    str r0, [sp, #0x120]
    str r0, [sp, #0x124]
    ldr r0, [r4, #0x14]
    tst r0, #0x80
    cmpne r6, #0x0
    ldrneb r0, [r6, #0x3a]
    strneh r0, [r1, #0x24]
    mvneq r1, #0x0
    addeq r0, sp, #0x104
    streqh r1, [r0, #0x24]
    mov r2, #0x0
    sub r1, r2, #0x1
    str r2, [sp, #0x12c]
    str r2, [sp, #0x130]
    str r1, [sp, #0x134]
    add r0, sp, #0x104
    strh r1, [r0, #0x34]
    strh r1, [r0, #0x36]
    strh r2, [r0, #0x38]
    strh r7, [r0, #0x3a]
    str r1, [sp, #0x140]
    str r2, [sp, #0x144]
    ldr r0, [r9, #0x84]
    bl Actor_GetCollection
    add r1, sp, #0xec
    bl ActorCollection_SpawnActorFromDescriptor
    mov r0, r9
    mov r1, r7
    bl GamePhaseScriptVm_SetResult
    add r0, sp, #0xdc
    bl VecFx32Object_Destroy
    b L_02019878
L_02019620:
    cmp r6, #0xe4
    blt L_020196c4
    cmp r6, #0xea
    bgt L_020196c4
    sub r0, r6, #0xe4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_02019690
L_02019640: ; jump table
    b L_0201965c ; case 0
    b L_02019664 ; case 1
    b L_0201966c ; case 2
    b L_02019674 ; case 3
    b L_0201967c ; case 4
    b L_02019684 ; case 5
    b L_0201968c ; case 6
L_0201965c:
    mov r8, #0x1
    b L_02019690
L_02019664:
    mov r8, #0x5
    b L_02019690
L_0201966c:
    mov r8, #0xa
    b L_02019690
L_02019674:
    mov r8, #0x14
    b L_02019690
L_0201967c:
    mov r8, #0x32
    b L_02019690
L_02019684:
    mov r8, #0x64
    b L_02019690
L_0201968c:
    mov r8, #0xc8
L_02019690:
    add r0, sp, #0xcc
    mov r1, r7, lsl #0xc
    mov r2, r5, lsl #0xc
    mov r3, r4, lsl #0xc
    bl VecFx32Object_InitComponents
    mov r0, r8, lsl #0x10
    mov r1, r0, asr #0x10
    add r2, sp, #0xcc
    mov r0, #0x12c
    bl PresentationBackedActor_SpawnSplitAmount
    add r0, sp, #0xcc
    bl VecFx32Object_Destroy
    b L_02019878
L_020196c4:
    mov r1, r6, lsl #0x10
    add r0, sp, #0xa8
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_02019890
    add r0, sp, #0x98
    mov r1, r7, lsl #0xc
    mov r2, r5, lsl #0xc
    mov r3, r4, lsl #0xc
    bl VecFx32Object_InitComponents
    add r0, sp, #0x98
    add r1, sp, #0xa8
    mov r2, #0x12c
    bl GridEffectActor_SpawnWithRandomVelocity
    add r0, sp, #0x98
    bl VecFx32Object_Destroy
    b L_02019878
L_02019708:
    ldr r0, L_02019884
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_IsIdleEligible
    cmp r0, #0x0
    beq L_02019878
    ldr r0, L_02019884
    mov r1, r6
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_StartRecord
    b L_02019878
L_02019740:
    ldr r1, [r9, #0x84]
    add r0, sp, #0x88
    add r1, r1, #0x18
    bl VecFx32Object_InitCopy
    add r0, sp, #0x78
    mov r1, r7, lsl #0xc
    mov r2, r5, lsl #0xc
    mov r3, r4, lsl #0xc
    bl VecFx32Object_InitComponents
    add r1, sp, #0x88
    add r2, sp, #0x78
    mov r0, r6
    bl func_02050078
    add r0, sp, #0x78
    bl VecFx32Object_Destroy
    add r0, sp, #0x88
    bl VecFx32Object_Destroy
    b L_02019878
L_02019788:
    ldr r1, [sp, #0x0]
    add r0, sp, #0x68
    mov r1, r1, lsl #0xc
    mov r2, r11, lsl #0xc
    mov r3, r10, lsl #0xc
    bl VecFx32Object_InitComponents
    add r0, sp, #0x58
    mov r1, r7, lsl #0xc
    mov r2, r5, lsl #0xc
    mov r3, r4, lsl #0xc
    bl VecFx32Object_InitComponents
    add r1, sp, #0x68
    add r2, sp, #0x58
    mov r0, r6
    bl func_02050078
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
    add r0, sp, #0x68
    bl VecFx32Object_Destroy
    b L_02019878
L_020197d8:
    ldr r0, [r9, #0x84]
    ldr r1, [r0, #0x14]
    tst r1, #0x4000000
    ldrne r1, L_02019888
    ldreq r1, L_0201988c
    ldr r4, [r1, #0x0]
    bl Actor_GetCollection
    mov r1, r4
    mov r2, r6
    bl ActorCollection_SpawnDescriptorsBySelector
    b L_02019878
L_02019804:
    ldr r0, [r9, #0x84]
    bl Actor_GetCollection
    mov r1, r6
    bl ActorCollection_QueueGroupForRemoval
    b L_02019878
L_02019818:
    mov r1, r6, lsl #0x10
    add r0, sp, #0x34
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_02019890
    add r0, sp, #0x24
    mov r1, r7, lsl #0xc
    mov r2, r5, lsl #0xc
    mov r3, r4, lsl #0xc
    bl VecFx32Object_InitComponents
    ldr r1, [sp, #0x0]
    add r0, sp, #0x14
    mov r2, r11
    mov r3, r10
    bl VecFx32Object_InitComponents
    add r0, sp, #0x24
    add r1, sp, #0x14
    add r2, sp, #0x34
    mov r3, #0x12c
    bl GridEffectActor_SpawnWithVelocity
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
L_02019878:
    mov r0, #0x0
    add sp, sp, #0x150
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02019884: .word data_021052fc
L_02019888: .word gActorCategory2DescriptorTable
L_0201988c: .word gActorCategory1DescriptorTable
.size func_0201939c, . - func_0201939c
