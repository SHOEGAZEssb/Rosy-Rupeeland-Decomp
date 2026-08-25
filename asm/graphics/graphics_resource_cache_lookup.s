.text
; Matching fallbacks for the documented portable cache traversals in
; src/graphics/graphics_resource_cache.c. MWCC reproduces each retail loop body
; but appends an unreachable `bx lr` after the back edge in both functions.

.global GraphicsResourceCache_FindNode
GraphicsResourceCache_FindNode:
    ldr r0, [r0]
.L_node_loop:
    cmp r0, #0
    bxeq lr
    cmp r0, r1
    bxeq lr
    ldr r0, [r0, #0xc]
    b .L_node_loop
.size GraphicsResourceCache_FindNode, . - GraphicsResourceCache_FindNode

.global GraphicsResourceCache_FindByResourceId
GraphicsResourceCache_FindByResourceId:
    ldr r0, [r0]
.L_id_loop:
    cmp r0, #0
    bxeq lr
    ldr r2, [r0, #0x10]
    cmp r2, r1
    bxeq lr
    ldr r0, [r0, #0xc]
    b .L_id_loop
.size GraphicsResourceCache_FindByResourceId, . - GraphicsResourceCache_FindByResourceId
