; Matching retail form; see src/game/game_phase_script_vm_actor_cross_collection_command_opcode.c.
.text
.extern OS_Halt
.extern gGamePhaseRuntime
.extern gActorRuntimeCollection
.extern GamePhaseRuntime_GetActorCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_SetActive
.extern Actor_GetOwningCollection

.global func_02015b64
func_02015b64:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    ldr r1, L_02015d04
    mov r4, r0
    ldr r1, [r1]
    add r0, r1, #0x2000
    ldr r0, [r0, #0xfb8]
    ldr r1, [r1, #0x24]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xeac]
    ldr r1, [r1]
    ldr r0, [r0]
    cmp r1, r0
    movne r0, #0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x84]
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #1
    bne L_02015be8
    ldr r0, L_02015d04
    mov r1, #2
    ldr r0, [r0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r4
    bl ActorCollection_FindActorByRuntimeId
    mov r6, r0
    b L_02015c24
L_02015be8:
    ldr r0, [r7, #0x84]
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #2
    bne L_02015c20
    ldr r0, L_02015d04
    mov r1, #1
    ldr r0, [r0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r4
    bl ActorCollection_FindActorByRuntimeId
    mov r6, r0
    b L_02015c24
L_02015c20:
    bl OS_Halt
L_02015c24:
    ldrb r0, [r6, #0x4d]
    cmp r0, #1
    bne L_02015c6c
    ldr r0, L_02015d04
    mov r1, #1
    ldr r0, [r0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r6, [r0, #0xe7c]
    mov r1, r5
    mov r0, r6
    ldr r2, [r0]
    ldr r2, [r2, #0x74]
    blx r2
    mov r0, r6
    mov r1, #1
    bl Actor_SetActive
    b L_02015cf0
L_02015c6c:
    ldr r0, [r7, #0x84]
    cmp r6, r0
    bne L_02015c90
    mov r0, r6
    ldr r2, [r0]
    mov r1, r5
    ldr r2, [r2, #0x70]
    blx r2
    b L_02015cf0
L_02015c90:
    cmp r5, #0
    beq L_02015ce4
    ldr r0, L_02015d08
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0
    beq L_02015cd0
    ldr r0, L_02015d08
    ldr r0, [r0, #4]
    cmp r0, r6
    bne L_02015cd0
    mov r0, r6
    ldr r2, [r0]
    mov r1, r5
    ldr r2, [r2, #0x70]
    blx r2
    b L_02015ce4
L_02015cd0:
    mov r0, r6
    ldr r2, [r0]
    mov r1, r5
    ldr r2, [r2, #0x74]
    blx r2
L_02015ce4:
    mov r0, r6
    mov r1, #1
    bl Actor_SetActive
L_02015cf0:
    mov r0, r7
    mov r1, #1
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02015d04: .word gGamePhaseRuntime
L_02015d08: .word gActorRuntimeCollection
    .size func_02015b64, . - func_02015b64
