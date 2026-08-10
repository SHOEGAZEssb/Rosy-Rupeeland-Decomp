; Matching retail form; see src/game/direct_sprite_track_presentation.c.
.text
.extern data_020d6158
.extern func_02005058
.extern func_02071eb8
.extern func_02071f38
.extern GraphicsSpriteGroup_ReleaseState

.global func_0201fd64
    .type func_0201fd64, @function
func_0201fd64: ; 0x0201fd64
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201fda0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x14]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x8
    bl func_02071f38
    add r0, r4, #0x1c
    bl func_02005058
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201fda0: .word data_020d6158
    .size func_0201fd64, .-func_0201fd64
