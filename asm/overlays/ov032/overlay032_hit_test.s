.text

/* Exact fallback; see src/overlays/ov032/overlay032_hit_test.c for documented portable C. */
.extern Sound_Play
.extern func_0209286c
.extern GraphicsSpriteState_TestTouchPoint
.extern gSoundContext

    .global Overlay032SpriteWrapper_HitTest
Overlay032SpriteWrapper_HitTest:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    moveq r4, #0x0
    beq L_021ff2c0
    cmp r2, #0x0
    ldr r0, [r5, #0x0]
    blt L_021ff2b8
    bl func_0209286c
    mov r4, r0
    b L_021ff2c0
L_021ff2b8:
    bl GraphicsSpriteState_TestTouchPoint
    mov r4, r0
L_021ff2c0:
    cmp r4, #0x0
    beq L_021ff2fc
    ldr r0, [r5, #0x2c]
    mov r1, #0x0
    cmp r0, #0x0
    bge L_021ff2ec
    ldr r0, L_021ff304
    mov r2, #0x3
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_021ff2fc
L_021ff2ec:
    ldr r0, L_021ff304
    mov r2, #0xb
    ldr r0, [r0, #0x0]
    bl Sound_Play
L_021ff2fc:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021ff304: .word gSoundContext
.size Overlay032SpriteWrapper_HitTest, .-Overlay032SpriteWrapper_HitTest

