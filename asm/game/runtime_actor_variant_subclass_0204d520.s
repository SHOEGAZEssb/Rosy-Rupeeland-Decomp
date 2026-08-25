; Matching retail form; see src/game/runtime_actor_variant_subclass.c.
.extern RuntimeActorScriptVariant_Init
.extern RuntimeActorScriptVariant_DestroyAlternateEntry
.extern Heap_Free
.extern data_020e2238
.text
    .global RuntimeActorScriptVariantSubclass_Init
RuntimeActorScriptVariantSubclass_Init: ; 0x0204d520
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActorScriptVariant_Init
    ldr r1, .L_0204d53c
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0204d53c: .word data_020e2238
.size RuntimeActorScriptVariantSubclass_Init, . - RuntimeActorScriptVariantSubclass_Init

    .global RuntimeActorScriptVariantSubclass_Destroy
RuntimeActorScriptVariantSubclass_Destroy: ; 0x0204d540
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActorScriptVariant_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
.size RuntimeActorScriptVariantSubclass_Destroy, . - RuntimeActorScriptVariantSubclass_Destroy

    .global RuntimeActorScriptVariantSubclass_DestroyAndFree
RuntimeActorScriptVariantSubclass_DestroyAndFree: ; 0x0204d554
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActorScriptVariant_DestroyAlternateEntry
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size RuntimeActorScriptVariantSubclass_DestroyAndFree, . - RuntimeActorScriptVariantSubclass_DestroyAndFree

    .global RuntimeActorScriptVariantSubclass_DestroyAlternateEntry
RuntimeActorScriptVariantSubclass_DestroyAlternateEntry: ; 0x0204d570
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl RuntimeActorScriptVariant_DestroyAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
.size RuntimeActorScriptVariantSubclass_DestroyAlternateEntry, . - RuntimeActorScriptVariantSubclass_DestroyAlternateEntry

    .global RuntimeActorScriptVariantSubclass_ReturnZeroHook0
RuntimeActorScriptVariantSubclass_ReturnZeroHook0: ; 0x0204d584
    mov r0, #0x0
    bx lr
.size RuntimeActorScriptVariantSubclass_ReturnZeroHook0, . - RuntimeActorScriptVariantSubclass_ReturnZeroHook0

    .global RuntimeActorScriptVariantSubclass_ReturnZeroHook1
RuntimeActorScriptVariantSubclass_ReturnZeroHook1: ; 0x0204d58c
    mov r0, #0x0
    bx lr
.size RuntimeActorScriptVariantSubclass_ReturnZeroHook1, . - RuntimeActorScriptVariantSubclass_ReturnZeroHook1

    .global RuntimeActorScriptVariantSubclass_ReturnZeroHook2
RuntimeActorScriptVariantSubclass_ReturnZeroHook2: ; 0x0204d594
    mov r0, #0x0
    bx lr
.size RuntimeActorScriptVariantSubclass_ReturnZeroHook2, . - RuntimeActorScriptVariantSubclass_ReturnZeroHook2

    .global RuntimeActorScriptVariantSubclass_NoOpHook0
RuntimeActorScriptVariantSubclass_NoOpHook0: ; 0x0204d59c
    bx lr
.size RuntimeActorScriptVariantSubclass_NoOpHook0, . - RuntimeActorScriptVariantSubclass_NoOpHook0

    .global RuntimeActorScriptVariantSubclass_NoOpHook1
RuntimeActorScriptVariantSubclass_NoOpHook1: ; 0x0204d5a0
    bx lr
.size RuntimeActorScriptVariantSubclass_NoOpHook1, . - RuntimeActorScriptVariantSubclass_NoOpHook1

    .global RuntimeActorScriptVariantSubclass_ReturnOneHook
RuntimeActorScriptVariantSubclass_ReturnOneHook: ; 0x0204d5a4
    mov r0, #0x1
    bx lr
.size RuntimeActorScriptVariantSubclass_ReturnOneHook, . - RuntimeActorScriptVariantSubclass_ReturnOneHook

