; Matching retail form; see src/game/randomized_sprite_particle.c.
.text
.extern func_02005058
.extern GraphicsSpriteGroup_ReleaseState

    .global func_0202895c
    .type func_0202895c, @function
func_0202895c: ; 0x0202895c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x44]
    ldr r1, [r4, #0x40]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x30
    bl func_02005058
    add r0, r4, #0x20
    bl func_02005058
    add r0, r4, #0x10
    bl func_02005058
    mov r0, r4
    bl func_02005058
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202895c, . - func_0202895c

