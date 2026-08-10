; Matching retail form; see src/game/launched_sprite_pair_presentation.c.
.text
.extern GameWork_SetFlag
.extern data_020d68e4
.extern func_02005058
.extern func_0201e28c
.extern func_02071eb8
.extern GraphicsSpriteGroup_ReleaseState
.extern gGameWork

    .global func_02024d3c
    .type func_02024d3c, @function
func_02024d3c: ; 0x02024d3c
    stmdb sp!, {r4, lr}
    ldr r1, .L_02024da4
    mov r4, r0
    ldr r0, .L_02024da8
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x3e0
    bl GameWork_SetFlag
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x50]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_02024d7c
    ldr r1, [r4, #0x54]
    bl GraphicsSpriteGroup_ReleaseState
.L_02024d7c:
    add r0, r4, #0x3c
    bl func_02071eb8
    add r0, r4, #0x1c
    bl func_02005058
    add r0, r4, #0xc
    bl func_02005058
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02024da4: .word data_020d68e4
.L_02024da8: .word gGameWork
    .size func_02024d3c, . - func_02024d3c
