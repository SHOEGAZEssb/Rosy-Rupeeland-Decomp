.text
; Matching fallbacks for the documented portable cache traversals in
; src/graphics/graphics_resource_cache.c. MWCC otherwise emits bottom-tested
; loops and explicit null returns for these equivalent source functions.

.global func_020702b8
func_020702b8:
    ldr r0, [r0]
.L_node_loop:
    cmp r0, #0
    bxeq lr
    cmp r0, r1
    bxeq lr
    ldr r0, [r0, #0xc]
    b .L_node_loop
.size func_020702b8, . - func_020702b8

.global func_020702d4
func_020702d4:
    ldr r0, [r0]
.L_id_loop:
    cmp r0, #0
    bxeq lr
    ldr r2, [r0, #0x10]
    cmp r2, r1
    bxeq lr
    ldr r0, [r0, #0xc]
    b .L_id_loop
.size func_020702d4, . - func_020702d4
