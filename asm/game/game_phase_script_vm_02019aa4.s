; Matching retail form; see src/game/game_phase_script_vm_runtime_manager_command_opcode.c.
.text
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern Actor_SetFlag200000Inverse
.extern GamePhaseScriptVm_Pop
.extern func_0201df64
.extern func_0201e0ec
.extern func_02025d14
.extern func_02026514
.extern ActorCollection_GetSpriteOwner
.extern ActorDerivedType1_UpdateOrientationFlag
.extern ActorDerivedType1_TeardownActiveRecord
.extern func_02055688
.extern GraphicsSpriteGroup_ReleaseResources
.extern func_020a2324
.global func_02019aa4
func_02019aa4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r5, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r8, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r7, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    ldr r4, L_02019c5c
    cmp r0, #0x6
    ldr r1, [r4, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    addls pc, pc, r0, lsl #0x2
    b L_02019c54
L_02019afc: ; jump table
    b L_02019b18 ; case 0
    b L_02019b24 ; case 1
    b L_02019b38 ; case 2
    b L_02019b48 ; case 3
    b L_02019bb8 ; case 4
    b L_02019c18 ; case 5
    b L_02019c4c ; case 6
L_02019b18:
    mov r0, r1
    bl ActorDerivedType1_TeardownActiveRecord
    b L_02019c54
L_02019b24:
    add r0, r1, #0x200
    strh r7, [r0, #0x9a]
    strh r8, [r0, #0x9c]
    strh r5, [r0, #0x9e]
    b L_02019c54
L_02019b38:
    add r0, r1, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x9e]
    b L_02019c54
L_02019b48:
    mov r0, r1
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    mov r0, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_02019b84
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
L_02019b84:
    ldr r0, L_02019c5c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    bl GraphicsSpriteGroup_ReleaseResources
    ldr r0, L_02019c5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    bl func_02025d14
    bl func_02026514
    b L_02019c54
L_02019bb8:
    mov r6, #0x1
    mov r9, #0x0
    mov r5, r6
    b L_02019bf8
L_02019bc8:
    ldr r0, [r4, #0x0]
    mov r1, r6
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq L_02019bf4
    ldrsh r1, [r0, #0x50]
    cmp r7, r1
    bne L_02019bf4
    mov r1, r8
    bl Actor_SetFlag200000Inverse
L_02019bf4:
    add r9, r9, #0x1
L_02019bf8:
    ldr r0, [r4, #0x0]
    mov r1, r5
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt L_02019bc8
    b L_02019c54
L_02019c18:
    bl func_02055688
    mov r0, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df64
    mov r0, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    bl func_020a2324
    b L_02019c54
L_02019c4c:
    mov r0, r1
    bl ActorDerivedType1_UpdateOrientationFlag
L_02019c54:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_02019c5c: .word data_021052fc
.size func_02019aa4, . - func_02019aa4
