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
.extern ActorInteractionIcon_Destroy
.extern GraphicsSpriteGroup_ReleaseState

    .global func_02031260
    .type func_02031260, @function
func_02031260: ; 0x02031260
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02031308
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r5
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r4, [r5, #0xa8]
    cmp r4, #0x0
    beq .L_020312a4
    mov r0, r5
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, r4
    bl GraphicsSpriteGroup_ReleaseState
.L_020312a4:
    ldr r4, [r5, #0x1e0]
    cmp r4, #0x0
    beq .L_020312c0
    mov r0, r4
    bl ActorInteractionIcon_Destroy
    mov r0, r4
    bl Heap_Free
.L_020312c0:
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
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02031308: .word data_020df040
    .size func_02031260, . - func_02031260

