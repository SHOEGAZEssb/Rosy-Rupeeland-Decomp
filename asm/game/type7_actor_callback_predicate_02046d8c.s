; Matching retail form; see src/game/type7_actor_callback_predicate.c.
.text
.extern data_020e16b0
.extern data_020e1778
.extern data_020e1810
.extern data_020e18c8
.global Type7Actor_HasSpecialCallbackPair
.type Type7Actor_HasSpecialCallbackPair, @function
Type7Actor_HasSpecialCallbackPair: ; 0x02046d8c
    stmdb sp!, {r4, lr}
    ldr r2, .L_02046e50
    mov r1, #0x1
    ldr ip, [r0, #0x208]
    ldr r2, [r2, #0x218]
    mov lr, r1
    mov r4, r1
    cmp ip, r2
    ldr r2, .L_02046e54
    bne .L_02046dc8
    ldr r3, [r0, #0x20c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r4, #0x0
.L_02046dc8:
    cmp r4, #0x0
    beq .L_02046e08
    ldr r2, .L_02046e50
    ldr ip, [r0, #0x208]
    ldr r2, [r2, #0x160]
    mov r4, #0x1
    cmp ip, r2
    ldr r2, .L_02046e58
    bne .L_02046e00
    ldr r3, [r0, #0x20c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r4, #0x0
.L_02046e00:
    cmp r4, #0x0
    movne lr, #0x0
.L_02046e08:
    cmp lr, #0x0
    bne .L_02046e48
    ldr r2, .L_02046e50
    ldr r3, [r0, #0x208]
    ldr r2, [r2, #0xc8]
    mov r4, #0x1
    cmp r3, r2
    ldr ip, .L_02046e5c
    bne .L_02046e40
    ldr r2, [r0, #0x20c]
    ldr r0, [ip, #0x4]
    cmp r2, r0
    cmpne r3, #0x0
    moveq r4, #0x0
.L_02046e40:
    cmp r4, #0x0
    movne r1, #0x0
.L_02046e48:
    mov r0, r1
    ldmia sp!, {r4, pc}
.L_02046e50: .word data_020e16b0
.L_02046e54: .word data_020e18c8
.L_02046e58: .word data_020e1810
.L_02046e5c: .word data_020e1778
.size Type7Actor_HasSpecialCallbackPair, . - Type7Actor_HasSpecialCallbackPair
