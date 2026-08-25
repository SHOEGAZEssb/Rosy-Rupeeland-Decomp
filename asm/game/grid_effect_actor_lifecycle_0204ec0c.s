; Matching retail form; see src/game/grid_effect_actor_lifecycle.c.
.extern Heap_Free
.extern gGridEffectActorVtable
.extern SelfLinkedSpriteConfig_Init
.extern ActorRuntimeBase_Init
.extern RuntimeActor_DestroyAlternateEntry
.extern Actor_ReleaseSecondaryRenderAttachment
.extern Type7Actor_ClearGlobalRelationshipToActor
.extern GridEffectActorRegistry_Unregister
.text

    .global GridEffectActor_Init
GridEffectActor_Init: ; 0x0204ec0c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorRuntimeBase_Init
    ldr r0, .L_0204ec6c
    mov ip, #0x0
    str r0, [r4, #0x0]
    str ip, [r4, #0x1ec]
    add r2, r4, #0x100
    ldrh r3, [r2, #0xf0]
    ldr r1, .L_0204ec70
    add r0, r4, #0x1f4
    bic r3, r3, #0x3
    strh r3, [r2, #0xf0]
    ldrh r3, [r2, #0xf0]
    and r1, r3, r1
    strh r1, [r2, #0xf0]
    strh ip, [r2, #0xf2]
    bl SelfLinkedSpriteConfig_Init
    mvn r0, #0x0
    strb r0, [r4, #0x21a]
    mov r1, #0x0
    mov r0, r4
    strb r1, [r4, #0x21b]
    ldmia sp!, {r4, pc}
.L_0204ec6c: .word gGridEffectActorVtable
.L_0204ec70: .word 0xffff0003
.size GridEffectActor_Init, . - GridEffectActor_Init

    .global GridEffectActor_Destroy

GridEffectActor_Destroy: ; 0x0204ec74
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204ecd0
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204ecb8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204ecb8:
    mov r0, r4
    bl GridEffectActorRegistry_Unregister
    mov r0, r4
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204ecd0: .word gGridEffectActorVtable
.size GridEffectActor_Destroy, . - GridEffectActor_Destroy

    .global GridEffectActor_DestroyAndFree

GridEffectActor_DestroyAndFree: ; 0x0204ecd4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204ed38
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x1ec]
    cmp r0, #0x0
    beq .L_0204ed18
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0204ed18:
    mov r0, r4
    bl GridEffectActorRegistry_Unregister
    mov r0, r4
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204ed38: .word gGridEffectActorVtable
.size GridEffectActor_DestroyAndFree, . - GridEffectActor_DestroyAndFree

