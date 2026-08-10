; Matching retail form; see src/game/area_info_panel_presentation.c.
.text
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy
.extern func_020927b8

    .global func_020280d8
    .type func_020280d8, @function
func_020280d8: ; 0x020280d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x34]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x24
    bl func_02071eb8
    mov r0, r4
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020280d8, . - func_020280d8

