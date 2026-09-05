.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern GraphicsArchive_ReleaseCellResource
.extern GraphicsArchive_ReleaseCharacterResource
.extern GraphicsArchive_ReleasePaletteResource
.extern GraphicsSpriteGroup_ReleaseState
.extern data_020f4e18

.global func_0209a07c
func_0209a07c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r0, .L_0209a0d4
    ldr r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseCharacterResource
    ldr r0, .L_0209a0d4
    ldr r1, [r4, #0x14]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleasePaletteResource
    ldr r0, .L_0209a0d4
    ldr r1, [r4, #0x18]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseCellResource
    mov r0, #0x0
    str r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0209a0d4: .word data_020f4e18
.size func_0209a07c, . - func_0209a07c
