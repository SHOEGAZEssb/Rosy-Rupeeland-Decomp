; Matching retail form; see src/game/runtime_actor_variant_lifecycle.c.
.extern ActorRuntimeBase_Init
.extern RuntimeActor_DestroyAlternateEntry
.extern Heap_Free
.extern data_020e2028
.text
    .global RuntimeActorScriptVariant_Init
RuntimeActorScriptVariant_Init: ; 0x0204d244
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorRuntimeBase_Init
    ldr r0, .L_0204d280
    str r0, [r5, #0x0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_0204d278
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_0204d278:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d280: .word data_020e2028
.size RuntimeActorScriptVariant_Init, . - RuntimeActorScriptVariant_Init

    .global RuntimeActorScriptVariant_InitAlternate
RuntimeActorScriptVariant_InitAlternate: ; 0x0204d284
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorRuntimeBase_Init
    ldr r0, .L_0204d2c0
    str r0, [r5, #0x0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_0204d2b8
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_0204d2b8:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d2c0: .word data_020e2028
.size RuntimeActorScriptVariant_InitAlternate, . - RuntimeActorScriptVariant_InitAlternate

    .global RuntimeActorScriptVariant_Destroy
RuntimeActorScriptVariant_Destroy: ; 0x0204d2c4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
.size RuntimeActorScriptVariant_Destroy, . - RuntimeActorScriptVariant_Destroy

    .global RuntimeActorScriptVariant_DestroyAndFree
RuntimeActorScriptVariant_DestroyAndFree: ; 0x0204d2d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size RuntimeActorScriptVariant_DestroyAndFree, . - RuntimeActorScriptVariant_DestroyAndFree

    .global RuntimeActorScriptVariant_DestroyAlternateEntry
RuntimeActorScriptVariant_DestroyAlternateEntry: ; 0x0204d2f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActor_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
.size RuntimeActorScriptVariant_DestroyAlternateEntry, . - RuntimeActorScriptVariant_DestroyAlternateEntry

