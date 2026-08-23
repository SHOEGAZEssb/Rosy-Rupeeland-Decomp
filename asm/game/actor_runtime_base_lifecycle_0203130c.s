; Matching retail form; see src/game/actor_runtime_base_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df040
.extern VecFx32Object_Destroy
.extern VecFx32Stepper_Destroy
.extern GamePhaseActorScriptVm_Destroy
.extern ActorCollection_GetSpriteOwner
.extern func_02030e08
.extern Actor_ReleaseSecondaryRenderAttachment
.extern Actor_GetCollection
.extern func_02057184
.extern GraphicsSpriteGroup_ReleaseState

    .global func_0203130c
    .type func_0203130c, @function
func_0203130c: ; 0x0203130c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020313ac
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r5
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r4, [r5, #0xa8]
    cmp r4, #0x0
    beq .L_02031350
    mov r0, r5
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, r4
    bl GraphicsSpriteGroup_ReleaseState
.L_02031350:
    ldr r4, [r5, #0x1e0]
    cmp r4, #0x0
    beq .L_0203136c
    mov r0, r4
    bl func_02057184
    mov r0, r4
    bl Heap_Free
.L_0203136c:
    add r0, r5, #0x198
    bl VecFx32Stepper_Destroy
    add r0, r5, #0xec
    bl GamePhaseActorScriptVm_Destroy
    add r0, r5, #0xb0
    bl VecFx32Object_Destroy
    add r0, r5, #0x98
    bl VecFx32Object_Destroy
    add r0, r5, #0x88
    bl VecFx32Object_Destroy
    add r0, r5, #0x78
    bl VecFx32Object_Destroy
    mov r0, r5
    bl func_02030e08
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_020313ac: .word data_020df040
    .size func_0203130c, . - func_0203130c

