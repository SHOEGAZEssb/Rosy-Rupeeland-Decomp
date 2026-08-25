; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern DualScreenUiPresentationBase_ApplyVisibilityMask

    .global func_0202640c
    .type func_0202640c, @function
func_0202640c: ; 0x0202640c
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    mov r2, #0x1f
    beq .L_02026464
    mov r1, #0x1
    str r1, [r4, #0xd4]
    bl DualScreenUiPresentationBase_ApplyVisibilityMask
    ldr r2, .L_020264ac
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldr r0, [r4, #0xd0]
    ldr r1, [r0, #0x0]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    b .L_020264a4
.L_02026464:
    mov r1, #0x0
    str r1, [r4, #0xd4]
    bl DualScreenUiPresentationBase_ApplyVisibilityMask
    ldr r2, .L_020264ac
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldr r0, [r4, #0xd0]
    ldr r1, [r0, #0x0]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
.L_020264a4:
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_020264ac: .word 0x4001000
    .size func_0202640c, . - func_0202640c
