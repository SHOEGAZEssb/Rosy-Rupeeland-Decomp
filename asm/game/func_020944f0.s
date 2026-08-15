.text
; Matching fallback for the portable implementation in src/game/inventory_scroll_controller.c.
.extern SpritePresentation_SetAnimation

.global func_020944f0
func_020944f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ldr r0, [r4, #0x64]
    ble .L_02094514
    mov r1, #0x0
    bl SpritePresentation_SetAnimation
    b .L_0209451c
.L_02094514:
    mov r1, #0x1
    bl SpritePresentation_SetAnimation
.L_0209451c:
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0x8]
    ldr r2, [r4, #0xc]
    sub r0, r1, r0
    cmp r2, r0
    ldr r0, [r4, #0x68]
    bge .L_02094544
    mov r1, #0x2
    bl SpritePresentation_SetAnimation
    ldmia sp!, {r4, pc}
.L_02094544:
    mov r1, #0x3
    bl SpritePresentation_SetAnimation
    ldmia sp!, {r4, pc}
.size func_020944f0, . - func_020944f0
