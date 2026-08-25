; Matching retail form; see src/game/runtime_actor_variant_subclass_callbacks.c.
.text
    .global RuntimeActorScriptVariantSubclass_GetIdentifier
.type RuntimeActorScriptVariantSubclass_GetIdentifier, @function
RuntimeActorScriptVariantSubclass_GetIdentifier: ; 0x0204d5ac
    ldr r0, .L_0204d5b4
    bx lr
.L_0204d5b4: .word 0x309
.size RuntimeActorScriptVariantSubclass_GetIdentifier, . - RuntimeActorScriptVariantSubclass_GetIdentifier

    .global RuntimeActorScriptVariantSubclass_ReturnZeroHook3
.type RuntimeActorScriptVariantSubclass_ReturnZeroHook3, @function
RuntimeActorScriptVariantSubclass_ReturnZeroHook3: ; 0x0204d5b8
    mov r0, #0x0
    bx lr
.size RuntimeActorScriptVariantSubclass_ReturnZeroHook3, . - RuntimeActorScriptVariantSubclass_ReturnZeroHook3

    .global RuntimeActorScriptVariantSubclass_NoOpHook2
.type RuntimeActorScriptVariantSubclass_NoOpHook2, @function
RuntimeActorScriptVariantSubclass_NoOpHook2: ; 0x0204d5c0
    bx lr
.size RuntimeActorScriptVariantSubclass_NoOpHook2, . - RuntimeActorScriptVariantSubclass_NoOpHook2

    .global RuntimeActorScriptVariantSubclass_NoOpHook3
.type RuntimeActorScriptVariantSubclass_NoOpHook3, @function
RuntimeActorScriptVariantSubclass_NoOpHook3: ; 0x0204d5c4
    bx lr
.size RuntimeActorScriptVariantSubclass_NoOpHook3, . - RuntimeActorScriptVariantSubclass_NoOpHook3
